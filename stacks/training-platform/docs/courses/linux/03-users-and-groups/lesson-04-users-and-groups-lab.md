# Lesson 04 - Users and Groups Practical Lab

> **Estimated time:** 60–90 minutes
>
> **Prerequisites:**
> - Lesson 01 – Understanding Linux Users and Groups
> - Lesson 02 – Managing Users and Groups
> - Lesson 03 – Passwords and Administrative Access
>
> **Difficulty:** Beginner to Intermediate
>
> **Hands-on exercises:** Yes

---

# Overview

This practical lab combines the skills learned throughout the Users and Groups module.

You will perform common Linux administration tasks including:

- Creating users
- Creating groups
- Managing group membership
- Setting passwords
- Reviewing account information
- Managing account access
- Testing permissions

The scenario is based on a common real-world administration task: preparing a Linux server for a new team.

---

# Scenario

You are a Linux administrator managing a development server.

A new development team requires access.

The requirements are:

- Create a development group
- Create user accounts
- Assign users to the correct groups
- Configure passwords
- Verify access
- Remove access when required

---

# Lab Environment

Before starting, check your current account:

```bash
whoami
```

Check your permissions:

```bash
id
```

Confirm you can use sudo:

```bash
sudo -v
```

---

# Task 1 - Create the Development Group

Create a group called:

```text
developers
```

Command:

```bash
sudo groupadd developers
```

Verify:

```bash
getent group developers
```

Expected output:

```text
developers:x:1001:
```

---

# Task 2 - Create User Accounts

Create two users:

```text
alice
bob
```

Create their home directories:

```bash
sudo useradd -m alice
sudo useradd -m bob
```

Verify:

```bash
id alice
id bob
```

---

# Task 3 - Set User Passwords

Set passwords:

```bash
sudo passwd alice
sudo passwd bob
```

Confirm the accounts exist:

```bash
cat /etc/passwd | grep -E "alice|bob"
```

---

# Task 4 - Add Users to the Development Group

Add both users to the developers group:

```bash
sudo usermod -aG developers alice
sudo usermod -aG developers bob
```

Verify:

```bash
groups alice
groups bob
```

Expected:

```text
alice : alice developers

bob : bob developers
```

---

# Task 5 - Create a Shared Development Directory

Create:

```bash
sudo mkdir /development
```

Assign ownership to the developers group:

```bash
sudo chown root:developers /development
```

Set permissions:

```bash
sudo chmod 770 /development
```

Check:

```bash
ls -ld /development
```

Expected:

```text
drwxrwx--- root developers /development
```

---

# Task 6 - Test User Access

Switch to the alice account:

```bash
su - alice
```

Check identity:

```bash
whoami
```

Try creating a file:

```bash
touch /development/alice-test.txt
```

List the directory:

```bash
ls -l /development
```

Exit:

```bash
exit
```

---

# Task 7 - Review Account Information

Check users:

```bash
id alice
id bob
```

Review groups:

```bash
getent group developers
```

Review password status:

```bash
sudo passwd -S alice
```

---

# Task 8 - Configure Administrative Access

Add alice to the sudo group:

```bash
sudo usermod -aG sudo alice
```

Verify:

```bash
groups alice
```

The output should include:

```text
sudo
```

---

# Task 9 - Test sudo Access

Switch to alice:

```bash
su - alice
```

Run:

```bash
sudo whoami
```

Expected:

```text
root
```

Exit:

```bash
exit
```

---

# Task 10 - Disable an Account

Temporarily disable bob:

```bash
sudo passwd -l bob
```

Check status:

```bash
sudo passwd -S bob
```

Unlock:

```bash
sudo passwd -u bob
```

---

# Task 11 - Remove Test Accounts

Remove users:

```bash
sudo userdel -r alice
sudo userdel -r bob
```

Remove group:

```bash
sudo groupdel developers
```

Verify:

```bash
getent group developers
```

No output should be returned.

---

# Troubleshooting Exercises

## Problem 1

A user cannot access:

```text
/development
```

Check:

```bash
id username
```

Possible causes:

- User not in the correct group
- Incorrect permissions
- Incorrect ownership

---

## Problem 2

A user cannot run sudo commands.

Check:

```bash
groups username
```

Possible causes:

- User not in sudo group
- Incorrect sudo configuration

---

# Knowledge Check

1. Which command creates a Linux user?
2. Which command creates a group?
3. How do you add a user to an existing group?
4. What command displays user IDs and groups?
5. Why is `chmod 770` used for shared directories?
6. Why should administrators use sudo instead of logging in as root?

---

# Lab Summary

In this lab you:

✓ Created Linux users

✓ Created groups

✓ Managed group membership

✓ Configured shared directory access

✓ Tested permissions

✓ Configured sudo access

✓ Managed account security

✓ Removed accounts safely

---

# Module Completion

After completing this lab, you have completed:

**Module 03 - Users and Groups**

Status:

✅ Complete

---

# Next Module

**Module 04 - Processes and Services**