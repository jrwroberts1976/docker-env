# Introduction to Version Control

## Overview

Version control is a fundamental technology used by modern engineering teams to manage changes, collaborate effectively, and maintain a history of technical work.

In this lesson we will explore why version control exists, the problems it solves, and how Git became the industry standard distributed version control system.

---

# Learning Objectives

By the end of this lesson you will understand:

- Why organisations use version control systems.
- The problems caused by managing files manually.
- The difference between centralised and distributed version control.
- Why Git became widely adopted.
- How Git supports modern Cloud and DevOps practices.

---

# What Is Version Control?

Version control is a system that records changes made to files over time.

It allows engineers to:

- Track changes.
- Understand who made modifications.
- Review previous versions.
- Restore older versions.
- Collaborate safely with other engineers.

Modern engineering teams use version control to manage:

| Area | Examples |
|---|---|
| Application Development | Source code, APIs, libraries |
| Infrastructure | Terraform, Kubernetes, Ansible |
| Automation | Scripts and deployment pipelines |
| Documentation | Markdown files and technical guides |

---

# The Problem Before Version Control

## Manual File Management

Before version control systems existed, teams often managed files by creating multiple copies.

Example:

```text
Project

├── application-final.zip
├── application-final-v2.zip
├── application-final-v3.zip
└── application-final-really-final.zip
```

This approach creates several problems:

- Which file is the latest version?
- Who made the changes?
- Why was a change made?
- Can we restore an older version?
- How do multiple engineers work together?

As engineering teams grew, this approach became difficult to maintain.

---

# Centralised Version Control

## The Shared Repository Model

The first generation of version control systems introduced a central server that stored the official copy of files.

Examples include:

- CVS
- Subversion (SVN)
- Microsoft Team Foundation Version Control (TFVC)

The model looked like:

```text
              Central Repository

                     |

        ----------------------------

        |            |             |

    Developer    Developer    Developer
```

Engineers connected to the central repository to:

- Download changes.
- Upload changes.
- Review history.
- Manage versions.

---

# Advantages of Centralised Version Control

Centralised systems introduced important improvements.

## Change Tracking

Teams could understand:

- What changed.
- When it changed.
- Who made the change.

## Access Control

Administrators could manage:

- User permissions.
- Repository access.
- Security settings.

## Collaboration

Multiple engineers could work on the same project using a shared system.

---

# Limitations of Centralised Version Control

Although centralised systems improved collaboration, they introduced limitations.

## Server Dependency

The central server became a critical dependency.

If the server was unavailable:

- Engineers could not commit changes.
- History could not be accessed.
- Development work could be blocked.

## Limited Offline Capability

Many operations required access to the central server.

Examples:

- Viewing history.
- Creating commits.
- Comparing changes.

## Scaling Challenges

Large organisations required:

- Larger servers.
- More administration.
- Complex permission management.

A different approach was required.

---

# Distributed Version Control

## The Git Model

Git introduced distributed version control.

Instead of relying on one central repository, every engineer has a complete copy of the repository.

```text
                 Git Repository

                       |

        --------------------------------

        |              |              |

    Developer     Developer     Developer

    Complete      Complete      Complete

    Repository    Repository    Repository
```

Each repository contains:

- Files.
- Commit history.
- Branches.
- Tags.

---

# Why Git Became Popular

## Speed

Most Git operations happen locally.

Examples:

```bash
git status

git log

git branch
```

This means many operations do not require communication with a remote server.

---

## Reliability

Every developer has a complete repository copy.

Benefits:

- Work can continue offline.
- History is available locally.
- Recovery is easier.

---

## Branching

Git made branching fast and simple.

Example:

```text
main

|

+-- feature-login

+-- bugfix-security

+-- documentation-update
```

Branches allow engineers to:

- Develop features safely.
- Test changes.
- Review work before release.

---

# Git in Modern Engineering

Git is now used across many areas of technology.

## Application Development

Examples:

- Software applications.
- APIs.
- Libraries.
- Web platforms.

## Infrastructure as Code

Cloud engineers use Git to manage:

- Terraform files.
- Ansible playbooks.
- Kubernetes manifests.
- Docker Compose files.

Example:

```text
infrastructure

├── terraform
├── kubernetes
├── docker
└── ansible
```

## Documentation as Code

Documentation can also be managed using Git.

Examples:

- Markdown documentation.
- Engineering guides.
- Training material.
- Architecture documentation.

This training platform itself follows a documentation-as-code approach.

---

# GitHub Enterprise Server

Git provides the version control engine, but enterprises often require additional platform capabilities.

GitHub Enterprise Server provides:

- Self-hosted GitHub platform.
- Organisation management.
- Team permissions.
- Repository security.
- Audit logging.
- Enterprise authentication.

In this course, we will deploy GitHub Enterprise Server into Microsoft Azure and use it as our enterprise Git platform.

---

# Practical Exercise

## Task

Consider the following questions:

1. What problems would your organisation experience without version control?

2. What files or systems would benefit from being managed using Git?

3. Why might an enterprise choose a self-hosted Git platform?

---

# Knowledge Check

## Questions

1. What problem does version control solve?

2. What is the difference between centralised and distributed version control?

3. Why is Git useful for Infrastructure as Code?

4. Why might an organisation choose GitHub Enterprise Server?

---

# Summary

In this lesson you learned:

- Why version control exists.
- The problems with manual file management.
- How centralised version control works.
- How Git introduced distributed version control.
- Why Git became the industry standard.
- How Git supports Cloud and DevOps engineering.

---

# Next Lesson

Continue to **Understanding Git and GitHub** to learn how Git repositories work and how GitHub Enterprise Server extends Git with enterprise collaboration features.
