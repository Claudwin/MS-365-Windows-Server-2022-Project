# Active Directory Foundation - Enterprise Windows Server Lab

## Project Overview
This repository documents my implementation of an enterprise-grade Windows Server 2022 infrastructure with Microsoft 365 integration. The project demonstrates how I would setup a small or mid-sized business to manages user identities permissions and security policies across every machine on their network. 


## Environment Architecture
- **DC01**: Primary Domain Controller (Windows Server 2022 with Desktop Experience)
- **DC02**: Secondary Domain Controller (Windows Server 2022 Core)
- **SRV01**: Application/File Server (Windows Server 2022 with Desktop Experience) 
- **CLIENT01**: Windows 10/11 client machine

  

<p align="center">
Enterprise OU Structure:  <br/>
- Department-based OUs so Group Policy can later be targeted per department without restructuring <br/>
- Nested Server OUs kept separate from user OUs for cleaner permission and policy targeting <br/>
- Group-based access control used for file share permissions rather than assigning permissions to individual users  <br/>
<img src="Infrastructure/Active-Directory/screenshots/OU structure/001-Enterpirse-Structure.png" height="80%" width="80%" alt="Enterprise OU Structure"/>
<br />
<br />

## Implementation Phases

### Phase 1: Active Directory Foundation
- Installation and configuration of Active Directory Domain Services
- Enterprise OU structure creation
- User, group, and service account management
- PowerShell automation scripts for administrative tasks

### Phase 2: Multi-Server Environment
- Secondary domain controller deployment using Server Core
- DNS configuration and redundancy
- Active Directory replication and FSMO roles
- Server hardening and security baseline

### Phase 3: File Server & Group Policy
- File server deployment and configuration
- NTFS permissions and share setup
- Group Policy implementation for security and management
- Folder redirection and drive mapping

### Phase 4: Client Integration
- Windows client deployment and domain joining
- Group Policy application and testing
- User environment configuration
- Performance optimization

### Phase 5: Microsoft 365 Integration
- Microsoft 365 tenant configuration
- Azure AD Connect implementation
- Hybrid identity management
- Exchange Online and SharePoint integration

## Technical Skills Demonstrated
- Active Directory design and implementation
- Windows Server 2022 administration (GUI and PowerShell)
- Group Policy management and troubleshooting
- Security best practices and hardening
- PowerShell scripting and automation
- Microsoft 365 administration and integration
- Documentation and process standardization

## Documentation Structure
- `/documentation` - Detailed technical documentation
- `/scripts` - PowerShell scripts used in the project
- `/screenshots` - Visual documentation of the implementation
- `/templates` - Configuration templates and standards

## Progress Tracking
- [x] Project planning and environment design
- [ ] Phase 1: Active Directory Foundation
- [ ] Phase 2: Multi-Server Environment
- [ ] Phase 3: File Server & Group Policy
- [ ] Phase 4: Client Integration
- [ ] Phase 5: Microsoft 365 Integration

## About
This project was created to demonstrate enterprise-level Windows Server and Microsoft 365 administration skills for potential employers. All configurations follow industry best practices and Microsoft recommendations.

Created by: Claudwin Fortune
