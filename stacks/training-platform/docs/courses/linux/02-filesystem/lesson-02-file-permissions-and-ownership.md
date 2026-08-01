# Lesson 02 - File Permissions and Ownership

> **Estimated time:** 60–75 minutes
>
> **Module:** Module 02 – Linux Filesystem Administration
>
> **Prerequisites:**
> - Module 00 – Introduction to Linux
> - Module 01 – Command Line Fundamentals
> - Lesson 01 – Linux Filesystem Hierarchy
>
> **Difficulty:** Beginner to Intermediate

---

# Overview

Linux is a multi-user operating system, which means multiple users can access the same system at the same time. To keep the system secure, Linux uses a permissions model that controls who can read, modify, or execute files and directories.

Every file and directory has an **owner**, belongs to a **group**, and has a set of **permissions** that determine what actions can be performed.

Understanding file permissions is essential for managing Linux systems, securing sensitive information, and troubleshooting access issues.

---

# Learning Objectives

By the end of this lesson you will be able to:

- Explain Linux ownership and permissions.
- Identify the owner and group of a file.
- Interpret the output of `ls -l`.
- Understand read, write and execute permissions.
- Modify permissions using `chmod`.
- Change ownership using `chown`.
- Change group ownership using `chgrp`.
- Apply permission changes safely using best practices.

---

# Linux Ownership

Every file and directory has:

- An **owner** (the user who owns the file)
- A **group** (a collection of users)
- A set of permissions

Display a long listing:

```bash
ls -l
```

Example output:

```text
-rw-r--r-- 1 james developers 245 Jul 22 notes.txt
```

Breaking it down:

```text
-rw-r--r-- 1 james developers 245 Jul 22 notes.txt
│─────────│ │     │
│         │ │     └── Group
│         │ └──────── Owner
│         └────────── Permissions
```

---

# Understanding Permissions

The first column represents the file type and permissions.

```text
-rw-r--r--
```

Split into sections:

```text
- rw- r-- r--
│ │   │   │
│ │   │   └── Others
│ │   └────── Group
│ └────────── Owner
└──────────── File type
```

---

# File Types

The first character identifies the file type.

| Symbol | Type |
|---------|------|
| `-` | Regular file |
| `d` | Directory |
| `l` | Symbolic link |
| `c` | Character device |
| `b` | Block device |

Example:

```text
drwxr-xr-x
```

The `d` indicates a directory.

---

# Permission Types

There are three basic permissions.

| Symbol | Meaning |
|---------|---------|
| `r` | Read |
| `w` | Write |
| `x` | Execute |

### Read (`r`)

Allows a file to be viewed.

Example:

```bash
cat notes.txt
```

---

### Write (`w`)

Allows the file to be modified.

Examples include:

- Editing
- Saving
- Deleting (depending on directory permissions)

---

### Execute (`x`)

Allows a file to be run as a program or script.

Example:

```bash
./backup.sh
```

---

# Permission Groups

Permissions are applied to three groups.

| Group | Description |
|---------|-------------|
| Owner | User who owns the file |
| Group | Members of the assigned group |
| Others | Everyone else |

Example:

```text
-rwxr-x---
```

Owner:

```text
rwx
```

Group:

```text
r-x
```

Others:

```text
---
```

---

# Numeric Permissions

Permissions can also be represented using numbers.

| Permission | Value |
|------------|------:|
| Read | 4 |
| Write | 2 |
| Execute | 1 |

Examples:

| Number | Meaning |
|---------|---------|
| 7 | rwx |
| 6 | rw- |
| 5 | r-x |
| 4 | r-- |
| 0 | --- |

Common combinations:

| Numeric | Symbolic |
|---------:|----------|
| 755 | rwxr-xr-x |
| 644 | rw-r--r-- |
| 700 | rwx------ |
| 600 | rw------- |

---

# Changing Permissions with chmod

Symbolic example:

```bash
chmod u+x backup.sh
```

Adds execute permission for the owner.

Remove write permission:

```bash
chmod g-w notes.txt
```

Numeric example:

```bash
chmod 644 notes.txt
```

Make a script executable:

```bash
chmod 755 backup.sh
```

---

# Changing Ownership

Display ownership:

```bash
ls -l
```

Change owner:

```bash
sudo chown james notes.txt
```

Change owner and group:

```bash
sudo chown james:developers notes.txt
```

---

# Changing Group Ownership

Use:

```bash
sudo chgrp developers notes.txt
```

Verify:

```bash
ls -l
```

---

# Directory Permissions

Permissions behave slightly differently on directories.

| Permission | Effect |
|------------|--------|
| Read | List contents |
| Write | Create, delete or rename files |
| Execute | Enter the directory using `cd` |

Example:

```bash
chmod 755 projects
```

---

# Best Practices

✔ Give users only the permissions they need.

✔ Avoid using `777`.

✔ Use groups instead of assigning permissions to individual users wherever possible.

✔ Verify changes using `ls -l`.

✔ Use `sudo` only when necessary.

✔ Be especially careful when changing permissions in `/etc`, `/usr` or `/var`.

---

# Practical Exercise

## Task 1 – View Permissions

Run:

```bash
ls -l
```

Identify:

- Owner
- Group
- Permission string

---

## Task 2 – Create a File

```bash
touch training.txt
ls -l
```

Record its permissions.

---

## Task 3 – Make a Script Executable

Create a script:

```bash
touch backup.sh
```

Add execute permission:

```bash
chmod +x backup.sh
```

Verify:

```bash
ls -l backup.sh
```

---

## Task 4 – Change Numeric Permissions

Set:

```bash
chmod 644 training.txt
```

Then:

```bash
chmod 600 training.txt
```

Observe the changes.

---

## Task 5 – Change Group Ownership

If permitted:

```bash
sudo chgrp developers training.txt
```

Verify using:

```bash
ls -l
```

---

# Knowledge Check

1. What does the first character in `ls -l` output represent?

2. What do the letters `r`, `w` and `x` mean?

3. Which command changes file permissions?

4. Which command changes file ownership?

5. What numeric permission corresponds to `rwxr-xr-x`?

6. Why should `777` permissions generally be avoided?

7. Why are groups useful when managing permissions?

---

# Summary

In this lesson you learned:

- Every file has an owner and a group.
- Linux permissions control access to files and directories.
- Permissions are represented symbolically and numerically.
- `chmod` changes permissions.
- `chown` changes ownership.
- `chgrp` changes group ownership.
- Correct permissions are essential for both security and system administration.

---

## Next Lesson

In **Lesson 03 – Finding Files and Links**, you'll learn how to locate files efficiently and how hard links and symbolic links work in Linux.
