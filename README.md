# Enterprise Windows Server & Microsoft 365 Administration Project

## Project Overview
This repository documents my implementation of an enterprise-grade Windows Server 2022 infrastructure with Microsoft 365 integration. The project demonstrates advanced system administration skills and best practices for a professional corporate environment.

## Environment Architecture
- **DC01**: Primary Domain Controller (Windows Server 2022 with Desktop Experience)
- **DC02**: Secondary Domain Controller (Windows Server 2022 Core)
- **SRV01**: Application/File Server (Windows Server 2022 with Desktop Experience) 
- **CLIENT01**: Windows 10/11 client machine

![Network Diagram](./documentation/images/network-diagram.png)

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
