<#
    New-BulkADUser.ps1
    Creates AD user accounts from a CSV, places them in their department OU,
    and adds them to their department security group.

    Domain   : enterprise.lab
    CSV cols : FirstName, LastName, Department, Title, OUPath, Group
    Usage    : .\New-BulkADUser.ps1 -CsvPath .\new-users.csv -WhatIf
               .\New-BulkADUser.ps1 -CsvPath .\new-users.csv
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $true)]
    [string]$CsvPath
)

Import-Module ActiveDirectory -ErrorAction Stop

$users = Import-Csv -Path $CsvPath

$created = 0
$skipped = 0
$failed  = 0

# Prompt at runtime so no password is stored in the script file.
# Must meet the domain baseline: 12 characters, complexity required.
$securePassword = Read-Host -Prompt "Temporary password for new accounts" -AsSecureString

Write-Host "`nProcessing $($users.Count) users from $CsvPath`n" -ForegroundColor Cyan

foreach ($user in $users) {

    $displayName = "$($user.FirstName) $($user.LastName)"

    # First initial + surname, lowercase, strip anything not a-z or 0-9
    $sam = ("{0}{1}" -f $user.FirstName.Substring(0,1), $user.LastName).ToLower()
    $sam = $sam -replace '[^a-z0-9]', ''

    try {
        # Idempotency: if the account already exists, skip it.
        if (Get-ADUser -Filter "SamAccountName -eq '$sam'" -ErrorAction SilentlyContinue) {
            Write-Host "  SKIP  $sam - $displayName" -ForegroundColor Yellow
            $skipped++
        }
        else {
            $newUserParams = @{
                Name                  = $displayName
                GivenName             = $user.FirstName
                Surname               = $user.LastName
                SamAccountName        = $sam
                UserPrincipalName     = "$sam@enterprise.lab"
                EmailAddress          = "$sam@enterprise.lab"
                Department            = $user.Department
                Title                 = $user.Title
                Path                  = $user.OUPath
                AccountPassword       = $securePassword
                Enabled               = $true
                ChangePasswordAtLogon = $true
                ErrorAction           = 'Stop'
            }

            if ($PSCmdlet.ShouldProcess($displayName, "Create user $sam")) {
                New-ADUser @newUserParams
                Add-ADGroupMember -Identity $user.Group -Members $sam -ErrorAction Stop

                Write-Host "  OK    $sam - $displayName" -ForegroundColor Green
                $created++
            }
        }
    }
    catch {
        Write-Host "  FAIL  $sam - $($_.Exception.Message)" -ForegroundColor Red
        $failed++
    }
}

Write-Host "`nCreated: $created   Skipped: $skipped   Failed: $failed" -ForegroundColor Cyan