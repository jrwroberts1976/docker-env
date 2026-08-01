# Module 05 - Package Management

> **Estimated time:** 4–5 hours  
>
> **Prerequisites:**
> - Module 00 – Introduction to Linux
> - Module 01 – Command Line Fundamentals
> - Module 02 – Linux Filesystem Administration
> - Module 03 – Users and Groups
> - Module 04 – Processes and Services
>
> **Difficulty:** Beginner to Intermediate
>
> **Hands-on exercises:** Yes

---

# Overview

Linux systems use package managers to install, update, remove and maintain software.

Package management is a fundamental Linux administration skill because administrators need to:

- Install applications
- Keep systems updated
- Manage software dependencies
- Remove unwanted software
- Troubleshoot package problems
- Maintain system security

This module introduces Linux package management concepts and the tools used on common Linux distributions.

---

# Learning Objectives

By completing this module you will be able to:

- Understand what a Linux package is
- Understand how package managers work
- Use package management commands
- Install software packages
- Remove software packages
- Update installed software
- Understand software repositories
- Manage package dependencies
- Troubleshoot common package issues

---

# Lessons

| Lesson | Topic | Status |
|---|---|---|
| 01 | Understanding Linux Package Managers | 🚧 In Progress |
| 02 | Installing Software Packages | ☐ Planned |
| 03 | Updating Linux Systems | ☐ Planned |
| 04 | Software Repositories | ☐ Planned |
| 05 | Package Management Administration Lab | ☐ Planned |

---

# Topics Covered

## Understanding Linux Package Managers

Topics:

- What is a software package?
- Package management concepts
- Package databases
- Package dependencies
- Package versions
- Repository management

Package managers covered:

Debian / Ubuntu:

```bash
apt
apt-cache
dpkg
```

Red Hat / Rocky Linux:

```bash
dnf
rpm
```

---

## Installing Software Packages

Topics:

- Searching for packages
- Installing applications
- Removing software
- Checking installed packages
- Understanding dependencies

Commands:

Debian / Ubuntu:

```bash
apt install
apt remove
apt search
dpkg -l
```

Red Hat / Rocky Linux:

```bash
dnf install
dnf remove
rpm -qa
```

---

## Updating Linux Systems

Topics:

- Package updates
- Security updates
- Upgrade strategies
- Maintenance windows
- Update troubleshooting

Commands:

Debian / Ubuntu:

```bash
apt update
apt upgrade
```

Red Hat / Rocky Linux:

```bash
dnf check-update
dnf upgrade
```

---

## Software Repositories

Topics:

- What repositories are
- Repository configuration
- Package sources
- Trusted software sources
- Third-party repositories

Configuration locations:

Debian / Ubuntu:

```text
/etc/apt/sources.list
/etc/apt/sources.list.d/
```

Red Hat / Rocky Linux:

```text
/etc/yum.repos.d/
```

---

# Practical Lab

The module concludes with a package management administration exercise.

Tasks include:

- Searching for software packages
- Installing applications
- Checking installed software
- Removing applications
- Updating the system
- Reviewing package information
- Troubleshooting package issues

---

# Summary

By the end of this module you should understand:

- How Linux software packages work
- How package managers maintain software
- How to install and remove applications
- How to update Linux systems safely
- How repositories provide software
- How to troubleshoot package problems

---

# Module Progress

Current Status:

🚧 In Progress

---

# Next Module

Module 06 - Networking Fundamentals

You will learn:

- IP addressing
- Network interfaces
- DNS
- Connectivity troubleshooting
- Remote access