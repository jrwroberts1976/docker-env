# Module 01 - Command Line Fundamentals

> **Estimated time:** 60–90 minutes
>
> **Prerequisites:**
> - Module 00 – Introduction to Linux
>
> **Difficulty:** Beginner
>
> **Hands-on exercises:** Yes

---

# Overview

The Linux command line is one of the most powerful tools available to a system administrator. While many operating systems provide graphical interfaces, Linux administration is primarily performed from the command line.

Learning the command line allows you to:

- Work efficiently
- Manage remote servers
- Troubleshoot systems
- Automate repetitive tasks
- Manage thousands of files quickly
- Perform administration without a graphical interface

This module introduces the Linux shell, explains how commands are structured, and teaches you how to move around the Linux filesystem confidently.

---

# Learning Objectives

By the end of this lesson you will be able to:

- Explain what the Linux shell is.
- Understand the Linux command prompt.
- Recognise the structure of a Linux command.
- Display your current working directory.
- Navigate around the filesystem.
- List files and directories using different options.

---

# What is the Linux Shell?

The **shell** is a program that accepts commands from the user and passes them to the Linux kernel for execution.

Think of it as an interpreter between you and the operating system.

```
+---------------------+
|      User           |
+---------------------+
          |
          v
+---------------------+
|      Shell          |
|      (Bash)         |
+---------------------+
          |
          v
+---------------------+
|   Linux Kernel      |
+---------------------+
          |
          v
+---------------------+
|     Hardware        |
+---------------------+
```

The shell performs many useful functions including:

- Running programs
- Managing files
- Launching applications
- Executing scripts
- Redirecting output
- Automating repetitive tasks

The most common shell is **Bash (Bourne Again SHell)**, although others exist such as:

- Zsh
- Fish
- Korn Shell (ksh)
- C Shell (csh)

To see which shell you are using, run:

```bash
echo $SHELL
```

Example output:

```text
/bin/bash
```

---

# Understanding the Command Prompt

When you log into a Linux system you will normally see something similar to:

```text
james@k3s-node-01:~$
```

This is known as the **command prompt**.

Let's break it down.

```
james @ k3s-node-01 : ~ $
│         │           │
│         │           └── Current directory
│         └────────────── Hostname
└──────────────────────── Username
```

The final character is important:

```text
$
```

indicates a standard user.

Whereas:

```text
#
```

indicates the **root** user.

Always check your prompt before running administrative commands.

---

# The Current Working Directory

Linux always keeps track of where you are in the filesystem.

This location is called the **Current Working Directory (CWD)**.

To display it, use:

```bash
pwd
```

Example:

```text
/home/james
```

If you are in another directory:

```text
/etc
```

then:

```bash
pwd
```

returns:

```text
/etc
```

Knowing your current location is important because many commands work relative to your current directory.

---

# Listing Files and Directories

The `ls` command displays the contents of a directory.

Basic usage:

```bash
ls
```

Example output:

```text
Documents
Downloads
Pictures
projects
```

### Long Listing

To display more information:

```bash
ls -l
```

Example:

```text
drwxr-xr-x 2 james users 4096 Jul 18 Documents
-rw-r--r-- 1 james users  245 Jul 20 notes.txt
```

This shows:

- File permissions
- Number of links
- Owner
- Group
- File size
- Date modified
- File name

---

### Show Hidden Files

Files beginning with a full stop (`.`) are hidden by default.

Display them with:

```bash
ls -a
```

Example:

```text
.
..
.bashrc
.profile
Documents
Downloads
```

---

### Human Readable Sizes

```bash
ls -lh
```

Example:

```text
-rw-r--r-- 1 james users 2.4K notes.txt
```

Instead of displaying file sizes in bytes, `-h` shows them in a human-readable format such as KB, MB or GB.

---

# Navigating the Filesystem

Use the `cd` command to change directories.

Move to your home directory:

```bash
cd
```

or

```bash
cd ~
```

Move to another directory:

```bash
cd /etc
```

Check where you are:

```bash
pwd
```

Example:

```text
/etc
```

---

## Moving Up One Directory

Use:

```bash
cd ..
```

Example:

If you are in:

```text
/home/james/projects
```

running:

```bash
cd ..
```

takes you to:

```text
/home/james
```

---

## Returning to the Previous Directory

Use:

```bash
cd -
```

Example:

```text
/home/james
```

↓

```bash
cd /etc
```

↓

```bash
cd -
```

returns you to:

```text
/home/james
```

---

## Going to the Root Directory

To move to the top of the Linux filesystem:

```bash
cd /
```

Verify your location:

```bash
pwd
```

Output:

```text
/
```

---

# Absolute vs Relative Paths

Linux understands two types of paths.

## Absolute Path

An absolute path always starts at the root directory (`/`).

Example:

```text
/home/james/projects/basic-linux-training
```

No matter where you are currently located, this path always points to the same location.

---

## Relative Path

A relative path starts from your current location.

For example, if your current directory is:

```text
/home/james
```

then:

```bash
cd projects
```

works because `projects` exists beneath your current directory.

---

## Visual Example

```
/

├── home
│   └── james
│       └── projects
│           └── basic-linux-training
│
├── etc
├── var
└── usr
```

If you are in:

```text
/home/james
```

then:

```bash
cd projects/basic-linux-training
```

is a **relative path**.

Whereas:

```bash
cd /home/james/projects/basic-linux-training
```

is an **absolute path**.

---

# Best Practices

✔ Check your current location with `pwd` before making changes.

✔ Use `ls -l` when you need detailed file information.

✔ Prefer absolute paths when writing scripts.

✔ Use `cd ~` to quickly return to your home directory.

✔ Be aware of whether you are a standard user (`$`) or the root user (`#`).

---

# Summary

In this lesson you learned:

- What the Linux shell is.
- How the command prompt is structured.
- How commands are entered.
- How to identify your current directory.
- How to navigate the filesystem.
- The difference between absolute and relative paths.

In Part 2, you will learn how to create, copy, move and delete files and directories safely.
