# Planning a GitHub Enterprise Server Deployment on Azure

## Overview

Enterprise Git platforms require careful planning before deployment.

Unlike a simple Git repository hosted on a developer workstation, GitHub Enterprise Server is a complete application platform that requires compute, networking, storage, security, and operational planning.

In this lesson we will design the Azure architecture for our GitHub Enterprise Server deployment and understand the components required before installation.

---

# Learning Objectives

By the end of this lesson you will understand:

- The architecture of GitHub Enterprise Server on Azure.
- The Azure resources required for deployment.
- Network and security considerations.
- Storage and backup requirements.
- High-level enterprise deployment planning.

---

# Deployment Scenario

## Business Requirement

Our organisation requires an internal Git platform for engineering teams.

The platform must provide:

- Secure source code management.
- Team collaboration.
- Repository hosting.
- Automation workflows.
- Audit capabilities.

The chosen solution is:

**GitHub Enterprise Server deployed in Microsoft Azure**

---

# High-Level Architecture

The planned environment:

```text
Microsoft Azure

Resource Group

|

+-- Virtual Network

    |

    +-- Subnet

        |

        +-- Network Security Group

        |

        +-- GitHub Enterprise Server VM

            |

            +-- GitHub Application

            |

            +-- Repository Storage

            |

            +-- Management Access
```

---

# Azure Components

## Resource Group

A resource group provides a logical container for Azure resources.

Example:

```text
Resource Group

github-enterprise-rg

|

├── Virtual Machine

├── Network Interface

├── Disk Storage

└── Network Security Group
```

Benefits:

- Easier management.
- Resource organisation.
- Access control.
- Cost tracking.

---

# Virtual Machine

GitHub Enterprise Server runs as an appliance on a supported virtual machine.

The VM provides:

- Compute resources.
- Operating environment.
- Application hosting.

Planning considerations:

- CPU requirements.
- Memory requirements.
- Storage capacity.
- Network connectivity.

---

# Virtual Network

Azure Virtual Network provides private networking.

Example:

```text
Virtual Network

10.0.0.0/16

|

+-- GitHub Subnet

    10.0.1.0/24
```

The network provides:

- Private communication.
- Security boundaries.
- Controlled access.

---

# Network Security

Security rules control access to the platform.

Example:

```text
Internet

 |

HTTPS 443

 |

GitHub Enterprise Server
```

Required access normally includes:

| Port | Purpose |
|---|---|
| 443 | Web access |
| 22 | SSH administration |
| 25/587 | Email notifications if required |

Only required ports should be exposed.

---

# Identity and Access

Enterprise deployments require identity planning.

Possible integrations:

- Local GitHub accounts.
- Active Directory.
- Microsoft Entra ID.
- LDAP.
- SAML authentication.

Example:

```text
User

 |

Microsoft Entra ID

 |

GitHub Enterprise Server

 |

Repository Access
```

---

# Storage Planning

GitHub Enterprise Server stores:

- Repository data.
- User data.
- Configuration.
- Logs.

Storage planning must consider:

- Repository size.
- Number of users.
- Growth over time.
- Backup requirements.

---

# Backup Strategy

Enterprise systems require reliable recovery.

A backup strategy should consider:

## What Must Be Protected?

Examples:

- Repository data.
- Configuration.
- User information.
- Application settings.

---

## Recovery Planning

Consider:

- Recovery Point Objective (RPO).
- Recovery Time Objective (RTO).

| Term | Meaning |
|---|---|
| RPO | Maximum acceptable data loss |
| RTO | Maximum acceptable recovery time |

---

# Security Architecture

A secure deployment includes:

```text
Users

 |

Secure Authentication

 |

Network Controls

 |

GitHub Enterprise Server

 |

Protected Repositories

 |

Audit Logging
```

Security controls include:

- Restricted administration access.
- Strong authentication.
- Network security rules.
- Regular updates.
- Monitoring.

---

# Monitoring and Operations

A production GitHub Enterprise Server deployment requires operational monitoring.

Monitor:

## Infrastructure

Examples:

- CPU usage.
- Memory usage.
- Disk usage.
- Network traffic.

---

## Application

Examples:

- Repository availability.
- Authentication status.
- Background jobs.
- System health.

---

## Security

Examples:

- Login activity.
- Permission changes.
- Administrative actions.

---

# Infrastructure as Code Approach

As Cloud Engineers, we should avoid manual deployment where possible.

The target approach:

```text
Terraform

 |

Azure Resources

 |

GitHub Enterprise Server Deployment

 |

Configuration Automation
```

Infrastructure as Code provides:

- Repeatable deployments.
- Version-controlled infrastructure.
- Easier recovery.
- Improved auditing.

---

# Course Deployment Workflow

The complete project workflow:

```text
Planning

 |

Azure Architecture Design

 |

Infrastructure Deployment

 |

GitHub Enterprise Installation

 |

Configuration

 |

Repository Creation

 |

Automation
```

---

# Our Example Environment

For this training course we will build:

```text
Azure

github-enterprise-rg

|

+-- Virtual Network

|

+-- Linux Administration Access

|

+-- GitHub Enterprise Server

|

+-- Engineering Repositories

|

+-- CI/CD Workflows
```

---

# Practical Exercise

## Design Exercise

Before deployment, document:

1. Required Azure resources.
2. Network design.
3. Security requirements.
4. Backup approach.
5. Access model.

Create a simple architecture diagram.

---

# Knowledge Check

## Questions

1. Why should GitHub Enterprise Server deployments be planned before installation?

2. What Azure resource provides network isolation?

3. Why are Network Security Groups important?

4. Why is backup planning required?

5. Why should Cloud Engineers use Infrastructure as Code?

---

# Summary

In this lesson you learned:

- How GitHub Enterprise Server fits into Azure.
- The Azure resources required for deployment.
- Network and security considerations.
- Storage and backup planning.
- How enterprise platforms should be designed.

---

# Next Lesson

Continue to **Deploying Azure Infrastructure with Terraform** to begin creating the cloud environment required for GitHub Enterprise Server.
