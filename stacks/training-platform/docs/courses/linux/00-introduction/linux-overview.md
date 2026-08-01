# Module 00 - Introduction to Linux

## Overview

Linux is one of the most widely used operating systems in the world.

It powers:

- Web servers
- Cloud platforms
- Network devices
- Supercomputers
- Mobile devices
- Embedded systems
- Enterprise applications

This module introduces the Linux operating system, its history, common distributions, and the basic concepts required before beginning Linux administration.

---

# Learning Objectives

By the end of this module, you should understand:

- What Linux is
- How Linux differs from other operating systems
- The history of Linux
- What Linux distributions are
- The difference between Linux desktop and server environments
- Common Linux terminology
- How Linux is used in modern IT environments
- How Linux systems are accessed

---

# What is Linux?

Linux is an open-source operating system based on the Linux kernel.

An operating system provides the interface between:

```
+----------------------+
|   Applications       |
+----------------------+
|   Operating System   |
+----------------------+
|   Hardware           |
+----------------------+
```

Linux manages:

- CPU resources
- Memory
- Storage
- Network interfaces
- User accounts
- Security controls
- Running applications

---

# Linux Components

A Linux system is made up of several key components.

```
+--------------------------------+
| Applications                   |
+--------------------------------+
| Shell / Command Line           |
+--------------------------------+
| System Libraries               |
+--------------------------------+
| Linux Kernel                   |
+--------------------------------+
| Hardware                       |
+--------------------------------+
```

---

# Kernel

The kernel is the core component of Linux.

It manages communication between software and hardware.

Examples:

- CPU scheduling
- Memory management
- Device drivers
- Network communication

The kernel is responsible for allowing applications to communicate with the underlying hardware.

Check your kernel version:

```bash
uname -r
```

Example output:

```
6.18.34+rpt-rpi-v8
```

---

# Linux History

Linux has its roots in earlier operating systems and open-source projects.

Understanding the history helps explain why Linux is designed the way it is today.

---

# UNIX

Linux was heavily influenced by UNIX.

UNIX was developed in the 1970s and introduced many concepts still used today:

- Multi-user systems
- File permissions
- Command-line administration
- Small tools working together

Many Linux concepts originated from UNIX design principles.

---

# GNU Project

The GNU Project began in 1983 with the goal of creating a free UNIX-like operating system.

Many Linux systems include GNU tools such as:

- Bash
- Core utilities
- Compilers
- System libraries

---

# Linux Kernel

In 1991, Linus Torvalds created the first Linux kernel.

The project grew rapidly because:

- The source code was freely available
- Developers worldwide contributed
- Organisations adopted Linux

Today Linux is maintained by thousands of contributors and is used across many industries.

---

# What is a Linux Distribution?

A Linux distribution combines several components into a complete operating system.

A distribution normally includes:

- Linux kernel
- System tools
- Package manager
- Applications
- Configuration tools

Examples:

| Distribution | Common Use |
|-|-|
| Ubuntu | Servers, cloud, desktop |
| Debian | Stable servers |
| Rocky Linux | Enterprise systems |
| Fedora | Development/testing |
| Arch Linux | Advanced users |

---

# Popular Linux Families

Linux distributions are commonly grouped into families.

---

# Debian Family

Examples:

- Debian
- Ubuntu
- Linux Mint

Package manager:

```bash
apt
```

Example:

```bash
sudo apt update
```

---

# Red Hat Family

Examples:

- Red Hat Enterprise Linux
- Rocky Linux
- AlmaLinux

Package manager:

```bash
dnf
```

Example:

```bash
sudo dnf install nginx
```

---

# Linux Server vs Desktop

Linux can be used in many different environments.

---

## Desktop Operating System

Linux desktops are used for:

- Web browsing
- Office applications
- Development
- Personal computing

Examples:

- Ubuntu Desktop
- Fedora Workstation

---

## Server Operating System

Linux servers are commonly used for:

- Websites
- Databases
- Cloud workloads
- Virtualisation
- Containers
- Enterprise applications

Servers often:

- Run continuously
- Have no graphical interface
- Are managed remotely
- Support automation

Example:

```
Administrator

      |
      |
      v

Linux Server

+----------------+
| Applications   |
| Databases      |
| Services       |
+----------------+
```

---

# Accessing Linux Systems

Linux systems can be accessed in several different ways depending on where they are running.

Common access methods include:

- Local console access
- Remote SSH access
- Virtual machine console access
- Cloud provider console access

---

# Local Console Access

A local console provides direct access to a Linux system.

Examples:

- Physical server
- Raspberry Pi
- Linux workstation

A user authenticates using:

- Username
- Password

After login, Linux provides access to a command-line environment called the shell.

Example:

```
james@linux-server:~$
```

---

# Remote Access Using SSH

Linux servers are commonly managed remotely using SSH.

SSH means:

**Secure Shell**

SSH provides an encrypted connection between an administrator and a Linux system.

Example:

```bash
ssh username@hostname
```

Example:

```bash
ssh james@server01
```

SSH is widely used for:

- Cloud servers
- Enterprise servers
- Remote administration

SSH administration will be covered in more detail in later modules.

---

# Virtual Machine and Cloud Access

Linux systems may also be accessed through:

- Virtual machine consoles
- Cloud provider management consoles
- Remote management platforms

Examples:

- AWS virtual machines
- Microsoft Azure virtual machines
- VMware environments

---

# Why Linux is Important in Modern IT

Linux skills are important because Linux runs many of the technologies used in modern infrastructure.

---

## Cloud Platforms

Examples:

- AWS
- Azure
- Google Cloud

---

## Containers

Examples:

- Docker
- Kubernetes

---

## Automation

Examples:

- Ansible
- Terraform workflows

---

## Enterprise Systems

Examples:

- Web servers
- Databases
- Monitoring systems
- Application platforms

---

# Practical Exercise

## Task 1 - Identify Your System

Run:

```bash
hostname
```

Record:

```
Hostname:
```

---

Run:

```bash
uname -r
```

Record:

```
Kernel:
```

---

Run:

```bash
cat /etc/os-release
```

Record:

```
Distribution:
```

---

## Task 2 - Explore Your Environment

Identify:

- What Linux distribution you are using
- Whether the system is physical, virtual, cloud-based, or a Raspberry Pi
- How you access the system

Record:

```
Linux Distribution:

Environment:

Access Method:
```

---

# Knowledge Check

1. What component of Linux communicates with hardware?

2. What year was the first Linux kernel released?

3. What is a Linux distribution?

4. Name two Linux distributions.

5. What is the difference between a Linux desktop and a Linux server?

6. What technology is commonly used to remotely access Linux servers?

7. Why is Linux widely used in cloud environments?

---

# Summary

In this module you learned:

✓ Linux is an open-source operating system  
✓ The Linux kernel manages communication between software and hardware  
✓ Linux has roots in UNIX and the GNU Project  
✓ Linux distributions package the kernel with tools and applications  
✓ Linux is widely used for servers, cloud platforms and containers  
✓ Linux systems can be accessed locally or remotely using tools such as SSH  

---

# Next Module

Continue your learning with:

**Module 01 - Command Line Fundamentals**
