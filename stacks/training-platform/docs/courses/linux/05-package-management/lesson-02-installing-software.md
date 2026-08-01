# Lesson 02 - Installing Software Packages

> **Estimated time:** 60–90 minutes  
>
> **Prerequisites:**
> - Module 05 – Package Management
> - Lesson 01 – Understanding Linux Package Managers
>
> **Difficulty:** Beginner
>
> **Hands-on exercises:** Yes

---

# Overview

One of the main responsibilities of a Linux administrator is installing and managing software.

Linux package managers provide a controlled method for installing applications from trusted software repositories.

In this lesson you will learn how to:

- Search for available software
- Install applications
- Verify installed packages
- Remove software
- Understand package dependencies
- Troubleshoot installation problems

---

# Finding Available Software

Before installing software, administrators normally search available packages.

Package managers search configured software repositories.

---

# Searching Packages with APT

Debian and Ubuntu systems use `apt`.

Search for a package:

```bash
apt search package_name
```

Example:

```bash
apt search nginx
```

Example output:

```text
nginx - high performance web server
nginx-common - small, powerful web server
```

The search results provide:

- Package name
- Description
- Available version

---

# Searching Packages with DNF

Red Hat-based systems use `dnf`.

Search for a package:

```bash
dnf search package_name
```

Example:

```bash
dnf search nginx
```

---

# Installing Software

Package managers download software from repositories and install all required dependencies.

---

# Installing Software with APT

Install a package:

```bash
sudo apt install package_name
```

Example:

```bash
sudo apt install nginx
```

APT will:

1. Check package availability
2. Download required files
3. Install dependencies
4. Configure the application
5. Register the package

---

# Installing Software with DNF

Install a package:

```bash
sudo dnf install package_name
```

Example:

```bash
sudo dnf install nginx
```

---

# Understanding Dependencies

Applications often require additional software to run.

Example:

```text
nginx

requires:

├── libraries
├── configuration files
└── supporting packages
```

The package manager automatically identifies and installs dependencies.

---

# Viewing Package Information

Before installing software, administrators may want more information.

---

## APT Package Information

View package details:

```bash
apt show package_name
```

Example:

```bash
apt show nginx
```

Information displayed:

- Package version
- Description
- Dependencies
- Package size
- Repository source

---

## DNF Package Information

View package details:

```bash
dnf info package_name
```

Example:

```bash
dnf info nginx
```

---

# Checking Installed Software

Administrators often need to confirm whether software is installed.

---

## Debian / Ubuntu

List installed packages:

```bash
dpkg -l
```

Search installed packages:

```bash
dpkg -l | grep package_name
```

Example:

```bash
dpkg -l | grep nginx
```

---

## Red Hat / Rocky Linux

List installed packages:

```bash
rpm -qa
```

Search installed packages:

```bash
rpm -qa | grep package_name
```

---

# Removing Software

Software can be removed when it is no longer required.

---

# Removing Packages with APT

Remove a package:

```bash
sudo apt remove package_name
```

Example:

```bash
sudo apt remove nginx
```

Remove package and configuration files:

```bash
sudo apt purge package_name
```

Example:

```bash
sudo apt purge nginx
```

---

# Removing Packages with DNF

Remove a package:

```bash
sudo dnf remove package_name
```

Example:

```bash
sudo dnf remove nginx
```

---

# Cleaning Unused Packages

Over time, systems may contain unused dependencies.

Debian / Ubuntu:

```bash
sudo apt autoremove
```

This removes packages no longer required.

---

# Installing Local Package Files

Sometimes software is provided as a downloaded package file.

Examples:

```text
application.deb
application.rpm
```

---

## Installing DEB Files

Using dpkg:

```bash
sudo dpkg -i package.deb
```

If dependencies are missing:

```bash
sudo apt install -f
```

---

## Installing RPM Files

Using rpm:

```bash
sudo rpm -ivh package.rpm
```

---

# Package Installation Troubleshooting

Common installation problems include:

## Package Not Found

Example:

```text
Unable to locate package
```

Possible causes:

- Repository information is outdated
- Package name is incorrect
- Repository is unavailable

Solution:

```bash
sudo apt update
```

---

## Dependency Problems

Example:

```text
Unmet dependencies
```

Solution:

```bash
sudo apt --fix-broken install
```

---

## Permission Errors

Example:

```text
Permission denied
```

Solution:

Use administrative privileges:

```bash
sudo command
```

---

# Practical Exercise

## Task 1 - Search for Software

Search for nginx:

```bash
apt search nginx
```

Record:

```text
Package found:
Description:
```

---

## Task 2 - View Package Information

Run:

```bash
apt show nginx
```

Record:

```text
Version:
Dependencies:
```

---

## Task 3 - Install Software

Install nginx:

```bash
sudo apt install nginx
```

Verify:

```bash
dpkg -l | grep nginx
```

---

## Task 4 - Remove Software

Remove nginx:

```bash
sudo apt remove nginx
```

Confirm:

```bash
dpkg -l | grep nginx
```

---

# Knowledge Check

1. What command searches for packages using APT?
2. What command installs software on Debian systems?
3. Why are dependencies important?
4. What command shows installed Debian packages?
5. What is the difference between `remove` and `purge`?
6. How do you install a local `.deb` file?
7. What command removes unused dependencies?

---

# Summary

In this lesson you learned:

✓ How to search for software packages  
✓ How to install applications using package managers  
✓ How dependencies are handled  
✓ How to check installed software  
✓ How to remove packages safely  
✓ How to troubleshoot common installation issues  

---

# Next Lesson

## Lesson 03 - Updating Linux Systems

You will learn:

- Updating package information
- Installing system updates
- Security updates
- Upgrade strategies
- Maintenance practices