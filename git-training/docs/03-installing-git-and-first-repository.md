# Installing Git and Creating Your First Repository

## Overview

Before engineers can use Git workflows, Git must be installed and configured on their workstation.

In this lesson we will install Git, configure user settings, create a local repository, make our first commit, and understand the basic workflow used by engineers every day.

This will provide the foundation needed before connecting to GitHub Enterprise Server later in the course.

---

# Learning Objectives

By the end of this lesson you will understand:

- How to install Git on Linux.
- How to verify a Git installation.
- How to configure Git identity settings.
- How to create a Git repository.
- How to create and manage commits.
- How to view repository history.

---

# Installing Git

## Linux Installation

Git is available through standard Linux package repositories.

For Debian and Ubuntu systems:

```bash
sudo apt update

sudo apt install git
```

Verify the installation:

```bash
git --version
```

Example output:

```text
git version 2.43.0
```

---

# Configuring Git

## User Identity

Every Git commit records information about who created the change.

Configure your name:

```bash
git config --global user.name "Your Name"
```

Configure your email address:

```bash
git config --global user.email "your.email@example.com"
```

Example:

```bash
git config --global user.name "James Roberts"

git config --global user.email "james@example.com"
```

---

# Viewing Git Configuration

To view your Git settings:

```bash
git config --list
```

Example output:

```text
user.name=James Roberts
user.email=james@example.com
```

---

!!! note "Engineering Practice"

    Always configure your Git identity before creating commits.

    Incorrect identity information can make tracking ownership and auditing changes difficult.

---

# Creating Your First Repository

## Create a Project Directory

Create a new project:

```bash
mkdir git-demo

cd git-demo
```

Example structure:

```text
git-demo/

└── empty directory
```

---

## Initialise Git

Create a new Git repository:

```bash
git init
```

Example output:

```text
Initialized empty Git repository
```

A hidden `.git` directory is created.

```text
git-demo/

├── .git
└── files
```

The `.git` directory contains:

- Repository metadata.
- Commit history.
- Branch information.
- Git configuration.

---

# Creating Your First File

Create a README file:

```bash
echo "# My First Git Repository" > README.md
```

View the file:

```bash
cat README.md
```

Output:

```text
# My First Git Repository
```

---

# Checking Repository Status

Git can show the current state of the repository.

Run:

```bash
git status
```

Example:

```text
Untracked files:

README.md
```

The file exists, but Git is not tracking it yet.

---

# Adding Files to Git

## Staging Changes

Before creating a commit, files must be added to the staging area.

Add the file:

```bash
git add README.md
```

Check status again:

```bash
git status
```

Example:

```text
Changes to be committed:

new file: README.md
```

---

# Creating Your First Commit

A commit saves a point in the repository history.

Create the commit:

```bash
git commit -m "Initial repository creation"
```

Example output:

```text
[main abc1234] Initial repository creation

1 file changed, 1 insertion(+)
```

---

# Understanding the Git Workflow

The basic Git workflow is:

```text
                 Modify Files

                      |

                      v

              Working Directory

                      |

                 git add

                      |

                      v

               Staging Area

                      |

                git commit

                      |

                      v

            Local Repository
```

---

# Viewing Commit History

Git stores every commit in the repository history.

View history:

```bash
git log
```

Example:

```text
commit abc1234

Author: James Roberts

Message:
Initial repository creation
```

---

# Short Commit History

For a simpler view:

```bash
git log --oneline
```

Example:

```text
abc1234 Initial repository creation
```

---

# Making a Change

Edit the README file:

```bash
echo "Learning Git and GitHub Enterprise" >> README.md
```

Check the difference:

```bash
git diff
```

Example:

```diff
+ Learning Git and GitHub Enterprise
```

---

# Creating Another Commit

Stage the change:

```bash
git add README.md
```

Commit:

```bash
git commit -m "Update README documentation"
```

View history:

```bash
git log --oneline
```

Example:

```text
def5678 Update README documentation

abc1234 Initial repository creation
```

---

# Understanding Commits

Each commit represents a controlled change.

A good commit message should explain:

Good examples:

```text
Add Azure network configuration

Fix authentication issue

Update deployment documentation
```

Poor examples:

```text
Changes

Update

Fix stuff
```

---

!!! tip "Professional Practice"

    Good commit messages make troubleshooting, auditing, and collaboration much easier.

---

# Repository Structure

A typical engineering repository may contain:

```text
project/

├── README.md
├── documentation/
├── application/
├── infrastructure/
├── scripts/
└── tests/
```

Example for our GitHub Enterprise project:

```text
github-enterprise-deployment/

├── terraform/
├── documentation/
├── scripts/
├── diagrams/
└── README.md
```

---

# Practical Exercise

## Create Your First Repository

Complete the following:

1. Install Git.
2. Configure your Git identity.
3. Create a new directory.
4. Initialise a Git repository.
5. Create a README file.
6. Create your first commit.
7. View the commit history.

---

# Knowledge Check

## Questions

1. What command installs Git on Debian-based Linux systems?

2. What information does Git store in a commit?

3. What is the purpose of the staging area?

4. What command shows repository history?

5. Why are meaningful commit messages important?

---

# Summary

In this lesson you learned:

- How to install Git.
- How to configure Git identity.
- How to create a repository.
- How to stage and commit changes.
- How to view repository history.
- The basic Git workflow used by engineers.

---

# Next Lesson

Continue to **Working With Remote Repositories** to learn how Git connects with GitHub Enterprise Server and how engineers share code with teams.
