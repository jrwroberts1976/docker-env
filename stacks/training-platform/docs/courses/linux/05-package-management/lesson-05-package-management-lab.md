# Lesson 05 - Package Management Administration Lab

> **Estimated time:** 90–120 minutes  
>
> **Prerequisites:**
> - Module 05 – Package Management
> - Lesson 01 – Understanding Linux Package Managers
> - Lesson 02 – Installing Software Packages
> - Lesson 03 – Updating Linux Systems
> - Lesson 04 – Software Repositories
>
> **Difficulty:** Intermediate
>
> **Hands-on exercises:** Yes

---

# Overview

This practical lab combines the skills learned throughout the Package Management module.

You will perform common Linux administration tasks including:

- Identifying the package manager
- Searching for software
- Installing applications
- Checking installed packages
- Removing software
- Updating the system
- Reviewing package information
- Troubleshooting package problems

The tasks simulate activities performed by Linux system administrators.

---

# Lab Environment

You can complete this lab using:

- Linux server
- Virtual machine
- Raspberry Pi
- Cloud Linux instance

Recommended distributions:

- Debian
- Ubuntu Server
- Rocky Linux

---

# Task 1 - Identify Your Linux Distribution

## Objective

Identify the operating system and available package management tools.

Run:

```bash
cat /etc/os-release
```

Record:

```text
Distribution:

Version:

Package manager:
```

---

# Task 2 - Identify Package Manager

## Debian / Ubuntu

Check:

```bash
which apt
```

Expected:

```text
/usr/bin/apt
```

---

## Red Hat / Rocky Linux

Check:

```bash
which dnf
```

Expected:

```text
/usr/bin/dnf
```

---

# Task 3 - Search for Software Packages

## Objective

Find available software packages.

Search for nginx:

Debian / Ubuntu:

```bash
apt search nginx
```

Red Hat / Rocky:

```bash
dnf search nginx
```

Record:

```text
Package found:

Description:
```

---

# Task 4 - View Package Information

## Objective

Review package details before installation.

Debian / Ubuntu:

```bash
apt show nginx
```

Red Hat / Rocky:

```bash
dnf info nginx
```

Record:

```text
Package version:

Dependencies:

Description:
```

---

# Task 5 - Install Software

## Objective

Install a software package.

Install nginx:

Debian / Ubuntu:

```bash
sudo apt install nginx
```

Red Hat / Rocky:

```bash
sudo dnf install nginx
```

Verify installation:

Debian / Ubuntu:

```bash
dpkg -l | grep nginx
```

Red Hat / Rocky:

```bash
rpm -qa | grep nginx
```

Record:

```text
Installation successful:

Version installed:
```

---

# Task 6 - Check Installed Packages

## Objective

Understand installed software management.

Debian / Ubuntu:

```bash
dpkg -l
```

Red Hat / Rocky:

```bash
rpm -qa
```

Find:

- Installed applications
- Package versions
- Package status

---

# Task 7 - Remove Software

## Objective

Safely remove installed software.

Remove nginx:

Debian / Ubuntu:

```bash
sudo apt remove nginx
```

Red Hat / Rocky:

```bash
sudo dnf remove nginx
```

Verify removal:

```bash
dpkg -l | grep nginx
```

or:

```bash
rpm -qa | grep nginx
```

Record:

```text
Package removed:
```

---

# Task 8 - Update Repository Information

## Objective

Refresh available package information.

Debian / Ubuntu:

```bash
sudo apt update
```

Review:

- Repository connections
- Available updates
- Package information

---

# Task 9 - Update Installed Software

## Objective

Apply available updates.

Debian / Ubuntu:

```bash
sudo apt upgrade
```

Red Hat / Rocky:

```bash
sudo dnf upgrade
```

Record:

```text
Packages updated:

Reboot required:
```

---

# Task 10 - Review Package History

## Objective

Investigate package changes.

Debian / Ubuntu:

```bash
cat /var/log/apt/history.log
```

Red Hat / Rocky:

```bash
dnf history
```

Identify:

- Installed packages
- Removed packages
- Updates performed

---

# Task 11 - Repository Investigation

## Objective

Review configured software sources.

Debian / Ubuntu:

```bash
cat /etc/apt/sources.list
```

Red Hat / Rocky:

```bash
dnf repolist
```

Record:

```text
Configured repositories:
```

---

# Troubleshooting Scenario

## Scenario

A user reports:

> "The application cannot be installed because the package cannot be found."

Investigate the issue.

---

## Step 1 - Check Repository Information

Run:

```bash
sudo apt update
```

Check for:

- Repository errors
- Connection failures
- Missing sources

---

## Step 2 - Search for the Package

Example:

```bash
apt search application_name
```

Confirm:

- Package name
- Package availability

---

## Step 3 - Check Package Manager Status

Check for running package processes:

```bash
ps aux | grep apt
```

---

## Step 4 - Repair Package Problems

If required:

```bash
sudo apt --fix-broken install
```

---

# Knowledge Check

1. What command searches for packages?
2. How do you install software using APT?
3. How do you remove a package?
4. Where are Ubuntu repository settings stored?
5. What command updates package information?
6. How do you list installed Debian packages?
7. Why should repositories be trusted?
8. Why are software updates important?

---

# Lab Completion Checklist

| Task | Complete |
|---|---|
| Identify Linux distribution | ☐ |
| Identify package manager | ☐ |
| Search for software | ☐ |
| View package information | ☐ |
| Install software | ☐ |
| Verify installed packages | ☐ |
| Remove software | ☐ |
| Update package information | ☐ |
| Apply system updates | ☐ |
| Review package history | ☐ |
| Investigate repository configuration | ☐ |
| Complete troubleshooting scenario | ☐ |

---

# Summary

You have completed the Package Management module.

You should now understand:

✓ Linux software packages  
✓ Package managers  
✓ Software repositories  
✓ Installing applications  
✓ Removing software  
✓ Updating Linux systems  
✓ Package troubleshooting  

---

# Module Completion

Status:

🚧 In Progress

---

# Next Module

## Module 06 - Networking Fundamentals

You will learn:

- IP addressing
- Network interfaces
- DNS
- Connectivity troubleshooting
- Remote access