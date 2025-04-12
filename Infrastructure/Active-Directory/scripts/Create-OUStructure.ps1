# Create-OUStructure.ps1
# Purpose: Creates the basic Organizational Unit (OU) structure for Contoso

# Import the Active Directory module
Import-Module ActiveDirectory

# Store the domain information in variables for easy reference
$domainDN = "DC=contoso,DC=local"

# Check if Active Directory module is available
if (!(Get-Module -Name ActiveDirectory)) {
    Write-Host "Active Directory module not found. Please make sure RSAT tools are installed." -ForegroundColor Red
    exit
}

# Function to create an OU if it doesn't already exist
function Create-OrganizationalUnit {
    param (
        [string]$Name,
        [string]$Path
    )
    
    # Check if the OU already exists
    try {
        $existingOU = Get-ADOrganizationalUnit -Filter "Name -eq '$Name'" -SearchBase $Path
        if ($existingOU) {
            Write-Host "OU '$Name' already exists at path '$Path'." -ForegroundColor Yellow
            return $existingOU
        }
    }
    catch {
        # OU doesn't exist, continue with creation
    }
    
    # Create the OU
    try {
        $ou = New-ADOrganizationalUnit -Name $Name -Path $Path -PassThru
        Write-Host "Successfully created OU '$Name' at path '$Path'." -ForegroundColor Green
        return $ou
    }
    catch {
        Write-Host "Failed to create OU '$Name': $_" -ForegroundColor Red
    }
}

# Create top-level OUs
Write-Host "Creating top-level OUs..." -ForegroundColor Cyan
$deptOU = Create-OrganizationalUnit -Name "Departments" -Path $domainDN
$serversOU = Create-OrganizationalUnit -Name "Servers" -Path $domainDN
$workstationsOU = Create-OrganizationalUnit -Name "Workstations" -Path $domainDN
$serviceAccountsOU = Create-OrganizationalUnit -Name "Service Accounts" -Path $domainDN

# Create department OUs
if ($deptOU) {
    Write-Host "Creating department OUs..." -ForegroundColor Cyan
    $departments = @("Sales", "Marketing", "IT", "HR")
    foreach ($dept in $departments) {
        Create-OrganizationalUnit -Name $dept -Path "OU=Departments,$domainDN"
    }
}

# Create server sub-OUs
if ($serversOU) {
    Write-Host "Creating server sub-OUs..." -ForegroundColor Cyan
    $serverTypes = @("Domain Controllers", "File Servers", "Application Servers")
    foreach ($type in $serverTypes) {
        Create-OrganizationalUnit -Name $type -Path "OU=Servers,$domainDN"
    }
}

Write-Host "OU structure creation completed." -ForegroundColor Green