# Windows Server 2022 Domain Controller Setup


### Phase 1: Active Directory Foundation
- Installation of Windows Server 2022
- Installation and configuration of Active Directory Domain Services

## Environment Details

- **Server Name**: DC01
- **Operating System**: Windows Server 2022 Standard
- **Domain**: enterprise.lab
- **IP Address**: 192.168.1.10
- **Subnet Mask**: 255.255.255.0
- **Default Gateway**: 192.168.1.1
- **DNS Server**: 127.0.0.1 (self)

## Installation Process

### Server Preparation
1. Installed Windows Server 2022 Standard Edition
2. Installed all Windows Updates
3. Set computer name to DC01
4. Configured static IP address

### Network Configuration
- Configured static IP address: 192.168.1.10
- Set subnet mask: 255.255.255.0
- Set default gateway: 192.168.1.1
- Set DNS server to 127.0.0.1 (loopback)

### Active Directory Domain Services Installation
1. Installed AD DS role through Server Manager
2. Promoted server to domain controller
3. Created new forest with domain name: enterprise.lab
4. Set forest and domain functional levels to Windows Server 2016
5. Configured DNS service on the domain controller
6. Set DSRM password for recovery purposes

### Post-Installation Verification
1. Verified Active Directory and DNS services are running
2. Confirmed domain controller is properly registered in DNS
3. Verified forest and domain information
4. Created first domain admin account

## Command Reference

Key PowerShell commands used in this process:

```powershell```
# Install AD DS role
```Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools```

# Promote server to domain controller
```Install-ADDSForest -DomainName "enterprise.lab" -DomainNetbiosName "ENTERPRISE" -ForestMode "WinThreshold" -DomainMode "WinThreshold" -InstallDns:$true```

# Verify Active Directory installation
```Get-ADForest```
```Get-ADDomain```
```Get-ADDomainController -Filter *```

# Create domain admin account
```New-ADUser -Name "Admin User" -SamAccountName "adminuser" -UserPrincipalName "adminuser@enterprise.lab" -Enabled $true -PasswordNeverExpires $true```
```Add-ADGroupMember -Identity "Domain Admins" -Members "adminuser"```



