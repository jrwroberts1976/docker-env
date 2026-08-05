# Building CI/CD Pipelines With GitHub Actions

## Overview

Modern engineering teams do not manually build, test, and deploy every change.

Continuous Integration and Continuous Deployment (CI/CD) pipelines automate the process of validating code changes and delivering applications or infrastructure updates.

In this lesson we will explore how Git repositories trigger automated workflows using GitHub Actions and how this fits into an enterprise engineering environment.

---

# Learning Objectives

By the end of this lesson you will understand:

- What CI/CD means.
- How automation pipelines work.
- How GitHub Actions are structured.
- How workflows are triggered.
- How repositories can automate engineering tasks.
- How CI/CD supports Cloud and DevOps practices.

---

# What Is CI/CD?

CI/CD describes the automation process used to build, test, and deploy changes.

The two main concepts are:

| Term | Meaning |
|---|---|
| Continuous Integration | Automatically testing and validating changes |
| Continuous Deployment | Automatically delivering approved changes |

---

# Traditional Deployment Process

Without automation:

```text
Developer

 |

Make Change

 |

Send Files

 |

Manual Testing

 |

Manual Deployment

 |

Production
```

Problems:

- Slow.
- Error prone.
- Difficult to repeat.
- Difficult to audit.

---

# Automated CI/CD Process

With pipelines:

```text
Developer

 |

Git Commit

 |

Push Changes

 |

Pipeline Trigger

 |

Automated Testing

 |

Validation

 |

Deployment

 |

Production
```

Benefits:

- Faster delivery.
- Consistent results.
- Reduced human error.
- Complete audit history.

---

# What Is GitHub Actions?

GitHub Actions is an automation platform built into GitHub and GitHub Enterprise Server.

It allows repositories to run automated workflows.

Examples:

- Testing applications.
- Building containers.
- Running Terraform.
- Deploying infrastructure.
- Publishing documentation.

---

# GitHub Actions Architecture

The workflow:

```text
Repository

        |

        |

GitHub Actions Workflow

        |

        |

Runner

        |

        |

Tasks Execute
```

---

# Workflow Files

GitHub Actions workflows are stored inside:

```text
.github/workflows/
```

Example:

```text
repository

├── .github

│   └── workflows

│       └── pipeline.yml

|

├── application

└── README.md
```

---

# YAML Workflow Structure

GitHub Actions uses YAML configuration files.

Example:

```yaml
name: Documentation Build

on:
  push:
    branches:
      - main

jobs:

  build:

    runs-on: ubuntu-latest

    steps:

      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Run build
        run: echo "Building project"
```

---

# Workflow Components

A workflow contains several parts.

---

## Name

Defines the workflow name.

Example:

```yaml
name: Build Application
```

---

## Trigger

Defines when the workflow runs.

Example:

```yaml
on:
  push:
    branches:
      - main
```

This runs whenever changes are pushed to the main branch.

---

## Jobs

Jobs define the tasks performed.

Example:

```yaml
jobs:

  test:

    runs-on: ubuntu-latest
```

---

## Steps

Steps are individual actions.

Example:

```yaml
steps:

- name: Run Tests

  run: ./test.sh
```

---

# Example CI Pipeline

A simple software pipeline:

```text
Developer

 |

Push Code

 |

GitHub Actions

 |

Install Dependencies

 |

Run Tests

 |

Build Application

 |

Publish Result
```

---

# Infrastructure CI/CD

Cloud Engineers also use pipelines.

Example Terraform workflow:

```text
Engineer

 |

Update Terraform

 |

Git Commit

 |

Pull Request

 |

Terraform Validate

 |

Terraform Plan

 |

Approval

 |

Terraform Apply
```

---

# Example Terraform Pipeline

Example workflow:

```yaml
name: Terraform Validation

on:
  pull_request:

jobs:

  terraform:

    runs-on: ubuntu-latest

    steps:

      - name: Checkout
        uses: actions/checkout@v4

      - name: Terraform Init
        run: terraform init

      - name: Terraform Validate
        run: terraform validate
```

---

# Documentation Automation

Our training platform is also a good example.

Workflow:

```text
Markdown Change

        |

Git Push

        |

GitHub Actions

        |

MkDocs Build

        |

Website Update
```

This is documentation-as-code.

---

# Security in CI/CD

Automation pipelines must be secured.

Consider:

- Protecting secrets.
- Restricting permissions.
- Reviewing workflow changes.
- Auditing pipeline activity.

---

# Secrets Management

Never store credentials directly in workflow files.

Bad:

```yaml
password: MyPassword123
```

Better:

```yaml
password: ${{ secrets.DATABASE_PASSWORD }}
```

Secrets should be stored securely.

---

# Branch Protection With Pipelines

A professional workflow:

```text
Developer

 |

Feature Branch

 |

Pull Request

 |

Automated Tests

 |

Code Review

 |

Merge
```

The pipeline helps prevent bad changes entering production.

---

# Our Homelab CI/CD Architecture

Our target environment:

```text
Git Repository

        |

        |

GitHub Enterprise Server

        |

        |

GitHub Actions

        |

        |

Deployment Automation

        |

        |

Homelab Services
```

Possible automation examples:

- Docker deployments.
- Documentation publishing.
- Infrastructure updates.
- Configuration changes.

---

# Practical Exercise

## Create Your First Workflow

Create:

```text
.github/workflows/test.yml
```

Add:

```yaml
name: Test Pipeline

on:
  push:

jobs:

  test:

    runs-on: ubuntu-latest

    steps:

      - name: Test message
        run: echo "Pipeline successful"
```

Commit:

```bash
git add .github/workflows/test.yml

git commit -m "Add first CI pipeline"

git push
```

---

# Knowledge Check

## Questions

1. What is CI/CD?

2. Where are GitHub Actions workflows stored?

3. What triggers a workflow?

4. Why should secrets not be stored in Git?

5. How can pipelines improve engineering quality?

---

# Summary

In this lesson you learned:

- What CI/CD means.
- How GitHub Actions works.
- How workflows are structured.
- How automation supports engineering teams.
- How Git repositories become the foundation for deployment pipelines.

---

# Next Lesson

Continue to **Managing GitHub Enterprise Server Operations** to learn about backups, upgrades, monitoring, and maintaining the platform.
