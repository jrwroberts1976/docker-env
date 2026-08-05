# Connecting Git Clients and Working With the Enterprise Repository

## Overview

A Git platform only becomes useful when engineers can connect their local development environments and begin collaborating.

In this lesson we will connect a Git client to the enterprise repository, authenticate with the platform, clone repositories, make changes, and push updates.

This represents the standard workflow used by Cloud Engineers, Developers, and DevOps teams.

---

# Learning Objectives

By the end of this lesson you will understand:

- How Git clients connect to enterprise repositories.
- How repositories are cloned.
- How authentication works.
- How to create commits and push changes.
- How engineers collaborate using remote repositories.

---

# Git Client Workflow

The normal developer workflow:

```text
Engineer Workstation

        |

        |

Git Client

        |

        |

GitHub Enterprise Server

        |

        |

Repository
```

The engineer uses Git commands to communicate with the platform.

---

# Installing Git Client

Before connecting, Git must be installed.

Verify installation:

```bash
git --version
```

Example:

```text
git version 2.x.x
```

---

# Configuring Git Identity

Git records the author of every commit.

Configure your identity:

```bash
git config --global user.name "Your Name"

git config --global user.email "your.email@example.com"
```

Verify:

```bash
git config --list
```

---

# Repository Access

Repositories can normally be accessed using:

## HTTPS

Example:

```bash
https://github.home.local/engineering/project.git
```

Advantages:

- Simple setup.
- Works through standard web ports.
- Easy for new users.

---

## SSH

Example:

```bash
git@github.home.local:engineering/project.git
```

Advantages:

- Strong authentication.
- Common in engineering environments.
- No password entry required after setup.

---

# Creating SSH Keys

Generate an SSH key:

```bash
ssh-keygen -t ed25519
```

Example:

```text
Generating public/private ed25519 key pair.
```

Files created:

```text
~/.ssh/

├── id_ed25519

└── id_ed25519.pub
```

The private key stays on your machine.

The public key is uploaded to GitHub Enterprise Server.

---

# Testing SSH Access

Test the connection:

```bash
ssh -T git@github.home.local
```

Successful authentication confirms the Git client can communicate with the platform.

---

# Cloning a Repository

Cloning creates a local copy of a remote repository.

Example:

```bash
git clone https://github.home.local/engineering/documentation.git
```

Result:

```text
Developer Machine

documentation/

├── .git

├── README.md

└── files
```

---

# Understanding Clone

When cloning, Git downloads:

- Repository files.
- Commit history.
- Branch information.
- Remote configuration.

The remote is automatically configured:

```bash
git remote -v
```

Example:

```text
origin https://github.home.local/engineering/documentation.git
```

---

# Making Your First Change

Enter the repository:

```bash
cd documentation
```

Create a file:

```bash
touch test-file.md
```

Check status:

```bash
git status
```

Example:

```text
Untracked files:

test-file.md
```

---

# Staging Changes

Add the file:

```bash
git add test-file.md
```

Review:

```bash
git status
```

Example:

```text
Changes to be committed:

new file: test-file.md
```

---

# Creating a Commit

Create a commit:

```bash
git commit -m "Add initial test document"
```

The commit is now stored locally.

Example:

```text
Local Repository

|

Commit

|

History Updated
```

---

# Pushing Changes

Upload the commit:

```bash
git push
```

Workflow:

```text
Local Repository

        |

        |

     git push

        |

        |

GitHub Enterprise Server
```

The repository is now updated.

---

# Pulling Team Changes

Other engineers can retrieve changes:

```bash
git pull
```

Example:

```text
Remote Repository

        |

        |

     git pull

        |

        |

Local Repository Updated
```

---

# Working With Branches

Engineers should normally avoid changing the main branch directly.

Create a feature branch:

```bash
git switch -c feature-update-docs
```

Example:

```text
main

|

+-- feature-update-docs
```

---

# Complete Feature Workflow

The enterprise workflow:

```text
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

Review

        |

Merge
```

---

# Pull Request Example

A developer creates:

```text
feature-update-docs
```

The Pull Request requests:

```text
feature-update-docs

        |

        |

        v

main
```

Reviewers can:

- Comment.
- Request changes.
- Approve.
- Merge.

---

# Repository Example For Our Lab

Our engineering repositories:

```text
Engineering Organisation

|

├── infrastructure

├── automation

├── documentation

├── kubernetes

└── docker
```

Example clone:

```bash
git clone https://github.home.local/engineering/infrastructure.git
```

---

# Troubleshooting Git Connections

Common problems:

## Authentication Failure

Check:

```bash
ssh -T git@github.home.local
```

---

## Wrong Remote URL

Check:

```bash
git remote -v
```

Update:

```bash
git remote set-url origin <new-url>
```

---

## Merge Conflicts

Check:

```bash
git status
```

Resolve conflicts, then:

```bash
git add .

git commit
```

---

# Practical Exercise

## Connect To Enterprise Repository

Complete:

1. Configure Git identity.
2. Create SSH keys.
3. Add your public key.
4. Clone a repository.
5. Create a branch.
6. Make a change.
7. Commit the change.
8. Push the branch.

---

# Knowledge Check

## Questions

1. What does `git clone` do?

2. Why are SSH keys useful?

3. What does `git push` do?

4. Why should engineers use branches?

5. What is the purpose of a Pull Request?

---

# Summary

In this lesson you learned:

- How Git clients connect to enterprise repositories.
- How authentication works.
- How repositories are cloned.
- How engineers push and pull changes.
- How teams collaborate using Git workflows.

---

# Next Lesson

Continue to **Building CI/CD Pipelines With GitHub Actions** to automate testing, deployment, and engineering workflows.
