# Module 01 - Command Line Fundamentals

## Lesson 03 - Viewing Files and Getting Help

> **Estimated time:** 45–60 minutes  
>
> **Difficulty:** Beginner  
>
> **Prerequisites:**
> - Module 00 - Introduction to Linux
> - Lesson 01 - The Linux Shell and Navigation
> - Lesson 02 - Working with Files and Directories

---

# Overview

Linux administrators spend a large amount of time reading configuration files, reviewing logs, and finding information about commands.

Unlike graphical operating systems, Linux provides powerful command-line tools for viewing and searching information quickly.

This lesson introduces the tools required to:

- View file contents
- Read large files
- Monitor changing files
- Find command documentation
- Understand command options
- Use command history

---

# Learning Objectives

By the end of this lesson you will be able to:

- Display the contents of files
- Read large text files safely
- View the beginning and end of files
- Monitor log files
- Use Linux manual pages
- Find help for commands
- Review previously executed commands

---

# Creating Test Files

Before learning how to view files, create some example files.

Create a directory:

```bash
mkdir file-demo
```

Move into it:

```bash
cd file-demo
```

Create a file:

```bash
touch example.txt
```

Add some content:

```bash
echo "Linux command line training" > example.txt
```

Check the file exists:

```bash
ls
```

---

# Viewing File Contents

## The cat Command

The simplest way to display a file is using:

```bash
cat filename
```

Example:

```bash
cat example.txt
```

Output:

```text
Linux command line training
```

`cat` is useful for small files.

---

## Viewing Line Numbers

Use:

```bash
cat -n filename
```

Example:

```bash
cat -n example.txt
```

Output:

```text
1  Linux command line training
```

Line numbers are useful when troubleshooting configuration files.

---

# Reading Large Files

Large files can contain thousands of lines.

Examples:

- Log files
- Application configuration files
- System reports

Using `cat` on very large files can make the terminal difficult to use.

For large files, use:

```bash
less
```

---

# The less Command

Example:

```bash
less /var/log/syslog
```

`less` allows you to scroll through files.

Useful keys:

| Key | Action |
|---|---|
| Space | Next page |
| b | Previous page |
| ↑ | Move up |
| ↓ | Move down |
| / | Search |
| q | Quit |

Example search:

```text
/error
```

finds occurrences of the word:

```text
error
```

---

# Viewing the Beginning of Files

The `head` command displays the first lines of a file.

Example:

```bash
head example.txt
```

By default it shows the first 10 lines.

To show a specific number:

```bash
head -20 example.txt
```

Displays the first 20 lines.

---

# Viewing the End of Files

The `tail` command displays the last lines of a file.

Example:

```bash
tail example.txt
```

Useful for checking recent log entries.

Example:

```bash
tail /var/log/syslog
```

---

# Monitoring Log Files

Linux systems generate many log files.

Examples:

```text
/var/log/syslog
/var/log/auth.log
```

To watch a log file as it changes:

```bash
tail -f /var/log/syslog
```

The `-f` option means:

```
follow
```

The terminal will continue displaying new entries.

Exit with:

```text
Ctrl + C
```

---

# Getting Help in Linux

Linux has several built-in ways to find help.

---

# The man Command

`man` displays the manual page for a command.

Example:

```bash
man ls
```

Output includes:

- Command description
- Available options
- Examples
- Related commands

---

## Searching Manual Pages

Example:

```bash
man -k password
```

Searches available manual pages containing:

```text
password
```

---

# Command Help Options

Many commands provide their own help.

Example:

```bash
ls --help
```

Output:

```text
Usage:
 ls [OPTION]... [FILE]...
```

Common help options:

```bash
--help
-h
-help
```

---

# Finding Command Locations

The `which` command shows where a command is installed.

Example:

```bash
which ls
```

Output:

```text
/usr/bin/ls
```

---

# Understanding Commands

The `whatis` command provides a short description.

Example:

```bash
whatis ls
```

Output:

```text
ls (1) - list directory contents
```

---

# Command History

Linux stores previously executed commands.

View your history:

```bash
history
```

Example:

```text
101 ls
102 cd /etc
103 systemctl status ssh
```

---

## Re-running Previous Commands

Use the up arrow:

```text
↑
```

to cycle through previous commands.

---

## Searching History

Press:

```text
Ctrl + R
```

Then type part of a previous command.

Example:

```text
ssh
```

Linux will search your command history.

---

# Combining Commands

Linux commands can be combined using pipes.

A pipe:

```text
|
```

passes the output of one command into another.

Example:

```bash
ls /etc | less
```

This sends the output of `ls` into `less`.

Useful when commands produce a lot of output.

---

# Practical Exercise

## Task 1 - Create a Log File

Create:

```bash
touch application.log
```

Add some content:

```bash
echo "Application started" >> application.log
echo "Connection successful" >> application.log
echo "Error detected" >> application.log
```

---

## Task 2 - View the File

Display the contents:

```bash
cat application.log
```

---

## Task 3 - Use Different Viewing Commands

Try:

```bash
head application.log
```

```bash
tail application.log
```

```bash
less application.log
```

---

## Task 4 - Find Help

Find information about:

```bash
grep
```

using:

```bash
man grep
```

and:

```bash
grep --help
```

---

## Task 5 - Review History

Display your command history:

```bash
history
```

Search for a previous command:

```text
Ctrl + R
```

---

# Knowledge Check

1. Which command displays the contents of a small file?

2. Which command is better for reading large files?

3. What command displays the last lines of a file?

4. How do you monitor a log file as it changes?

5. What command displays documentation for Linux commands?

6. What does the pipe character (`|`) do?

---

# Summary

In this lesson you learned:

✓ How to display file contents using `cat`  
✓ How to read large files using `less`  
✓ How to view file beginnings and endings using `head` and `tail`  
✓ How to monitor logs using `tail -f`  
✓ How to use Linux manual pages  
✓ How to find command help  
✓ How to use command history  
✓ How to combine commands using pipes  

Next lesson:

**Lesson 04 - Practical Command Line Lab**
