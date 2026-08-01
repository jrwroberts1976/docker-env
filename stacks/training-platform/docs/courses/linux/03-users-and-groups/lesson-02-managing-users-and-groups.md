# Lesson 02 - Managing Users and Groups

> **Estimated time:** 75–90 minutes
>
> **Prerequisites:**
> - Lesson 01 – Understanding Linux Users and Groups
>
> **Difficulty:** Beginner
>
> **Hands-on exercises:** Yes

---

# Overview

Linux administrators regularly create, modify and remove user accounts as people join, leave or change roles within an organisation.

This lesson introduces the tools used to manage users and groups safely from the command line. You'll also learn where Linux stores account information and how to inspect it.

---

# Learning Objectives

By the end of this lesson you will be able to:

- Create user accounts
- Modify existing users
- Delete user accounts
- Create and manage groups
- Add users to groups
- Understand Linux account databases
- Verify user and group configuration

---

# Linux Account Files

Linux stores account information in several important files.

| File | Purpose |
|------|---------|
| `/etc/passwd` | User account information |
| `/etc/shadow` | Encrypted passwords |
| `/etc/group` | Group information |
| `/etc/gshadow` | Secure group information |

View the contents of `/etc/passwd`:

```bash
cat /etc/passwd
```

Example:

```text
root:x:0:0:root:/root:/bin/bash
james:x:1000:1000:James Roberts:/home/james:/bin/bash
```

Each line contains information about one user account.

---

# Creating a User

Create a new user with:

```bash
sudo useradd alice
```

Verify the account exists:

```bash
id alice
```

Example:

```text
uid=1001(alice) gid=1001(alice)
```

---

# Creating a Home Directory

Some distributions automatically create a home directory, while others require the `-m` option.

```bash
sudo useradd -m alice
```

The user's home directory will be:

```text
/home/alice
```

---

# Setting a Password

Assign a password using:

```bash
sudo passwd alice
```

Example:

```text
New password:
Retype new password:
passwd: password updated successfully
```

---

# Viewing User Information

Display information about a user:

```bash
id alice
```

Display group membership:

```bash
groups alice
```

---

# Modifying a User

Use `usermod` to change account settings.

Example:

```bash
sudo usermod -s /bin/bash alice
```

This changes the user's default shell.

Change the home directory:

```bash
sudo usermod -d /home/newhome alice
```

---

# Locking and Unlocking Accounts

Lock an account:

```bash
sudo passwd -l alice
```

Unlock it again:

```bash
sudo passwd -u alice
```

This is useful when temporarily disabling an account without deleting it.

---

# Deleting a User

Delete an account:

```bash
sudo userdel alice
```

Remove the account and its home directory:

```bash
sudo userdel -r alice
```

Use the `-r` option carefully, as it permanently removes the user's files.

---

# Creating Groups

Create a group:

```bash
sudo groupadd developers
```

Verify:

```bash
getent group developers
```

Example:

```text
developers:x:1001:
```

---

# Adding a User to a Group

Add an existing user to a secondary group:

```bash
sudo usermod -aG developers alice
```

The options mean:

- `-a` = append
- `-G` = supplementary groups

Verify:

```bash
groups alice
```

Example:

```text
alice : alice developers
```

---

# Removing a User from a Group

Remove a user from a supplementary group:

```bash
sudo gpasswd -d alice developers
```

---

# Deleting a Group

Delete a group:

```bash
sudo groupdel developers
```

---

# Viewing Login Information

Display the currently logged-in users:

```bash
who
```

Display your username:

```bash
whoami
```

Display your identity:

```bash
id
```

---

# Useful Administration Commands

| Command | Purpose |
|---------|---------|
| `useradd` | Create users |
| `usermod` | Modify users |
| `userdel` | Delete users |
| `passwd` | Manage passwords |
| `groupadd` | Create groups |
| `groupdel` | Delete groups |
| `groups` | Display group membership |
| `id` | Display user identity |
| `whoami` | Display current username |
| `who` | Display logged-in users |

---

# Best Practices

✔ Create a home directory for each user.

✔ Assign strong passwords.

✔ Use groups to manage permissions rather than assigning users individually.

✔ Lock accounts instead of deleting them if access may be required again.

✔ Remove unused accounts promptly.

✔ Review user and group membership regularly.

---

# Knowledge Check

1. Which command creates a new user?
2. Which file stores user account information?
3. What command sets a user's password?
4. How do you add a user to a secondary group?
5. Which command displays a user's UID and GID?
6. What does the `-r` option do when used with `userdel`?

---

# Summary

In this lesson you learned how to:

- Create user accounts
- Set passwords
- Modify users
- Delete users
- Create groups
- Add users to groups
- Understand the Linux account database
- Verify account configuration

In the next lesson, you'll learn how Linux uses passwords, account policies and `sudo` to provide secure administrative access.