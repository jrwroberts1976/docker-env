# Lesson 03 - Finding Files and Links

> **Estimated time:** 60–75 minutes
>
> **Module:** Module 02 – Linux Filesystem Administration
>
> **Prerequisites:**
> - Module 00 – Introduction to Linux
> - Module 01 – Command Line Fundamentals
> - Lesson 01 – Linux Filesystem Hierarchy
> - Lesson 02 – File Permissions and Ownership
>
> **Difficulty:** Beginner to Intermediate

---

# Overview

As Linux systems grow, they can contain thousands or even millions of files. System administrators need efficient ways to locate files, identify commands, and create links between files and directories.

In this lesson, you will learn how to search for files using a variety of tools, understand the differences between them, and use hard and symbolic links effectively.

---

# Learning Objectives

By the end of this lesson you will be able to:

- Find files using the `find` command.
- Locate files quickly using `locate`.
- Identify where commands are stored.
- Understand hidden files.
- Explain the difference between hard and symbolic links.
- Create and remove links safely.

---

# Finding Files with `find`

The `find` command searches the filesystem in real time.

Basic syntax:

```bash
find <location> <criteria>
```

Search for a file by name:

```bash
find /home -name "notes.txt"
```

Search for all text files:

```bash
find /home -name "*.txt"
```

Search for directories only:

```bash
find . -type d
```

Search for regular files:

```bash
find . -type f
```

---

## Searching by Size

Find files larger than 100 MB:

```bash
find / -size +100M
```

Find files smaller than 10 KB:

```bash
find /home -size -10k
```

---

## Searching by Modification Time

Find files modified within the last day:

```bash
find . -mtime -1
```

Find files older than 30 days:

```bash
find . -mtime +30
```

---

# Using `locate`

The `locate` command searches a pre-built database instead of scanning the filesystem.

Example:

```bash
locate ssh_config
```

Because it uses a database, it is usually much faster than `find`.

If recently created files do not appear, update the database:

```bash
sudo updatedb
```

> **Note:** `locate` may not be installed by default on all Linux distributions.

---

# Finding Commands

Linux provides several commands for locating executables and identifying command types.

---

## `which`

Displays the location of an executable in your `PATH`.

Example:

```bash
which ls
```

Output:

```text
/usr/bin/ls
```

---

## `whereis`

Displays the executable, source files and manual pages (where available).

Example:

```bash
whereis ssh
```

Example output:

```text
ssh: /usr/bin/ssh /usr/share/man/man1/ssh.1.gz
```

---

## `type`

Shows how the shell interprets a command.

Example:

```bash
type cd
```

Output:

```text
cd is a shell builtin
```

Example:

```bash
type ls
```

Output:

```text
ls is /usr/bin/ls
```

---

# Hidden Files

Hidden files begin with a period (`.`).

Examples:

```text
.bashrc
.profile
.gitconfig
```

To display hidden files:

```bash
ls -a
```

To include detailed information:

```bash
ls -la
```

Hidden files are commonly used to store configuration settings.

---

# Understanding Links

Linux supports two types of links:

- Hard links
- Symbolic (soft) links

Both provide additional ways to reference files.

---

# Hard Links

A hard link creates another directory entry for the same file.

Create a hard link:

```bash
ln notes.txt notes-hardlink.txt
```

Display the files:

```bash
ls -li
```

Example:

```text
123456 notes.txt
123456 notes-hardlink.txt
```

Notice both files share the same inode number.

Changes made to either file affect the same underlying data.

---

## Hard Link Characteristics

- Shares the same inode
- Appears as another copy of the file
- Continues to work if the original filename is deleted
- Cannot normally link directories
- Cannot span different filesystems

---

# Symbolic Links

A symbolic link (or soft link) is a shortcut that points to another file or directory.

Create a symbolic link:

```bash
ln -s notes.txt notes-link.txt
```

Display the result:

```bash
ls -l
```

Example:

```text
notes-link.txt -> notes.txt
```

---

## Symbolic Link Characteristics

- Points to another file
- Has its own inode
- Can span filesystems
- Can point to directories
- Becomes broken if the original file is removed

---

# Hard Links vs Symbolic Links

| Feature | Hard Link | Symbolic Link |
|---------|-----------|---------------|
| Shares inode | ✅ Yes | ❌ No |
| Can cross filesystems | ❌ No | ✅ Yes |
| Can link directories | ❌ Normally no | ✅ Yes |
| Works if original filename is removed | ✅ Yes | ❌ No |

---

# Removing Links

Remove a symbolic link:

```bash
rm notes-link.txt
```

This removes only the link, not the original file.

The same command removes hard links.

The original file remains until all hard links have been removed.

---

# Best Practices

✔ Use `find` for accurate, real-time searches.

✔ Use `locate` when speed is important.

✔ Use `which` to locate executables.

✔ Use symbolic links for shortcuts.

✔ Verify links using:

```bash
ls -l
```

✔ Be careful when deleting linked files.

---

# Practical Exercise

## Task 1 – Find Files

Search your home directory for all Markdown files:

```bash
find ~ -name "*.md"
```

---

## Task 2 – Search by File Type

List all directories in your current location:

```bash
find . -type d
```

---

## Task 3 – Locate a Command

Find the location of the `ls` command:

```bash
which ls
```

Then run:

```bash
whereis ls
```

Compare the output.

---

## Task 4 – Identify a Shell Built-in

Run:

```bash
type cd
```

Then:

```bash
type ls
```

Explain the difference.

---

## Task 5 – Create a Hard Link

Create a file:

```bash
touch original.txt
```

Create a hard link:

```bash
ln original.txt hardlink.txt
```

Display inode numbers:

```bash
ls -li
```

---

## Task 6 – Create a Symbolic Link

Create a symbolic link:

```bash
ln -s original.txt symlink.txt
```

Display the links:

```bash
ls -l
```

---

## Task 7 – View Hidden Files

Display all files, including hidden files:

```bash
ls -la
```

Identify at least three hidden files in your home directory.

---

# Knowledge Check

1. What is the difference between `find` and `locate`?

2. Which command locates an executable in your `PATH`?

3. What does the `type` command show?

4. How do hidden files differ from normal files?

5. What is a hard link?

6. What is a symbolic link?

7. Which type of link continues to work if the original filename is deleted?

8. Which type of link can point to directories?

---

# Summary

In this lesson you learned:

- How to locate files using `find`.
- How `locate` performs fast database searches.
- How to identify the location and type of commands.
- How to display hidden files.
- The differences between hard and symbolic links.
- When to use each type of link.

These tools are used daily by Linux administrators to locate files, manage systems efficiently, and simplify access to commonly used resources.

---

## Next Lesson

In **Lesson 04 – Filesystem Practical Lab**, you will apply everything you have learned in this module by exploring the Linux filesystem, managing permissions, locating files, and creating links in a series of hands-on exercises.