# Lesson 03 - Passwords and Administrative Access

> **Estimated time:** 60–90 minutes
>
> **Prerequisites:**
> - Lesson 01 – Understanding Linux Users and Groups
> - Lesson 02 – Managing Users and Groups
>
> **Difficulty:** Beginner to Intermediate
>
> **Hands-on exercises:** Yes

---

# Overview

Linux systems use authentication and authorisation controls to protect system resources.

Authentication answers the question:

> "Who are you?"

Authorisation answers the question:

> "What are you allowed to do?"

In this lesson you will learn how Linux manages passwords, how password policies are controlled, and how administrators safely perform privileged tasks using `sudo`.

---

# Learning Objectives

By the end of this lesson you will be able to:

- Understand how Linux stores passwords securely.
- Change and manage user passwords.
- Understand password ageing policies.
- Lock and unlock accounts.
- Use `sudo` for administrative tasks.
- Understand the difference between normal and privileged access.
- Configure administrative permissions safely.

---

# Linux Authentication

When a user logs into Linux, the system verifies their identity.

The process involves:

```
User
 |
 | Username + Password
 |
 v
Authentication System
 |
 v
Linux System
 |
 v
User Session
```

Linux checks:

- Username
- Password
- Account status
- Login restrictions
- Access policies

---

# Password Storage

Linux does not store passwords as plain text.

Password information is stored in:

```text
/etc/shadow
```

View the file:

```bash
sudo cat /etc/shadow
```

Example:

```text
james:$6$randomhashvalue:20100:0:99999:7:::
```

The password field contains a cryptographic hash.

A hash is:

- One-way
- Not reversible
- Designed to protect passwords

---

# The /etc/passwd File

User account information is stored in:

```bash
/etc/passwd
```

Example:

```text
james:x:1000:1000:James:/home/james:/bin/bash
```

The `x` indicates that the password is stored separately in `/etc/shadow`.

---

# Changing Passwords

Users can change their own password:

```bash
passwd
```

Administrators can change another user's password:

```bash
sudo passwd username
```

Example:

```bash
sudo passwd alice
```

---

# Password Expiration

Linux can enforce password ageing policies.

View password information:

```bash
sudo chage -l username
```

Example:

```text
Last password change                    : Jul 01, 2026
Password expires                        : Sep 29, 2026
Password inactive                       : never
```

---

# Changing Password Policies

Force a user to change their password on next login:

```bash
sudo chage -d 0 username
```

Set password expiry:

```bash
sudo chage -M 90 username
```

This requires the user to change their password every 90 days.

---

# Locking User Accounts

A user account can be temporarily disabled.

Lock:

```bash
sudo passwd -l username
```

Example:

```bash
sudo passwd -l alice
```

Unlock:

```bash
sudo passwd -u username
```

Locking is useful when:

- A user leaves temporarily
- Investigating security issues
- Disabling unused accounts

---

# What is sudo?

`sudo` means:

**Super User DO**

It allows authorised users to run commands with elevated privileges.

Example:

Normal user:

```bash
apt update
```

May fail:

```text
Permission denied
```

Using sudo:

```bash
sudo apt update
```

Runs the command as root.

---

# Why Use sudo?

The recommended approach is:

```
Normal User
     |
     |
   sudo
     |
     |
Administrator Task
```

Rather than:

```
Login directly as root
```

Benefits:

- Better security
- Audit trail
- Reduced mistakes
- Least privilege access

---

# Checking sudo Access

Check if your user can use sudo:

```bash
groups
```

Example:

```text
james sudo docker
```

Users in the `sudo` group can normally perform administrative tasks.

---

# Running Commands with sudo

Example:

View protected files:

```bash
sudo cat /etc/shadow
```

Install software:

```bash
sudo apt install nginx
```

Restart services:

```bash
sudo systemctl restart ssh
```

---

# Switching Users

The `su` command allows you to switch users.

Example:

```bash
su alice
```

Switch to root:

```bash
su -
```

However, using `sudo` is generally preferred.

---

# sudo Configuration

The sudo configuration file is:

```text
/etc/sudoers
```

Never edit this file directly.

Use:

```bash
sudo visudo
```

`visudo` checks the configuration before saving.

This prevents syntax errors that could remove administrator access.

---

# Example sudo Configuration

Example:

```text
alice ALL=(ALL) ALL
```

Meaning:

- User: alice
- Host: ALL
- Can run commands as: ALL users
- Commands: ALL

---

# Least Privilege Principle

Users should only receive the permissions they need.

Example:

A web administrator may need:

```text
restart web service
```

They do not necessarily need:

```text
full root access
```

Good security practice:

✔ Give required access only

✔ Review permissions regularly

✔ Remove unused accounts

✔ Avoid shared administrator accounts

---

# Practical Exercise

## Task 1 - Check Your Account

Run:

```bash
whoami
```

Record:

```
Username:
```

Run:

```bash
id
```

Record:

```
UID:
Groups:
```

---

## Task 2 - Create a Test User

Create:

```bash
sudo useradd -m testuser
```

Set password:

```bash
sudo passwd testuser
```

Verify:

```bash
id testuser
```

---

## Task 3 - Test Account Locking

Lock the account:

```bash
sudo passwd -l testuser
```

Check:

```bash
sudo passwd -S testuser
```

Unlock:

```bash
sudo passwd -u testuser
```

---

## Task 4 - Review Password Policy

Run:

```bash
sudo chage -l testuser
```

Review the settings.

---

# Knowledge Check

1. Where are Linux passwords stored?
2. Why should passwords not be stored in `/etc/passwd`?
3. What command changes a user's password?
4. What does `sudo` allow a user to do?
5. Why should `visudo` be used instead of editing `/etc/sudoers` directly?
6. What is the purpose of least privilege?

---

# Summary

In this lesson you learned:

- How Linux authentication works
- How passwords are stored securely
- How to manage password policies
- How to lock and unlock accounts
- How `sudo` provides administrative access
- Why least privilege is important

Next:

**Lesson 04 – Users and Groups Practical Lab**