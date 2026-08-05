# Configuring GitHub Enterprise Server and Creating Your First Organisation

## Overview

After the GitHub Enterprise Server platform has been installed, the next stage is configuration.

Enterprise Git platforms require more than simply hosting repositories. They need structured administration, identity management, security controls, and organisational planning.

In this lesson we will configure the initial platform settings and create the first organisation that will host engineering repositories.

---

# Learning Objectives

By the end of this lesson you will understand:

- How initial GitHub Enterprise Server configuration works.
- How administrator accounts are managed.
- How organisations are created.
- How teams and permissions are structured.
- How repositories are planned.
- How enterprise Git platforms are prepared for engineering teams.

---

# Initial Configuration Process

After installation, the platform requires initial setup.

The configuration workflow:

```text
GitHub Enterprise Server

        |

        |

Administrator Login

        |

        |

System Configuration

        |

        |

Authentication Setup

        |

        |

Organisation Creation

        |

        |

Repository Setup
```

---

# Administrator Account

The first account created is normally the platform administrator.

The administrator is responsible for:

- Platform configuration.
- User management.
- Organisation management.
- Security settings.
- System maintenance.

Example:

```text
Administrator

|

+-- Manage Users

+-- Manage Organisations

+-- Configure Security

+-- Monitor Platform
```

---

# Administrator Best Practices

Administrator accounts should follow security best practices.

## Use Strong Authentication

Recommended:

- Multi-factor authentication.
- Secure passwords.
- Identity provider integration.

---

## Limit Administrator Access

Only authorised users should have administrative privileges.

Example:

```text
Normal User

    |

Repository Access


Administrator

    |

Platform Management
```

---

# Authentication Planning

Enterprise platforms usually integrate with existing identity systems.

Common options:

| Method | Purpose |
|---|---|
| Local Accounts | Small environments |
| LDAP | Enterprise directories |
| SAML | Single Sign-On |
| Microsoft Entra ID | Cloud identity integration |

Example:

```text
User

 |

Identity Provider

 |

GitHub Enterprise Server

 |

Repository Access
```

---

# Creating an Organisation

Organisations provide a way to group repositories and users.

Example:

```text
GitHub Enterprise Server

Organisation:

Engineering

|

├── Infrastructure

├── Applications

├── Automation

└── Documentation
```

---

# Organisation Naming

Good organisation names should:

- Describe the purpose.
- Remain consistent.
- Scale as teams grow.

Examples:

Good:

```text
Engineering
Platform
CloudTeam
```

Poor:

```text
Test123
Project1
Temp
```

---

# Creating Teams

Teams allow permissions to be managed efficiently.

Example:

```text
Engineering Organisation

|

+-- Platform Team

|

+-- Development Team

|

+-- Operations Team

|

+-- Security Team
```

---

# Team Permissions

Instead of managing individual users:

```text
User 1

User 2

User 3
```

Manage teams:

```text
Platform Team

|

Repository Access
```

Benefits:

- Easier administration.
- Better security.
- Faster onboarding.

---

# Repository Planning

Repositories should represent logical engineering projects.

Example:

```text
Engineering Organisation

|

├── terraform-platform

├── kubernetes-homelab

├── docker-services

├── documentation

└── automation-scripts
```

---

# Repository Access Model

Example:

```text
Repository

terraform-platform

|

+-- Platform Team

    Read / Write


+-- Security Team

    Read


+-- Administrators

    Full Control
```

---

# Repository Creation Workflow

The normal workflow:

```text
Create Organisation

        |

Create Team Structure

        |

Create Repository

        |

Assign Permissions

        |

Develop Code

        |

Review Changes
```

---

# Creating a Repository

Example repository:

```text
Name:

homelab-infrastructure


Purpose:

Infrastructure as Code for the lab environment
```

Repository contents:

```text
homelab-infrastructure

├── terraform

├── ansible

├── documentation

├── scripts

└── README.md
```

---

# Repository Documentation

Every engineering repository should include documentation.

Minimum recommended files:

```text
README.md

LICENSE

CONTRIBUTING.md

.gitignore
```

---

# Branch Protection

Important repositories should protect the main branch.

Example:

```text
main branch

Protected

|

+-- Pull Request Required

+-- Code Review Required

+-- Automated Checks Required
```

---

# Audit and Governance

Enterprise platforms provide visibility into:

- User activity.
- Repository changes.
- Permission changes.
- Administrative actions.

Audit information helps with:

- Security investigations.
- Compliance.
- Operational reviews.

---

# Integrating With Our Training Platform

Our Git platform will support the wider engineering environment.

Example:

```text
GitHub Enterprise Server

        |

        |

Repositories

        |

        |

CI/CD Pipelines

        |

        |

Training Platform Updates
```

The same workflow used by companies will manage our documentation and projects.

---

# Practical Exercise

## Create Your First Organisation

Plan the following:

Organisation:

```text
Engineering
```

Teams:

```text
Platform

Development

Operations

Security
```

Repositories:

```text
infrastructure

automation

documentation

applications
```

Define access permissions for each team.

---

# Knowledge Check

## Questions

1. What is the purpose of an organisation?

2. Why are teams used instead of individual permissions?

3. Why should repositories have documentation?

4. Why protect the main branch?

5. What information can audit logs provide?

---

# Summary

In this lesson you learned:

- How GitHub Enterprise Server is configured.
- How administrator access is managed.
- How organisations and teams work.
- How repositories should be structured.
- How enterprise permissions are planned.

---

# Next Lesson

Continue to **Connecting Git Clients and Working With the Enterprise Repository** to connect engineers to the Git platform and begin collaborative development.
