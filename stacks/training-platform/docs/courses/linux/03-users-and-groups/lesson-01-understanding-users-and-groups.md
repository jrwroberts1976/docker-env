# Lesson 01 - Understanding Linux Users and Groups

> **Estimated time:** 45–60 minutes
>
> **Prerequisites:**
> - Module 00 – Introduction to Linux
> - Module 01 – Command Line Fundamentals
> - Module 02 – Linux Filesystem Administration
>
> **Difficulty:** Beginner
>
> **Hands-on exercises:** Yes

---

# Overview

Linux is a multi-user operating system, designed from the ground up to allow many users to work on the same system safely and securely.

Every file, process and service belongs to a user and, usually, to a group. Understanding how users and groups work is fundamental to administering Linux systems, whether you're managing a single Raspberry Pi or hundreds of cloud servers.

In this lesson you'll learn how Linux identifies users, how groups simplify permission management, and how to inspect account information from the command line.

---

# Learning Objectives

By the end of this lesson you will be able to:

- Explain why Linux uses users and groups.
- Distinguish between users and groups.
- Understand User IDs (UIDs) and Group IDs (GIDs).
- Identify system accounts and regular user accounts.
- View information about the current user.
- Examine user and group information stored by Linux.

---

# Why Linux Uses Users

Linux assumes that multiple people may use the same computer at different times—or even simultaneously.

Each user has their own:

- Home directory
- Files
- Settings
- Password
- Permissions

This separation helps keep data secure and prevents users from interfering with each other's work.

For example:

```text
/home
├── alice
├── bob
└── james
```

Each user has their own workspace inside the `/home` directory.

---

# What is a User?

A **user** represents an individual account on the system.

Every user has:

- A username
- A password (or another authentication method)
- A unique User ID (UID)
- A primary group
- A home directory
- A default login shell

For example:

```text
Username: james
UID:      1000
Home:     /home/james
Shell:    /bin/bash
```

Linux uses the UID internally rather than the username to identify users.

---

# What is a Group?

A **group** is a collection of users.

Groups simplify permission management by allowing multiple users to share access to files and directories.

For example:

```text
developers
├── alice
├── bob
└── james
```

Instead of granting permissions to each user individually, permissions can be assigned to the group.

---

# Primary and Secondary Groups

Every Linux user belongs to at least one group.

There are two types of group membership:

## Primary Group

Every user has one primary group.

Example:

```text
User: james
Primary group: james
```

Files created by the user normally belong to this group.

---

## Secondary Groups

A user may also belong to additional groups.

Example:

```text
User: james

Groups:
- james
- docker
- sudo
```

Secondary groups provide additional permissions without changing the primary group.

---

# User IDs (UID)

Every user has a unique numerical identifier called a **User ID (UID)**.

Typical ranges are:

| UID Range | Purpose |
|-----------|---------|
| 0 | Root user |
| 1–999 | System and service accounts (distribution dependent) |
| 1000+ | Regular user accounts |

The root user always has a UID of **0**.

---

# Group IDs (GID)

Groups also have unique numerical identifiers called **Group IDs (GIDs)**.

Linux uses GIDs internally in the same way it uses UIDs for users.

---

# The Root User

The **root** account is the Linux administrator.

Root can:

- Access every file
- Modify system configuration
- Install software
- Create and remove users
- Change permissions
- Start and stop services

Because root has unrestricted access, administrators normally use `sudo` rather than logging in directly as root.

---

# System Accounts

Not every account belongs to a person.

Linux creates many accounts for running services.

Examples include:

```text
www-data
daemon
nobody
systemd-network
```

These accounts improve security by allowing services to run with only the permissions they require.

---

# Viewing Your Current User

Use the `whoami` command to display the current user.

```bash
whoami
```

Example:

```text
james
```

---

# Displaying User Information

The `id` command displays detailed information about the current user.

```bash
id
```

Example:

```text
uid=1000(james)
gid=1000(james)
groups=1000(james),27(sudo),998(docker)
```

This shows:

- User ID
- Primary Group ID
- Group memberships

---

# Displaying Logged-in Users

To see who is currently logged in:

```bash
who
```

Example:

```text
james    pts/0    09:45
admin    pts/1    10:12
```

---

# Viewing Group Membership

To display the groups for the current user:

```bash
groups
```

Example:

```text
james sudo docker
```

---

# Where User Information is Stored

Linux stores account information in text files.

Common files include:

| File | Purpose |
|------|---------|
| `/etc/passwd` | User account information |
| `/etc/group` | Group information |
| `/etc/shadow` | Encrypted password information |

You will explore these files in the next lesson.

---

# Best Practices

✔ Use standard user accounts for everyday work.

✔ Use `sudo` only when administrative privileges are required.

✔ Assign permissions using groups rather than individual users whenever possible.

✔ Avoid logging in directly as the root user.

✔ Regularly review user accounts and group memberships.

---

# Summary

In this lesson you learned:

- Why Linux uses users and groups.
- The difference between users and groups.
- What UIDs and GIDs are.
- The role of the root account.
- The purpose of system accounts.
- How to identify the current user and group memberships.

In the next lesson, you'll learn how to create, modify and manage user accounts and groups using common Linux administration commands.