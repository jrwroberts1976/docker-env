# Lesson 01 - Linux Filesystem Hierarchy

> **Estimated time:** 45–60 minutes
>
> **Module:** Module 02 – Linux Filesystem Administration
>
> **Prerequisites:**
> - Module 00 – Introduction to Linux
> - Module 01 – Command Line Fundamentals
>
> **Difficulty:** Beginner

---

# Overview

One of the biggest differences between Linux and Windows is how files are organised.

Windows separates storage into multiple drives such as `C:`, `D:`, and `E:`. Linux, however, presents everything through a single directory tree that begins at the **root directory** (`/`).

Understanding where Linux stores configuration files, applications, logs and user data is an essential skill for any Linux administrator. Most Linux distributions follow a common layout known as the **Filesystem Hierarchy Standard (FHS)**, making it easier to work across different systems.

In this lesson, you will explore the Linux directory structure and learn the purpose of the most important directories.

---

# Learning Objectives

By the end of this lesson you will be able to:

- Explain the Linux filesystem hierarchy.
- Describe the purpose of the root directory.
- Identify the function of common system directories.
- Locate configuration files, applications and logs.
- Navigate the filesystem confidently.
- Apply best practices when working with the Linux filesystem.

---

# What is a Filesystem?

A filesystem defines how an operating system stores and organises data.

Every file, directory and device in Linux exists somewhere within a single directory tree.

Unlike Windows:

```text
C:\
D:\
E:\
```

Linux starts from one location:

```text
/
```

This is known as the **root directory**.

Everything on the system is connected beneath it.

---

# The Linux Filesystem Hierarchy

The Linux directory structure resembles an upside-down tree.

```text
/
├── bin
├── boot
├── dev
├── etc
├── home
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin
├── srv
├── sys
├── tmp
├── usr
└── var
```

Every directory has a specific purpose.

This consistency allows administrators to work confidently across different Linux distributions.

---

# Filesystem Hierarchy Standard (FHS)

Most Linux distributions follow the **Filesystem Hierarchy Standard (FHS)**.

The standard defines where different types of files should be stored.

For example:

| Type of Data | Typical Location |
|---------------|------------------|
| User files | `/home` |
| Configuration files | `/etc` |
| System logs | `/var/log` |
| Installed applications | `/usr` |
| Temporary files | `/tmp` |
| Device files | `/dev` |

Following this standard makes Linux systems easier to understand, maintain and troubleshoot.

---

# Exploring the Root Directory

To display the contents of the root directory, run:

```bash
ls /
```

Example output:

```text
bin
boot
dev
etc
home
media
mnt
opt
proc
root
run
sbin
srv
sys
tmp
usr
var
```

---

# Important Linux Directories

## `/home`

The `/home` directory stores personal files for normal users.

Example:

```text
/home/james
/home/alice
/home/training
```

Each user has their own home directory.

To display your home directory:

```bash
echo $HOME
```

or

```bash
cd
pwd
```

---

## `/root`

This is the home directory of the **root** user.

Do not confuse:

```text
/
```

with

```text
/root
```

The first is the root of the filesystem.

The second is root's personal home directory.

---

## `/etc`

This directory contains system configuration files.

Examples include:

```text
/etc/hostname
/etc/passwd
/etc/group
/etc/ssh/
/etc/systemd/
```

View the directory:

```bash
ls /etc
```

Administrators frequently work in `/etc`.

---

## `/var`

Variable data is stored here.

Examples include:

- System logs
- Databases
- Print queues
- Mail queues
- Web server content

To view system logs:

```bash
ls /var/log
```

Many troubleshooting tasks begin in `/var/log`.

---

## `/usr`

This directory contains installed software and shared resources.

Common locations include:

```text
/usr/bin
/usr/lib
/usr/share
```

Most applications installed using the package manager are stored beneath `/usr`.

---

## `/bin`

Contains essential user commands required for the operating system.

Examples:

```text
ls
cp
mv
cat
bash
```

These commands are available even during system recovery.

---

## `/sbin`

Contains essential system administration commands.

Examples:

```text
fsck
reboot
shutdown
ip
```

Many commands require administrative privileges.

---

## `/tmp`

Temporary files are stored here.

Applications use this location to hold temporary data while running.

Many Linux systems automatically clean this directory during boot.

---

## `/boot`

Contains files required to start Linux.

Examples include:

- Linux kernel
- Initial RAM filesystem (initramfs)
- Boot loader configuration

---

## `/dev`

Linux treats hardware devices as files.

Examples:

```text
/dev/sda
/dev/null
/dev/tty
```

Administrators rarely modify these directly, but they are important when managing disks and hardware.

---

## `/proc`

The `/proc` directory is a virtual filesystem.

It provides information about the running kernel and system processes.

Example:

```bash
cat /proc/cpuinfo
```

View memory information:

```bash
cat /proc/meminfo
```

No actual files are stored here—they are generated by the kernel.

---

## `/sys`

Another virtual filesystem.

Provides information about hardware devices and the Linux kernel.

It is commonly used by advanced administration tools.

---

## `/opt`

Used for optional or third-party software.

For example:

```text
/opt/google
/opt/custom-application
```

Many commercial applications install here.

---

# Exploring the Filesystem

Useful commands include:

Display your current location:

```bash
pwd
```

Move to the root directory:

```bash
cd /
```

List directory contents:

```bash
ls
```

Detailed listing:

```bash
ls -l
```

Classify file types:

```bash
ls -F
```

If installed, display the directory tree:

```bash
tree /
```

---

# Best Practices

✔ Store personal files inside your home directory.

✔ Avoid modifying files in `/etc` unless required.

✔ Learn where log files are stored.

✔ Never delete files from system directories without understanding their purpose.

✔ Use `sudo` carefully when working outside your home directory.

---

# Practical Exercise

## Task 1 – Explore the Root Directory

Run:

```bash
ls /
```

Record five directories you recognise.

---

## Task 2 – Identify Your Home Directory

Run:

```bash
echo $HOME
```

Then:

```bash
pwd
```

Do they match?

---

## Task 3 – Explore System Configuration

Navigate to:

```bash
cd /etc
```

List the contents:

```bash
ls
```

Can you identify:

- `passwd`
- `hostname`
- `ssh`

---

## Task 4 – View System Logs

Navigate to:

```bash
cd /var/log
```

List the contents:

```bash
ls
```

How many log files can you identify?

---

## Task 5 – Explore Installed Programs

Navigate to:

```bash
cd /usr/bin
```

Count the number of files:

```bash
ls | wc -l
```

Notice how many applications are available on a standard Linux installation.

---

# Knowledge Check

1. What is the top-level directory in Linux called?

2. Which directory stores user home folders?

3. Where are most system configuration files stored?

4. Which directory contains system log files?

5. What is the purpose of `/tmp`?

6. Why is `/proc` described as a virtual filesystem?

7. Which directory is commonly used for optional third-party software?

---

# Summary

In this lesson you learned:

- Linux uses a single directory tree beginning at the root directory (`/`).
- Most Linux distributions follow the Filesystem Hierarchy Standard (FHS).
- Configuration files are stored in `/etc`.
- User data is stored in `/home`.
- System logs are stored in `/var/log`.
- Applications are commonly installed beneath `/usr`.
- Temporary files are stored in `/tmp`.
- Understanding the filesystem hierarchy is essential for effective Linux administration and troubleshooting.

---

## Next Lesson

In **Lesson 02 – File Permissions and Ownership**, you will learn how Linux controls access to files and directories using users, groups and permissions.
