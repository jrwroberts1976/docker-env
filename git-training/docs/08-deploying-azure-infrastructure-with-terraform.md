# Deploying Azure Infrastructure with Terraform

## Overview

Cloud engineering teams increasingly use Infrastructure as Code (IaC) to build and manage cloud environments.

Instead of manually creating resources through a web portal, engineers define infrastructure using configuration files that can be version controlled, reviewed, tested, and deployed repeatedly.

In this lesson we will use Terraform to create the Azure foundation required for our GitHub Enterprise Server deployment.

---

# Learning Objectives

By the end of this lesson you will understand:

- What Infrastructure as Code means.
- How Terraform manages Azure resources.
- How Terraform configuration files are structured.
- How to initialise and validate Terraform.
- How to create an Azure deployment plan.
- How Git is used to manage infrastructure changes.

---

# What Is Infrastructure as Code?

Infrastructure as Code (IaC) is the practice of managing infrastructure through configuration files rather than manual processes.

Traditional approach:

```text
Engineer

 |

Azure Portal

 |

Create Resources Manually
```

Infrastructure as Code approach:

```text
Engineer

 |

Terraform Files

 |

Git Repository

 |

Automated Deployment

 |

Azure Resources
```

---

# Benefits of Infrastructure as Code

## Repeatability

The same environment can be created multiple times.

Example:

```text
Development Environment

        |

        |

Same Terraform Code

        |

        |

Production Environment
```

---

## Version Control

Infrastructure changes are stored in Git.

Example:

```text
terraform/

├── main.tf
├── network.tf
├── variables.tf
└── outputs.tf
```

Changes can be:

- Reviewed.
- Approved.
- Audited.
- Reverted.

---

## Automation

Terraform allows engineers to automate:

- Resource creation.
- Configuration changes.
- Environment deployment.

---

# What Is Terraform?

Terraform is an Infrastructure as Code tool created by HashiCorp.

Terraform uses configuration files written in HashiCorp Configuration Language (HCL).

Example:

```hcl
resource "azurerm_resource_group" "github" {

  name     = "github-enterprise-rg"

  location = "UK South"

}
```

This describes the desired Azure resource.

---

# Terraform Workflow

The Terraform workflow:

```text
Write Configuration

        |

        v

terraform init

        |

        v

terraform plan

        |

        v

terraform apply

        |

        v

Azure Resources Created
```

---

# Terraform Files

A typical Terraform project:

```text
github-enterprise-azure/

├── main.tf

├── provider.tf

├── variables.tf

├── outputs.tf

└── terraform.tfstate
```

---

# Provider Configuration

Terraform requires a provider to communicate with Azure.

Example:

```hcl
terraform {

 required_providers {

   azurerm = {

     source = "hashicorp/azurerm"

   }

 }

}

provider "azurerm" {

 features {}

}
```

The Azure provider allows Terraform to create Azure resources.

---

# Creating the Resource Group

The first Azure resource is normally a resource group.

Example:

```hcl
resource "azurerm_resource_group" "github" {

 name = "github-enterprise-rg"

 location = "UK South"

}
```

This creates:

```text
Azure

Resource Group

github-enterprise-rg
```

---

# Creating the Virtual Network

GitHub Enterprise Server requires network connectivity.

Example:

```hcl
resource "azurerm_virtual_network" "github" {

 name = "github-vnet"

 address_space = [
   "10.0.0.0/16"
 ]

 location = azurerm_resource_group.github.location

 resource_group_name = azurerm_resource_group.github.name

}
```

Result:

```text
Virtual Network

10.0.0.0/16
```

---

# Creating a Subnet

A subnet provides a network segment for GitHub Enterprise Server.

Example:

```hcl
resource "azurerm_subnet" "github" {

 name = "github-subnet"

 address_prefixes = [
   "10.0.1.0/24"
 ]

 resource_group_name = azurerm_resource_group.github.name

 virtual_network_name = azurerm_virtual_network.github.name

}
```

Architecture:

```text
Virtual Network

10.0.0.0/16

|

+-- GitHub Subnet

    10.0.1.0/24
```

---

# Terraform Initialisation

Before using Terraform:

```bash
terraform init
```

This:

- Downloads providers.
- Prepares the working directory.
- Initialises Terraform.

---

# Terraform Validation

Check configuration:

```bash
terraform validate
```

Example:

```text
Success! The configuration is valid.
```

---

# Terraform Plan

Before making changes:

```bash
terraform plan
```

Terraform shows:

- Resources to create.
- Resources to modify.
- Resources to remove.

Example:

```text
Plan:

+ Create resource group

+ Create virtual network

+ Create subnet
```

---

# Terraform Apply

Deploy the infrastructure:

```bash
terraform apply
```

Terraform asks for confirmation before creating resources.

Example:

```text
Do you want to perform these actions?

yes
```

---

# Terraform State

Terraform maintains a state file.

Example:

```text
terraform.tfstate
```

The state file records:

- Resources created.
- Resource identifiers.
- Current configuration.

Example:

```text
Terraform

      |

terraform.tfstate

      |

Azure Resources
```

---

# Managing Terraform with Git

Terraform projects should be stored in Git.

Example:

```text
Git Repository

github-enterprise-deployment/

├── terraform/

│   ├── main.tf

│   ├── network.tf

│   └── variables.tf

└── README.md
```

Workflow:

```text
Engineer

 |

Change Terraform

 |

Git Commit

 |

Pull Request

 |

Review

 |

Terraform Apply
```

---

# Our GitHub Enterprise Deployment

The target workflow:

```text
GitHub Repository

        |

        |

Terraform Code

        |

        |

Azure Deployment

        |

        |

GitHub Enterprise Server
```

The infrastructure itself becomes part of the engineering lifecycle.

---

# Practical Exercise

## Create Terraform Project

Complete the following:

Create a directory:

```bash
mkdir github-enterprise-terraform

cd github-enterprise-terraform
```

Create files:

```text
main.tf

provider.tf

variables.tf

outputs.tf
```

Initialise Terraform:

```bash
terraform init
```

Validate:

```bash
terraform validate
```

Review the plan:

```bash
terraform plan
```

---

# Knowledge Check

## Questions

1. What is Infrastructure as Code?

2. Why should Terraform files be stored in Git?

3. What command initialises Terraform?

4. What is the purpose of terraform plan?

5. Why does Terraform use a state file?

---

# Summary

In this lesson you learned:

- What Infrastructure as Code is.
- How Terraform manages Azure resources.
- How Terraform projects are structured.
- How to initialise and validate Terraform.
- How Git and Terraform work together.
- How we will use Terraform for our GitHub Enterprise deployment.

---

# Next Lesson

Continue to **Building the Azure Network and Security Configuration** to create the secure Azure foundation for GitHub Enterprise Server.
