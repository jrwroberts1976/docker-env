# Understanding Git and GitHub

## Overview

Git is the technology that provides distributed version control capabilities, while GitHub provides a platform for hosting repositories, managing collaboration, and automating software delivery workflows.

In this lesson we will explore how Git works, the key concepts behind Git repositories, and how GitHub extends Git with collaboration and enterprise management features.

---

# Learning Objectives

By the end of this lesson you will understand:

- The difference between Git and GitHub.
- How Git repositories are structured.
- How commits track changes.
- How branches are used in development workflows.
- How remote repositories work.
- How GitHub Enterprise Server builds on Git.

---

# What Is Git?

Git is a distributed version control system created to manage changes to files.

Git runs locally on an engineer's computer and provides tools to:

- Create repositories.
- Track changes.
- Record history.
- Create branches.
- Merge changes.
- Synchronise with remote repositories.

Git itself does not require GitHub or any other hosting platform.

A developer can use Git completely offline.

---

# Git vs GitHub

A common misunderstanding is that Git and GitHub are the same thing.

They are related but different technologies.

| Technology | Purpose |
|---|---|
| Git | Version control software |
| GitHub | Platform for hosting and collaborating on Git repositories |
| GitHub Enterprise Server | Self-hosted enterprise GitHub platform |

The relationship can be shown as:

```text
                GitHub Enterprise Server

                         |

                  Git Repository

                         |

                        Git

                         |

                 Engineer Laptop
```

Git provides the version control engine.

GitHub provides the collaboration platform.

---

# Git Repository

## What Is a Repository?

A Git repository is a location where Git stores:

- Files.
- Change history.
- Branch information.
- Configuration.
- Metadata.

A repository can exist:

- On a developer workstation.
- On a GitHub server.
- On GitHub Enterprise Server.
- On another Git hosting platform.

Example:

```text
my-project

├── .git
├── README.md
├── application/
├── infrastructure/
└── documentation/
```

The `.git` directory contains the information Git needs to track the project.

---

# Creating a Git Repository

A new Git repository can be created using:

```bash
git init
```

Example:

```bash
mkdir cloud-project

cd cloud-project

git init
```

This creates a new local Git repository.

---

# The Git Workflow

A typical Git workflow contains several stages.

```text
Working Directory

        |

        v

Staging Area

        |

        v

Local Repository

        |

        v

Remote Repository
```

---

# Working Directory

The working directory contains the files engineers are currently editing.

Example:

```text
project/

├── main.py
├── README.md
└── terraform/
```

Changes made here are not automatically tracked.

---

# Staging Area

The staging area allows engineers to select which changes should be included in the next commit.

Example:

```bash
git add README.md
```

This prepares the file for committing.

---

# Commits

## Recording Changes

A commit is a saved point in the history of a repository.

Example:

```bash
git commit -m "Add initial documentation"
```

A commit records:

- The changes made.
- The author.
- The date.
- A description of the change.

Example history:

```text
commit a1b2c3

Add Azure deployment documentation

        |

commit d4e5f6

Create Terraform configuration

        |

commit g7h8i9

Initial project setup
```

---

# Viewing History

Git allows engineers to review previous changes.

Example:

```bash
git log
```

Example output:

```text
commit a1b2c3

Author: James

Message:
Add Azure documentation
```

This provides a complete audit history of the project.

---

# Branches

## Working Safely

Branches allow engineers to create separate development paths.

The default branch is commonly called:

```text
main
```

Example:

```text
main

|

+---- feature-github-enterprise

|

+---- feature-azure-deployment
```

Branches allow teams to:

- Develop new features.
- Test changes.
- Review work.
- Avoid affecting production code.

---

# Merging Changes

When work on a branch is complete, changes can be merged back.

Example:

```bash
git merge feature-azure-deployment
```

The result:

```text
feature branch

        |

        v

      main
```

In professional environments this is normally completed through a Pull Request.

---

# Remote Repositories

## Sharing Work

A remote repository is a copy of a Git repository hosted on another system.

Examples:

- GitHub.
- GitHub Enterprise Server.
- GitLab.
- Bitbucket.

A developer can connect a local repository to a remote repository.

Example:

```bash
git remote add origin https://github.example.com/project/repository.git
```

---

# Pushing Changes

Sending local commits to the remote repository:

```bash
git push
```

Example:

```text
Developer Laptop

        |

        |

        v

GitHub Enterprise Server
```

---

# Pulling Changes

Downloading changes from the remote repository:

```bash
git pull
```

This keeps local repositories synchronised.

---

# Pull Request Workflow

Enterprise teams normally use Pull Requests.

The workflow:

```text
Developer

   |

Create Branch

   |

Make Changes

   |

Commit Changes

   |

Push Branch

   |

Create Pull Request

   |

Code Review

   |

Merge
```

Pull Requests provide:

- Review process.
- Approval workflow.
- Automated testing.
- Audit history.

---

# GitHub Enterprise Server

GitHub Enterprise Server extends Git with enterprise capabilities.

It provides:

## Organisation Management

Allows companies to manage:

- Multiple teams.
- Multiple projects.
- Repository ownership.

---

## Security Controls

Provides:

- Authentication integration.
- Access controls.
- Audit logging.
- Security policies.

---

## Automation

Supports:

- GitHub Actions.
- Continuous Integration.
- Continuous Deployment workflows.

---

# Our Course Project

Throughout this course we will use a real engineering scenario.

We will:

1. Deploy GitHub Enterprise Server on Microsoft Azure.
2. Configure networking and security.
3. Create organisations and repositories.
4. Connect engineers using Git.
5. Implement automated workflows.

The final architecture will look like:

```text
Microsoft Azure

└── Virtual Machine

    └── GitHub Enterprise Server

        ├── Organisations
        |
        ├── Teams
        |
        ├── Repositories
        |
        └── Automation Pipelines
```

---

# Practical Exercise

## Task

Install Git on your workstation and verify the installation.

Check the version:

```bash
git --version
```

Configure your identity:

```bash
git config --global user.name "Your Name"

git config --global user.email "your.email@example.com"
```

Verify the configuration:

```bash
git config --list
```

---

# Knowledge Check

## Questions

1. What is the difference between Git and GitHub?

2. What information does a Git commit store?

3. Why are branches used?

4. What is the purpose of a Pull Request?

5. What additional features does GitHub Enterprise Server provide?

---

# Summary

In this lesson you learned:

- What Git is.
- The difference between Git and GitHub.
- How repositories work.
- How commits track changes.
- How branches support collaboration.
- How remote repositories work.
- How GitHub Enterprise Server extends Git for enterprise environments.

---

# Next Lesson

Continue to **Installing Git and Creating Your First Repository** to begin working with Git commands and building your first project repository.
