# Module 01 - Command Line Fundamentals

## Lesson 02 - Working with Files and Directories

> **Estimated time:** 45–60 minutes  
>
> **Difficulty:** Beginner  
>
> **Prerequisites:**
> - Module 00 - Introduction to Linux
> - Lesson 01 - The Linux Shell and Navigation

---

# Overview

Now that you understand how to navigate the Linux filesystem, the next step is learning how to create, copy, move and remove files and directories.

These commands are used every day by Linux administrators and form the foundation of working with Linux systems.

---

# Learning Objectives

By the end of this lesson you will be able to:

- Create directories
- Create empty files
- Copy files and directories
- Move and rename files
- Remove files and directories safely
- Use wildcards
- Understand common command-line shortcuts

---

# Creating Directories

The `mkdir` command creates new directories.

## Syntax

```bash
mkdir directory_name
```

Example:

```bash
mkdir training
```

Verify the directory exists:

```bash
ls
```

Example output:

```text
training
```

---

# Creating Multiple Directories

Multiple directories can be created in a single command.

Example:

```bash
mkdir docs scripts backups
```

Result:

```text
docs
scripts
backups
```

---

# Creating Nested Directories

Normally Linux requires parent directories to already exist.

The `-p` option creates the complete directory structure.

Example:

```bash
mkdir -p projects/linux/module01
```

This creates:

```text
projects
└── linux
    └── module01
```

---

# Creating Files

Linux uses the `touch` command to create empty files.

Example:

```bash
touch notes.txt
```

Verify:

```bash
ls
```

Output:

```text
notes.txt
```

Multiple files can be created at once:

```bash
touch file1.txt file2.txt file3.txt
```

---

# Copying Files

The `cp` command copies files.

## Syntax

```bash
cp source destination
```

Example:

```bash
cp notes.txt backup.txt
```

Result:

```text
notes.txt
backup.txt
```

The original file remains unchanged.

---

# Copying Directories

Directories require the recursive option.

Example:

```bash
cp -r projects backup
```

The `-r` option means:

```
recursive
```

This copies the directory and everything inside it.

---

# Moving Files

The `mv` command moves files and directories.

Example:

```bash
mv notes.txt Documents/
```

The file is moved into the `Documents` directory.

---

# Renaming Files

The `mv` command is also used to rename files.

Example:

```bash
mv notes.txt lesson-notes.txt
```

The file has now been renamed.

---

# Removing Files

Files are removed using the `rm` command.

Example:

```bash
rm backup.txt
```

Once deleted, the file cannot normally be recovered.

Always check the filename before pressing Enter.

---

# Removing Directories

Empty directories can be removed using:

```bash
rmdir directory_name
```

Example:

```bash
rmdir training
```

---

# Removing Directories and Contents

To remove a directory and everything inside it:

```bash
rm -r directory_name
```

Example:

```bash
rm -r old-project
```

Be careful when using recursive deletion.

---

# The Dangerous Command

A very powerful command is:

```bash
rm -rf
```

The options mean:

| Option | Meaning |
|---|---|
| `-r` | Recursive |
| `-f` | Force |

Example:

```bash
rm -rf test-directory
```

This removes the directory and contents without asking for confirmation.

⚠️ Never run a command unless you understand exactly what it will do.

---

# Using Wildcards

Wildcards allow commands to work with multiple files.

The most common wildcard is:

```text
*
```

which means "match anything".

---

## Example - Delete All Text Files

```bash
rm *.txt
```

This removes all files ending with:

```text
.txt
```

---

## Example - List Log Files

```bash
ls *.log
```

Displays files ending with:

```text
.log
```

---

# Useful Keyboard Shortcuts

| Shortcut | Description |
|---|---|
| ↑ | Previous command |
| ↓ | Next command |
| Tab | Auto-complete command or filename |
| Ctrl + C | Cancel current command |
| Ctrl + L | Clear terminal |
| Ctrl + D | Logout / end shell |

---

# Best Practices

✔ Check your location with:

```bash
pwd
```

before making changes.

✔ Use:

```bash
ls
```

before deleting files.

✔ Create backups before modifying important files.

✔ Avoid using:

```bash
rm -rf
```

unless you are completely certain.

✔ Use meaningful filenames.

✔ Keep files organised into directories.

---

# Practical Exercise

Complete the following tasks.

## Task 1 - Create a Training Directory

Create this structure:

```text
linux-training
├── documents
├── scripts
└── backups
```

Commands:

```bash
mkdir -p linux-training/{documents,scripts,backups}
```

---

## Task 2 - Create Files

Create:

```text
notes.txt
script.sh
backup.txt
```

---

## Task 3 - Copy Files

Copy:

```text
notes.txt
```

into:

```text
backups
```

---

## Task 4 - Rename a File

Rename:

```text
script.sh
```

to:

```text
linux-script.sh
```

---

## Task 5 - Cleanup

Remove the training directory when complete.

---

# Knowledge Check

1. Which command creates a directory?

2. What option is required to copy directories?

3. Which command moves or renames files?

4. What does `rm -r` do?

5. Why should `rm -rf` be used carefully?

---

# Summary

In this lesson you learned:

✓ How to create directories using `mkdir`  
✓ How to create files using `touch`  
✓ How to copy files using `cp`  
✓ How to move and rename files using `mv`  
✓ How to remove files and directories safely  
✓ How to use wildcards  
✓ Common Linux terminal shortcuts  

Next lesson:

**Lesson 03 - Viewing Files and Getting Help**
