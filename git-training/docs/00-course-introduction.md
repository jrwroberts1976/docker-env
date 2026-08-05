# Course Introduction

## Welcome

Welcome to **Deploying GitHub Enterprise Server on Microsoft Azure**.

This course provides a practical introduction to enterprise source control, cloud infrastructure, and modern DevOps workflows.

Rather than learning Git as a collection of commands, this course follows a realistic engineering project where you will design, deploy, configure, and use an enterprise Git platform.

Throughout the course you will take the role of a **Cloud Infrastructure Engineer** responsible for delivering GitHub Enterprise Server within Microsoft Azure.

---

# The Business Scenario

## The Challenge

Your organisation has grown and engineering teams require a secure platform for managing technical resources.

The business needs a central platform for:

- Application source code
- Infrastructure as Code
- Automation scripts
- Documentation
- Configuration files
- Deployment workflows

The organisation has chosen **GitHub Enterprise Server** as its enterprise source control platform.

Your role is to deploy and prepare the platform for engineering teams.

---

# Your Role

## Cloud Infrastructure Engineer

You have been assigned responsibility for:

- Designing the Azure deployment
- Building the required infrastructure
- Deploying GitHub Enterprise Server
- Configuring secure access
- Creating organisations and repositories
- Supporting Git workflows
- Implementing automation

This course follows the same workflow you would experience in a professional Cloud or Platform Engineering role.

---

# Course Architecture

## What We Will Build

The final environment will look similar to:

```text
Microsoft Azure

└── Resource Group

    └── Virtual Network

        └── GitHub Enterprise Server VM

            ├── Organisation
            │
            ├── Teams
            │
            ├── Users
            │
            └── Git Repositories
```

After deployment, engineers will interact with the platform using Git.

---

# Technologies Covered

## Cloud Platform

During this course you will work with:

- Microsoft Azure
- Azure Virtual Machines
- Azure Networking
- Network Security Groups
- Azure Storage concepts

---

## Operating System

You will learn:

- Linux administration
- Secure SSH access
- System configuration
- Service management

---

## Source Control

You will work with:

- Git
- GitHub Enterprise Server
- Repository management
- Branching strategies
- Pull Requests
- Collaboration workflows

---

## Automation

You will explore:

- GitHub Actions
- CI/CD concepts
- Automated documentation publishing
- Engineering workflows

---

# Learning Approach

Each section follows a practical engineering approach.

## Understand

Learn the concepts behind the technology.

Examples:

- Why version control exists
- How Git works
- Why enterprises use GitHub Enterprise Server

---

## Build

Create the environment step by step.

Examples:

- Deploy Azure resources
- Install GitHub Enterprise Server
- Configure repositories

---

## Test

Validate the deployment.

Examples:

- Access the platform
- Clone repositories
- Push changes
- Test automation workflows

---

## Apply

Use the knowledge in realistic engineering tasks.

Examples:

- Create branches
- Submit Pull Requests
- Manage documentation as code
- Automate deployments

---

# Lab Environment

## Required Resources

To complete this course you will need:

- Microsoft Azure subscription
- Local workstation
- Git client
- SSH client
- Access to deploy Azure resources

---

## Lab Deployment

The course environment is designed for learning purposes.

A production GitHub Enterprise Server deployment should always consider:

- Official sizing requirements
- High availability
- Backup strategy
- Security controls
- Monitoring requirements

---

# End-to-End Workflow

The complete engineering workflow we will build is:

```text
Engineer

   |

   | Git Commit

   v

GitHub Enterprise Server

   |

   | Pull Request

   v

Code Review

   |

   | Approval

   v

Automation Pipeline

   |

   v

Deployment
```

---

# Learning Outcomes

By completing this course you will be able to:

- Explain version control concepts
- Understand Git workflows
- Deploy GitHub Enterprise Server on Azure
- Configure repositories and users
- Use Git from the command line
- Work with branches and Pull Requests
- Understand enterprise source control practices
- Connect Git workflows with automation

---

# Next Section

Continue to **Introduction to Version Control** to learn why organisations moved from manual file management to modern distributed version control systems.
