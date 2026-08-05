# Git Branching and Collaboration Workflows

## Overview

Branches are one of the most powerful features of Git.

They allow engineers to work on changes independently without affecting the main project code.

In professional engineering environments, branches are used with Pull Requests, code reviews, and automated testing to create a controlled development process.

In this lesson we will explore Git branching strategies and how teams collaborate using GitHub Enterprise Server.

---

# Learning Objectives

By the end of this lesson you will understand:

- What a Git branch is.
- Why engineers use branches.
- How to create and manage branches.
- How branches support team collaboration.
- How Pull Requests work.
- How enterprise teams manage changes safely.

---

# What Is a Git Branch?

A branch is an independent line of development within a Git repository.

The default branch is commonly:

```text
main
```

A branch allows engineers to create changes without affecting the main codebase.

Example:

```text
main

|

+----------------

                 |

          feature-login
```

The feature branch can be developed and tested separately.

---

# Why Use Branches?

Without branches, all engineers would make changes directly to the main project.

Example:

```text
main

Developer 1 changes files

Developer 2 changes files

Developer 3 changes files
```

This creates problems:

- Changes can conflict.
- Bugs can be introduced.
- Testing becomes difficult.
- Reviewing work becomes harder.

Branches provide isolation.

---

# Creating a Branch

## Viewing Existing Branches

To see available branches:

```bash
git branch
```

Example:

```text
* main
```

The `*` shows the current branch.

---

## Creating a New Branch

Create a branch:

```bash
git branch feature-documentation
```

Example:

```text
main

|

+-- feature-documentation
```

---

## Switching Branches

Move to the new branch:

```bash
git checkout feature-documentation
```

Or using the newer command:

```bash
git switch feature-documentation
```

---

## Creating and Switching in One Command

A common workflow:

```bash
git switch -c feature-documentation
```

This:

1. Creates the branch.
2. Switches to the branch.

---

# Branch Development Workflow

A typical engineer workflow:

```text
main

 |

 |

Create Branch

 |

 |

feature-change

 |

 |

Commit Changes

 |

 |

Push Branch

 |

 |

Pull Request

 |

 |

Review

 |

 |

Merge
```

---

# Making Changes on a Branch

Example:

```bash
echo "New feature" >> README.md
```

Check the change:

```bash
git status
```

Stage the change:

```bash
git add README.md
```

Create a commit:

```bash
git commit -m "Add new feature documentation"
```

---

# Pushing a Branch

Branches can be pushed to a remote repository.

Example:

```bash
git push -u origin feature-documentation
```

The remote repository now contains:

```text
Remote Repository

main

|

+-- feature-documentation
```

---

# Pull Requests

## Code Review Process

A Pull Request (PR) is a request to merge changes from one branch into another.

Example:

```text
feature-branch

        |

        |

        v

   Pull Request

        |

        |

        v

main branch
```

Pull Requests allow teams to:

- Review code.
- Discuss changes.
- Run automated tests.
- Approve changes.

---

# Pull Request Workflow

The normal enterprise workflow:

```text
Developer

    |

Create Feature Branch

    |

Make Changes

    |

Commit

    |

Push Branch

    |

Create Pull Request

    |

Code Review

    |

Automated Testing

    |

Approval

    |

Merge
```

---

# Code Reviews

Code reviews are an important engineering practice.

Reviewers check:

## Quality

Is the change:

- Correct?
- Maintainable?
- Easy to understand?

---

## Security

Does the change introduce:

- Vulnerabilities?
- Exposed credentials?
- Unsafe configuration?

---

## Standards

Does the change follow:

- Coding standards?
- Documentation requirements?
- Engineering practices?

---

# Branch Naming Standards

Professional teams use consistent branch names.

Examples:

| Purpose | Example |
|---|---|
| Feature | feature/add-monitoring |
| Bug Fix | bugfix/fix-login |
| Documentation | docs/update-readme |
| Security | security/update-dependencies |

Good branch names explain the purpose of the work.

---

# Merging Changes

When a Pull Request is approved, changes are merged.

Example:

```bash
git merge feature-documentation
```

Result:

```text
Before:

main

|

+-- feature-documentation


After:

main

|

Changes included
```

---

# Merge Conflicts

Sometimes two engineers modify the same part of a file.

Example:

```text
Developer 1:

Line 10 = Version 1


Developer 2:

Line 10 = Version 2
```

Git cannot automatically decide which version is correct.

This creates a merge conflict.

---

# Resolving Conflicts

The workflow:

1. Git identifies the conflict.
2. Engineer reviews the differences.
3. Correct version is selected.
4. Changes are committed.

Example:

```bash
git status
```

Shows:

```text
both modified: README.md
```

After fixing:

```bash
git add README.md

git commit -m "Resolve merge conflict"
```

---

# GitHub Enterprise Server Collaboration Model

In an enterprise environment:

```text
Developer

 |

Feature Branch

 |

GitHub Enterprise Server

 |

Pull Request

 |

Review Team

 |

Automation Pipeline

 |

Production
```

This provides:

- Controlled changes.
- Audit history.
- Security checks.
- Team collaboration.

---

# Our Azure GitHub Enterprise Project

During this course, our workflow will be:

```text
Engineer

 |

Git Repository

 |

GitHub Enterprise Server

 |

Pull Request

 |

GitHub Actions

 |

Azure Deployment
```

The same workflow is used by modern Cloud Engineering teams.

---

# Practical Exercise

## Create a Feature Branch

Complete the following:

Create a branch:

```bash
git switch -c feature-test
```

Create a change:

```bash
echo "Testing branches" >> README.md
```

Commit the change:

```bash
git add README.md

git commit -m "Test feature branch"
```

Push the branch:

```bash
git push -u origin feature-test
```

---

# Knowledge Check

## Questions

1. Why do engineers use branches?

2. What is the purpose of a Pull Request?

3. Why are code reviews important?

4. What causes merge conflicts?

5. Why are branch naming standards useful?

---

# Summary

In this lesson you learned:

- What Git branches are.
- Why branches are used.
- How to create and manage branches.
- How Pull Requests support collaboration.
- How code reviews improve quality.
- How enterprise teams manage changes safely.

---

# Next Lesson

Continue to **Git Security and Enterprise Best Practices** to learn how organisations protect repositories, manage access, and secure Git workflows.
