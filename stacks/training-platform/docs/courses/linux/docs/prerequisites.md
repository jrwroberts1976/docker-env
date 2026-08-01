# Linux Training Prerequisites

## Overview

Before starting this Linux training course, participants should have access to a Linux environment and a basic understanding of computer systems.

This document explains the recommended requirements and setup options.

---

## Required Knowledge

Participants should have a basic understanding of:

- Computer hardware concepts
- Files and folders
- Basic networking concepts
- Using a keyboard and command line interface
- Basic troubleshooting approaches

No previous Linux administration experience is required.

---

## Required Environment

The training exercises require access to a Linux system.

Recommended options:

### Option 1 - Virtual Machine (Recommended)

Run Linux locally using:

- VirtualBox
- VMware Workstation
- Hyper-V

Recommended distributions:

- Ubuntu Server LTS
- Debian
- Rocky Linux

Suggested minimum resources:

| Resource | Minimum |
|-|-|
| CPU | 2 cores |
| RAM | 4GB |
| Storage | 20GB |
| Network | Internet access |

---

### Option 2 - Raspberry Pi

A Raspberry Pi can be used as a low-cost Linux training platform.

Recommended:

- Raspberry Pi 4 or newer
- Raspberry Pi OS Lite / Debian
- SSH enabled

Example:

```bash
ssh username@hostname
```

---

### Option 3 - Cloud Server

Training can also be completed using cloud platforms.

Examples:

- AWS EC2
- Microsoft Azure Virtual Machines
- Google Cloud Compute Engine

A small Linux instance is sufficient.

---

### Option 4 - Windows Users

Windows users can use:

### Windows Subsystem for Linux (WSL)

WSL provides a Linux environment directly inside Windows.

Example distributions:

- Ubuntu
- Debian

---

## Software Requirements

### Required Tools

Participants should have:

| Tool | Purpose |
|-|-|
| SSH Client | Remote Linux access |
| Text Editor | Editing configuration files |
| Web Browser | Documentation access |
| Git | Version control |

---

## Access Requirements

Participants should have:

- A Linux user account
- Permission to use sudo
- Network access to the training system
- Ability to install software packages

---

## Next Steps

Once prerequisites are complete, begin:

1. [Training Plan](./training-plan.md)
2. [Module 00 - Introduction to Linux](../00-introduction/linux-overview.md)
