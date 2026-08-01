# Microsoft Azure Training

Welcome to the **Microsoft Azure Training** repository.

This course provides a practical, hands-on learning path for Microsoft Azure cloud administration, infrastructure engineering, security, automation, and DevOps practices.

The goal is to develop the skills required for roles such as:

- Azure Administrator
- Cloud Engineer
- Infrastructure Engineer
- DevOps Engineer
- Cloud Solutions Architect

This repository documents the learning journey through practical labs, projects, automation, and real-world Azure deployments.

---

# Learning Objectives

By completing this course you will learn how to:

- Understand Microsoft Azure cloud concepts
- Manage Azure subscriptions and resources
- Configure Microsoft Entra ID
- Implement Azure networking
- Deploy and manage virtual machines
- Configure Azure storage
- Deploy applications using Azure services
- Manage containers and Kubernetes
- Implement monitoring and security
- Automate Azure deployments
- Use Infrastructure as Code
- Manage cloud costs
- Design secure and resilient cloud environments

---

# Prerequisites

Before starting this course you should have a basic understanding of:

## Operating Systems

Recommended knowledge:

- Windows administration
- Linux administration
- Command line usage
- File permissions
- Services and processes

---

## Networking Fundamentals

You should understand:

- IP addressing
- Subnets
- DNS
- DHCP
- Routing
- Firewalls
- Ports and protocols
- TCP/IP concepts

Recommended protocols:

- HTTP/HTTPS
- SSH
- RDP

---

## Virtualisation

Basic understanding of:

- Virtual machines
- Hypervisors
- Virtual networking
- Storage concepts

Examples:

- VMware
- Hyper-V
- VirtualBox
- KVM

---

## Scripting Knowledge

Helpful but not mandatory:

- Bash scripting
- PowerShell
- Python basics
- JSON/YAML syntax

---

## Cloud Fundamentals

Recommended knowledge:

- Cloud computing concepts
- IaaS
- PaaS
- SaaS
- Public vs private cloud
- Shared responsibility model

---

# Required Accounts

You will need:

- Microsoft Account
- Azure Subscription

Azure Free Account:

https://azure.microsoft.com/free/

The free tier provides enough resources to complete many of the labs in this course.

---

# Required Tools

## Git

Used for version control.

Verify installation:

```bash
git --version
```

---

## Visual Studio Code

Used for:

- Azure development
- Terraform
- Bicep
- Documentation
- Scripts

Recommended extensions:

- Azure Account
- Azure Resources
- Azure CLI Tools
- Azure Terraform
- Bicep

---

## Azure CLI

Used for Azure administration from the command line.

Verify:

```bash
az --version
```

Login:

```bash
az login
```

---

## PowerShell

Used for:

- Azure administration
- Automation
- Scripting

Check version:

```powershell
$PSVersionTable
```

---

## Terraform

Used for Infrastructure as Code.

Verify:

```bash
terraform version
```

---

## Docker

Used for container modules.

Verify:

```bash
docker version
```

---

# Recommended Hardware

Minimum:

- 8GB RAM
- 20GB free storage
- Internet connection

Recommended:

- 16GB RAM
- Linux workstation or WSL2
- Visual Studio Code
- GitHub account

---

# Course Structure

```
azure-training/

├── README.md

├── modules/

│   ├── module-01-azure-fundamentals
│   ├── module-02-azure-portal
│   ├── module-03-resource-management
│   ├── module-04-entra-id
│   ├── module-05-governance
│   ├── module-06-azure-cli
│   ├── module-07-powershell
│   ├── module-08-networking
│   ├── module-09-security
│   ├── module-10-virtual-machines
│   ├── module-11-storage
│   ├── module-12-databases
│   ├── module-13-app-services
│   ├── module-14-containers
│   ├── module-15-aks
│   ├── module-16-monitoring
│   ├── module-17-backup-recovery
│   ├── module-18-key-vault
│   ├── module-19-infrastructure-as-code
│   ├── module-20-automation
│   ├── module-21-cost-management
│   └── module-22-final-project

├── labs/

├── scripts/

├── diagrams/

├── projects/

└── docs/
```

---

# Learning Modules

## Module 01 - Azure Fundamentals

Topics:

- Cloud computing concepts
- Azure regions
- Availability Zones
- Azure services overview
- Resource Manager

---

## Module 02 - Azure Portal

Topics:

- Azure Portal navigation
- Cloud Shell
- Creating resources
- Managing resources
- Dashboards

---

## Module 03 - Resource Management

Topics:

- Resource Groups
- Subscriptions
- Tags
- Naming standards
- Resource lifecycle

---

## Module 04 - Microsoft Entra ID

Topics:

- Users
- Groups
- Roles
- Authentication
- MFA
- Conditional Access

---

## Module 05 - Governance

Topics:

- Management Groups
- Azure Policy
- Resource Locks
- Compliance
- Cost controls

---

## Module 06 - Azure CLI

Topics:

- Azure CLI installation
- Authentication
- Resource management
- Automation scripts

---

## Module 07 - PowerShell

Topics:

- Azure PowerShell modules
- Automation
- Administration scripts

---

## Module 08 - Networking

Topics:

- Virtual Networks
- Subnets
- DNS
- Routing
- Network Security Groups
- Peering

---

## Module 09 - Security

Topics:

- Azure Firewall
- Defender for Cloud
- Private Endpoints
- Security recommendations

---

## Module 10 - Virtual Machines

Topics:

- Linux VMs
- Windows VMs
- Availability Sets
- Scale Sets
- Extensions

---

## Module 11 - Storage

Topics:

- Storage Accounts
- Blob Storage
- File Shares
- Storage Tiers

---

## Module 12 - Databases

Topics:

- Azure SQL
- PostgreSQL
- MySQL
- Cosmos DB

---

## Module 13 - Application Services

Topics:

- App Service
- Deployment Slots
- Certificates
- Domains

---

## Module 14 - Containers

Topics:

- Docker
- Azure Container Instances
- Container Registry

---

## Module 15 - Azure Kubernetes Service

Topics:

- AKS deployment
- Kubernetes workloads
- Services
- Scaling
- Updates

---

## Module 16 - Monitoring

Topics:

- Azure Monitor
- Log Analytics
- Alerts
- Metrics
- Application Insights

---

## Module 17 - Backup and Recovery

Topics:

- Recovery Vaults
- VM Backup
- Restore
- Disaster Recovery

---

## Module 18 - Key Vault

Topics:

- Secrets
- Certificates
- Keys
- Managed Identity

---

## Module 19 - Infrastructure as Code

Topics:

- ARM Templates
- Bicep
- Terraform

---

## Module 20 - Automation

Topics:

- Azure Automation
- Runbooks
- Logic Apps
- Scheduled tasks

---

## Module 21 - Cost Management

Topics:

- Cost Analysis
- Budgets
- Azure Advisor
- Optimisation

---

# Final Project

Build a complete Azure environment including:

- Azure Virtual Network
- Multiple subnets
- Linux Virtual Machine
- Windows Virtual Machine
- Storage Account
- Database service
- Application hosting
- Monitoring
- Backup
- RBAC
- Key Vault
- Infrastructure as Code deployment

---

# Certification Path

This course supports preparation for:

## AZ-900
Microsoft Azure Fundamentals

## AZ-104
Azure Administrator Associate

## AZ-305
Azure Solutions Architect Expert

## AZ-500
Azure Security Engineer Associate

## AZ-400
DevOps Engineer Expert

---

# Portfolio Goals

By completing this repository you will have evidence of:

- Cloud administration skills
- Azure infrastructure deployment
- Automation experience
- Infrastructure as Code
- Security implementation
- Monitoring configuration
- Troubleshooting ability
- Documentation skills

---

# Learning Method

Each module follows:

1. Learn the concepts
2. Complete practical labs
3. Deploy Azure resources
4. Automate tasks
5. Document solutions
6. Commit changes to GitHub
7. Review and improve

---

# Progress Tracker

| Module | Status |
|---|---|
| Azure Fundamentals | ☐ |
| Azure Portal | ☐ |
| Resource Management | ☐ |
| Entra ID | ☐ |
| Governance | ☐ |
| Azure CLI | ☐ |
| PowerShell | ☐ |
| Networking | ☐ |
| Security | ☐ |
| Virtual Machines | ☐ |
| Storage | ☐ |
| Databases | ☐ |
| App Services | ☐ |
| Containers | ☐ |
| AKS | ☐ |
| Monitoring | ☐ |
| Backup | ☐ |
| Key Vault | ☐ |
| Terraform | ☐ |
| Bicep | ☐ |
| Automation | ☐ |
| Cost Management | ☐ |
| Final Project | ☐ |

---

# Licence

This repository is created for learning, training, and professional development.

Feel free to fork, modify, and expand as your Azure skills develop.

---

**Happy learning Azure! ☁️*
