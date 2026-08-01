# Lesson 04 - Linux Filesystem Administration Lab

> **Estimated time:** 60–90 minutes
>
> **Module:** Module 02 – Linux Filesystem Administration
>
> **Prerequisites:**
> - Lesson 01 – Linux Filesystem Hierarchy
> - Lesson 02 – File Permissions and Ownership
> - Lesson 03 – Finding Files and Links
>
> **Difficulty:** Beginner

---

# Overview

This lab brings together everything you have learned in Module 02.

You will create a small project workspace and perform common Linux filesystem administration tasks including creating directories, managing files, changing permissions, searching for files, and creating links.

The goal is to complete the exercises using the commands learned throughout this module.

---

# Learning Objectives

By completing this lab you will be able to:

- Navigate the Linux filesystem confidently
- Create and organise directories
- Create, copy, move and remove files
- Modify file permissions
- Locate files using search commands
- Create symbolic and hard links
- Apply best practices when managing files

---

# Scenario

You have been asked to prepare a project workspace for a development team.

The workspace should contain directories for documentation, scripts, backups and log files.

Once created, you will populate the workspace, manage permissions and verify everything is working correctly.

---

# Part 1 - Create the Project Structure

Create the following directory structure inside your home directory.

```text
training-lab/
├── documents
├── scripts
├── backups
└── logs
```

Hint:

```bash
mkdir -p ~/training-lab/{documents,scripts,backups,logs}
```

Verify the structure:

```bash
tree ~/training-lab
```

If the `tree` command is unavailable, use:

```bash
find ~/training-lab
```

---

# Part 2 - Create Files

Create the following files.

```text
documents/
    notes.txt
    inventory.txt

scripts/
    backup.sh
```

Example:

```bash
touch ~/training-lab/documents/notes.txt
touch ~/training-lab/documents/inventory.txt
touch ~/training-lab/scripts/backup.sh
```

Verify your work:

```bash
ls -R ~/training-lab
```

---

# Part 3 - Add Content

Add some text to the files.

Example:

```bash
echo "Linux Filesystem Administration Lab" > ~/training-lab/documents/notes.txt

echo "Server Inventory" > ~/training-lab/documents/inventory.txt

echo "#!/bin/bash" > ~/training-lab/scripts/backup.sh
```

View the contents:

```bash
cat ~/training-lab/documents/notes.txt
```

---

# Part 4 - Copy Files

Copy the notes file into the backups directory.

Example:

```bash
cp ~/training-lab/documents/notes.txt ~/training-lab/backups/
```

Verify:

```bash
ls ~/training-lab/backups
```

---

# Part 5 - Move and Rename Files

Rename:

```text
inventory.txt
```

to:

```text
server-inventory.txt
```

Example:

```bash
mv ~/training-lab/documents/inventory.txt \
   ~/training-lab/documents/server-inventory.txt
```

Verify the change:

```bash
ls ~/training-lab/documents
```

---

# Part 6 - Modify Permissions

Make the backup script executable.

Example:

```bash
chmod +x ~/training-lab/scripts/backup.sh
```

Verify:

```bash
ls -l ~/training-lab/scripts
```

Question:

Which permission changed?

---

# Part 7 - Search for Files

Locate the backup script.

```bash
find ~/training-lab -name backup.sh
```

Find every text file.

```bash
find ~/training-lab -name "*.txt"
```

Find every directory.

```bash
find ~/training-lab -type d
```

---

# Part 8 - Hidden Files

Create a hidden configuration file.

```bash
touch ~/training-lab/.training.conf
```

Display all files, including hidden files.

```bash
ls -la ~/training-lab
```

Question:

Why are hidden files commonly used?

---

# Part 9 - Create a Symbolic Link

Create a symbolic link called:

```text
latest-notes
```

that points to:

```text
documents/notes.txt
```

Example:

```bash
ln -s ~/training-lab/documents/notes.txt \
      ~/training-lab/latest-notes
```

Verify:

```bash
ls -l ~/training-lab
```

Open the linked file:

```bash
cat ~/training-lab/latest-notes
```

---

# Part 10 - Create a Hard Link

Create a hard link.

Example:

```bash
ln ~/training-lab/documents/notes.txt \
   ~/training-lab/documents/notes-hardlink.txt
```

Compare inode numbers.

```bash
ls -li ~/training-lab/documents
```

Question:

What do you notice about the inode numbers?

---

# Part 11 - Clean Up

Delete the copied backup file.

```bash
rm ~/training-lab/backups/notes.txt
```

Remove the empty backups directory.

```bash
rmdir ~/training-lab/backups
```

Verify the remaining directory structure.

```bash
find ~/training-lab
```

---

# Final Challenge

Without referring back to the lessons, complete the following tasks.

- Create a new project directory.
- Create three subdirectories.
- Create several files.
- Rename one file.
- Copy one file.
- Move one file.
- Make a script executable.
- Find all text files.
- Create both a symbolic link and a hard link.
- Remove an unwanted file.
- Display the final directory structure.

---

# Knowledge Check

1. Which command creates nested directories?

2. What command changes file permissions?

3. How do you make a script executable?

4. Which command searches the filesystem?

5. What is the difference between a hard link and a symbolic link?

6. Which command displays inode numbers?

7. How do you display hidden files?

8. Which command safely removes an empty directory?

---

# Module Summary

Congratulations!

You have now completed **Module 02 – Linux Filesystem Administration**.

You should now be able to:

- ✅ Understand the Linux filesystem hierarchy
- ✅ Navigate directories confidently
- ✅ Create, copy, move and remove files
- ✅ Manage file permissions and ownership
- ✅ Locate files using search tools
- ✅ Create and use hard and symbolic links
- ✅ Apply Linux filesystem administration skills in practical scenarios

These are core skills used by Linux administrators every day.

---

# Next Module

**Module 03 – Users and Groups**

In the next module you will learn how Linux manages user accounts, groups, passwords, administrative privileges and secure access to systems.