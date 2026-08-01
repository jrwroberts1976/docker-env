# Module 01 - Command Line Fundamentals

## Lesson 04 - Practical Command Line Lab

> **Estimated time:** 60–90 minutes  
>
> **Difficulty:** Beginner  
>
> **Prerequisites:**
> - Lesson 01 - The Linux Shell and Navigation
> - Lesson 02 - Working with Files and Directories
> - Lesson 03 - Viewing Files and Getting Help

---

# Overview

This practical lab brings together the skills learned throughout Module 01.

You will complete common Linux command-line tasks including:

- Navigating the filesystem
- Creating directories
- Managing files
- Viewing file contents
- Finding information
- Reviewing system information

The goal is to complete the tasks without using a graphical interface.

---

# Scenario

You have joined a Linux support team.

A new application server has been deployed, and you have been asked to prepare a working directory for an application support team.

Your tasks are to:

- Create the required directory structure
- Create configuration and log files
- Review application information
- Organise files correctly
- Document your work

---

# Lab Environment

Create a workspace:

```bash
mkdir -p ~/linux-lab
```

Move into the directory:

```bash
cd ~/linux-lab
```

Confirm your location:

```bash
pwd
```

Expected:

```text
/home/<username>/linux-lab
```

---

# Task 1 - Create Directory Structure

Create the following structure:

```text
linux-lab/
|
├── application/
|
├── configuration/
|
├── logs/
|
└── backups/
```

Use:

```bash
mkdir application configuration logs backups
```

Verify:

```bash
ls
```

---

# Task 2 - Create Application Files

Inside the application directory create:

```text
app.txt
version.txt
```

Commands:

```bash
touch application/app.txt
touch application/version.txt
```

Verify:

```bash
ls application
```

---

# Task 3 - Add Application Information

Add application details.

Example:

```bash
echo "Customer Portal Application" > application/app.txt
```

Add a version:

```bash
echo "Version 1.0" > application/version.txt
```

View the files:

```bash
cat application/app.txt
```

```bash
cat application/version.txt
```

---

# Task 4 - Create Log Files

Create:

```text
application.log
security.log
```

inside the logs directory.

Commands:

```bash
touch logs/application.log
touch logs/security.log
```

Add entries:

```bash
echo "Application started" >> logs/application.log
```

```bash
echo "User login successful" >> logs/security.log
```

---

# Task 5 - Review Logs

Display the log files:

```bash
cat logs/application.log
```

```bash
cat logs/security.log
```

View the last entries:

```bash
tail logs/application.log
```

---

# Task 6 - Copy Files for Backup

Create a backup copy of the application directory.

Command:

```bash
cp -r application backups/
```

Verify:

```bash
ls backups
```

Expected:

```text
application
```

---

# Task 7 - Rename a File

Rename:

```text
version.txt
```

to:

```text
application-version.txt
```

Command:

```bash
mv application/version.txt application/application-version.txt
```

Verify:

```bash
ls application
```

---

# Task 8 - Find Information

Display all files:

```bash
find .
```

Expected output:

```text
./application
./configuration
./logs
./backups
```

---

# Task 9 - Review File Information

Display detailed information:

```bash
ls -lh application
```

Check file metadata:

```bash
stat application/app.txt
```

---

# Task 10 - Use Command Help

Find help for the `tar` command.

Using:

```bash
man tar
```

Find:

- How to create an archive
- How to extract an archive

---

# Task 11 - Create an Archive

Create a backup archive:

```bash
tar -cvf application-backup.tar application
```

Verify:

```bash
ls -lh
```

---

# Task 12 - Clean Up

Remove the lab environment.

First check:

```bash
pwd
```

Confirm you are inside:

```text
linux-lab
```

Then:

```bash
cd ..
```

Remove:

```bash
rm -r linux-lab
```

---

# Challenge Tasks

Complete these without looking at previous examples.

## Challenge 1

Create:

```text
project
├── docs
├── scripts
└── data
```

---

## Challenge 2

Create:

```text
report.txt
```

Add three lines of text.

---

## Challenge 3

Copy the file into:

```text
docs
```

---

## Challenge 4

Find all `.txt` files:

```bash
find .
```

---

# Knowledge Check

1. Which command displays your current directory?

2. How do you create a directory?

3. Which command copies files?

4. What option is required to copy directories?

5. How do you view the end of a log file?

6. What command displays help documentation?

7. What does `>` do?

8. What does `>>` do?

9. What does the pipe symbol (`|`) do?

10. Why should `rm -rf` be used carefully?

---

# Module 01 Complete

Congratulations.

You have completed:

**Module 01 - Command Line Fundamentals**

You can now:

✓ Navigate Linux systems  
✓ Understand the command prompt  
✓ Manage files and directories  
✓ Read files and logs  
✓ Use Linux documentation  
✓ Complete basic administration tasks  

Next module:

# Module 02 - Linux Filesystem Administration
