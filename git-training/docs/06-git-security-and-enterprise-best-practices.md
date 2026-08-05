# Git Security and Enterprise Best Practices

## Overview

As organisations move from small development teams to enterprise engineering environments, securing source code becomes critical.

Git repositories often contain valuable intellectual property, infrastructure configuration, automation scripts, and deployment information.

This lesson explores how organisations secure Git workflows, protect repositories, manage access, and prepare for enterprise GitHub deployments.

---

# Learning Objectives

By the end of this lesson you will understand:

- Why Git security is important.
- How authentication and authorisation work.
- The importance of repository permissions.
- How to protect sensitive information.
- Enterprise Git security practices.
- How GitHub Enterprise Server supports secure development.

---

# Why Git Security Matters

Source code is one of an organisation's most valuable assets.

A Git repository may contain:

- Application source code.
- Infrastructure configurations.
- Cloud deployment files.
- Database scripts.
- Automation credentials.
- Internal documentation.

A compromised repository could expose:

- Business information.
- Customer data.
- Cloud infrastructure.
- Security weaknesses.

---

# Authentication vs Authorisation

Two important security concepts are:

| Concept | Meaning |
|---|---|
| Authentication | Proving who you are |
| Authorisation | Determining what you can access |

Example:

```text
User Login

    |

Authentication

    |

Who is this user?

    |

Authorisation

    |

What repositories can they access?
```

---

# Authentication Methods

## Username and Password

Traditional authentication used:

```text
Username

+

Password
```

However, modern enterprise environments generally avoid password-only access.

---

## SSH Keys

SSH keys provide secure authentication using cryptographic keys.

The model:

```text
Developer Machine

Private Key

      |

      |

      v

GitHub Enterprise Server

Public Key
```

The private key remains with the user.

The public key is stored on the Git platform.

---

## Personal Access Tokens

Tokens provide controlled authentication for:

- Command-line access.
- Automation.
- API operations.

Benefits:

- Can be limited.
- Can be revoked.
- Can have expiration dates.

---

# Repository Permissions

Enterprise Git platforms control access using permissions.

Common permission levels:

| Permission | Ability |
|---|---|
| Read | View repository contents |
| Write | Modify repository contents |
| Maintain | Manage repository settings |
| Admin | Full repository control |

---

# Principle of Least Privilege

A key security principle:

> Users should only receive the access they need.

Example:

A developer may require:

```text
Application Repository

Read + Write
```

But may not require:

```text
Production Infrastructure Repository

Administrator Access
```

---

# Organisation and Team Management

Enterprise Git platforms use organisations and teams.

Example:

```text
GitHub Enterprise Server

Organisation

├── Platform Engineering Team
│
├── Application Team
│
├── Security Team
│
└── Operations Team
```

Teams allow administrators to manage access efficiently.

---

# Protecting Sensitive Information

## Never Store Secrets in Git

Repositories should never contain:

- Passwords.
- API keys.
- Private certificates.
- Cloud credentials.

Bad example:

```text
terraform.tfvars

password="MyPassword123"
```

---

Better approaches:

Use:

- Secret management systems.
- Environment variables.
- Cloud identity services.
- Secure vaults.

Example:

```text
Application

      |

      |

Secret Store

      |

      |

Credential Retrieved
```

---

# .gitignore

Git provides a way to exclude files.

The `.gitignore` file defines files that should not be committed.

Example:

```text
.gitignore

*.log

.env

secrets/

terraform.tfvars
```

Example:

```bash
git status
```

Sensitive files will not appear as changes.

---

# Commit Security

Good commit practices include:

## Clear Messages

Good:

```text
Update Azure network configuration
```

Bad:

```text
Changes
```

---

## Small Changes

Small commits are easier to:

- Review.
- Test.
- Roll back.

---

## Review Before Commit

Always check:

```bash
git status
```

Before committing.

Review changes:

```bash
git diff
```

---

# Branch Protection

Enterprise repositories often protect important branches.

Example:

```text
main branch

Protected

|

+ No direct commits

+ Pull Request required

+ Review required

+ Automated tests required
```

This prevents accidental or unauthorised changes.

---

# Security Scanning

Modern Git platforms include security features.

Examples:

## Dependency Scanning

Checks third-party software for vulnerabilities.

---

## Secret Scanning

Detects accidentally committed:

- Passwords.
- API keys.
- Tokens.

---

## Code Scanning

Identifies:

- Security issues.
- Unsafe patterns.
- Vulnerabilities.

---

# GitHub Enterprise Server Security Features

GitHub Enterprise Server provides enterprise controls including:

- Organisation management.
- Repository permissions.
- Authentication integration.
- Audit logs.
- Security policies.
- Automated workflows.

These features help organisations manage Git securely at scale.

---

# Enterprise Git Workflow

A secure workflow:

```text
Developer

 |

Feature Branch

 |

Commit Changes

 |

Security Checks

 |

Pull Request

 |

Code Review

 |

Approval

 |

Merge

 |

Deployment Pipeline
```

---

# Our Azure Deployment Scenario

During this course we will deploy GitHub Enterprise Server into Azure.

Security considerations include:

```text
Microsoft Azure

└── Virtual Network

    ├── Network Security

    ├── Secure Access

    ├── Identity Integration

    └── GitHub Enterprise Server
```

We will later configure:

- Secure administration access.
- Network controls.
- Repository security.
- Enterprise workflows.

---

# Practical Exercise

## Security Review

Review your current Git workflow.

Consider:

1. Do repositories contain sensitive information?
2. Are access permissions appropriate?
3. Are secrets stored safely?
4. Are important branches protected?

---

# Knowledge Check

## Questions

1. What is the difference between authentication and authorisation?

2. Why should secrets never be stored in Git?

3. What is the purpose of `.gitignore`?

4. Why are protected branches important?

5. What security features does GitHub Enterprise Server provide?

---

# Summary

In this lesson you learned:

- Why Git security matters.
- How authentication works.
- How permissions control access.
- How to protect sensitive information.
- How enterprise Git platforms secure development workflows.
- How GitHub Enterprise Server supports secure engineering practices.

---

# Next Lesson

Continue to **Planning a GitHub Enterprise Server Deployment on Azure** to begin designing the cloud architecture for our enterprise Git platform.
