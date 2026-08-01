# Lesson 03 - Updating Linux Systems

> **Estimated time:** 60–90 minutes  
>
> **Prerequisites:**
> - Module 05 – Package Management
> - Lesson 01 – Understanding Linux Package Managers
> - Lesson 02 – Installing Software Packages
>
> **Difficulty:** Beginner to Intermediate
>
> **Hands-on exercises:** Yes

---

# Overview

Keeping Linux systems updated is an essential administration task.

Updates provide:

- Security fixes
- Bug fixes
- Performance improvements
- New features
- Software stability improvements

Linux administrators must understand how to safely update systems while reducing the risk of service disruption.

This lesson covers updating Linux systems using common package management tools.

---

# Why Update Linux Systems?

Regular updates help maintain:

- System security
- Application reliability
- Hardware compatibility
- Performance
- Vendor support

Unpatched systems may contain:

- Security vulnerabilities
- Software bugs
- Outdated components
- Unsupported versions

---

# Package Updates vs Distribution Upgrades

There are different types of updates.

## Package Update

Updates installed software packages.

Example:

```text
nginx version 1.24
        |
        v
nginx version 1.26
```

Usually includes:

- Bug fixes
- Security patches
- Minor improvements

---

## Distribution Upgrade

Moves the operating system to a newer release.

Example:

```text
Ubuntu 24.04 LTS

        |

Ubuntu 26.04 LTS
```

Distribution upgrades require more planning because they can affect:

- Applications
- Configuration files
- Services
- Hardware compatibility

---

# Updating Debian and Ubuntu Systems

Debian-based systems use:

```bash
apt
```

The update process normally has two stages:

1. Refresh package information
2. Install available updates

---

# Updating Package Information

Run:

```bash
sudo apt update
```

This downloads the latest package information from repositories.

Example:

```text
Hit:1 http://archive.ubuntu.com
Get:2 security updates
Reading package lists...
```

This does not install updates.

It only checks what updates are available.

---

# Installing Updates

Install available updates:

```bash
sudo apt upgrade
```

The system will:

- Download updated packages
- Install new versions
- Keep existing configuration

Example:

```text
20 packages can be upgraded.
```

---

# Full Upgrade

For more complex updates:

```bash
sudo apt full-upgrade
```

This allows:

- Installing new dependencies
- Removing conflicting packages
- Updating core components

Use carefully on production systems.

---

# Checking Available Updates

View available upgrades:

```bash
apt list --upgradable
```

Example:

```text
nginx
openssl
curl
```

---

# Removing Unused Packages After Updates

Old dependencies may no longer be required.

Remove unused packages:

```bash
sudo apt autoremove
```

Clean downloaded package files:

```bash
sudo apt clean
```

---

# Updating Red Hat and Rocky Linux Systems

Red Hat-based systems use:

```bash
dnf
```

---

# Checking Available Updates

Run:

```bash
dnf check-update
```

This checks repositories for available updates.

---

# Installing Updates

Update the system:

```bash
sudo dnf upgrade
```

or:

```bash
sudo dnf update
```

Both commands update installed packages.

---

# Viewing Update History

Package managers keep records of changes.

## Debian / Ubuntu

View package logs:

```bash
cat /var/log/apt/history.log
```

---

## Red Hat / Rocky Linux

View DNF history:

```bash
dnf history
```

Example:

```text
ID   Command
1    Install nginx
2    Upgrade packages
```

---

# Security Updates

Security updates are especially important.

They fix vulnerabilities in:

- Operating system components
- Libraries
- Applications
- Services

---

# Checking Security Updates on Ubuntu

Install update tools:

```bash
sudo apt install unattended-upgrades
```

Enable automatic security updates:

```bash
sudo dpkg-reconfigure unattended-upgrades
```

---

# Update Planning

Before updating production systems:

## Check Current State

Review:

- Running services
- Disk space
- System health
- Current versions

Commands:

```bash
systemctl --failed
```

```bash
df -h
```

---

## Backup Important Data

Before major updates:

- Backup configuration files
- Backup application data
- Confirm recovery procedures

---

## Test Updates

Where possible:

1. Test updates in development
2. Review changes
3. Schedule maintenance window
4. Apply updates

---

# Reboot Requirements

Some updates require a reboot.

Common examples:

- Kernel updates
- Hardware drivers
- Core system libraries

Check if reboot is required:

```bash
ls /var/run/reboot-required
```

---

# Troubleshooting Update Problems

## Repository Errors

Example:

```text
Failed to fetch package information
```

Possible causes:

- Network problems
- Repository unavailable
- Incorrect configuration

---

## Locked Package Database

Example:

```text
Could not get lock
```

Another package process may be running.

Check:

```bash
ps aux | grep apt
```

---

## Broken Packages

Repair:

```bash
sudo apt --fix-broken install
```

---

# Practical Exercise

## Task 1 - Check Available Updates

Run:

```bash
sudo apt update
```

Then:

```bash
apt list --upgradable
```

Record:

```text
Available updates:
```

---

## Task 2 - Update Installed Packages

Run:

```bash
sudo apt upgrade
```

Record:

```text
Packages updated:
```

---

## Task 3 - Review Update History

Run:

```bash
cat /var/log/apt/history.log
```

Identify:

- Installed packages
- Updated packages
- Dates

---

## Task 4 - Check System Health

Run:

```bash
systemctl --failed
```

and:

```bash
df -h
```

Record:

```text
Failed services:

Disk usage:
```

---

# Knowledge Check

1. What command refreshes APT package information?
2. What command installs available Ubuntu updates?
3. What is the difference between a package update and distribution upgrade?
4. Why are security updates important?
5. What command shows available Ubuntu updates?
6. What command shows DNF update history?
7. Why should updates be tested before production systems?

---

# Summary

In this lesson you learned:

✓ Why Linux systems need regular updates  
✓ The difference between updates and upgrades  
✓ How to update Debian and Ubuntu systems  
✓ How to update Red Hat-based systems  
✓ How to review update history  
✓ How to troubleshoot update problems  
✓ How administrators safely manage system updates  

---

# Next Lesson

## Lesson 04 - Software Repositories

You will learn:

- How Linux repositories work
- Repository configuration
- Package sources
- Trusted software sources
- Managing repository settings