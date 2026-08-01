# Lesson 02 - Managing Linux Processes

> **Estimated time:** 60–90 minutes  
>
> **Prerequisites:**
> - Module 04 – Processes and Services
> - Lesson 01 – Understanding Linux Processes
>
> **Difficulty:** Beginner to Intermediate
>
> **Hands-on exercises:** Yes

---

# Overview

Linux systems run many processes at the same time.

Administrators need to understand how to:

- View running processes
- Identify resource usage
- Find specific processes
- Run commands in the background
- Control and stop processes safely

Process management is an important skill for troubleshooting performance issues and maintaining system stability.

---

# Viewing Processes

Linux provides several commands for viewing running processes.

---

# ps Command

The `ps` command displays information about running processes.

Basic usage:

```bash
ps
```

Example output:

```text
PID TTY          TIME CMD
1234 pts/0    00:00:00 bash
5678 pts/0    00:00:01 ps
```

Information shown:

| Column | Meaning |
|---|---|
| PID | Process ID |
| TTY | Terminal |
| TIME | CPU time used |
| CMD | Command |

---

# Viewing All Processes

To view all running processes:

```bash
ps aux
```

Example:

```text
USER       PID %CPU %MEM COMMAND
root         1  0.0  1.2 systemd
james     1234  0.1  0.5 bash
```

Important columns:

| Column | Meaning |
|---|---|
| USER | Process owner |
| PID | Process ID |
| %CPU | CPU usage |
| %MEM | Memory usage |
| COMMAND | Running command |

---

# Finding Processes

## Using pgrep

The `pgrep` command searches for processes by name.

Example:

```bash
pgrep ssh
```

Output:

```text
742
```

This returns the process ID.

---

## Using ps with grep

Example:

```bash
ps aux | grep ssh
```

This searches the process list.

Example output:

```text
root 742 0.0 sshd
```

---

# Process Information

To view details about a process:

```bash
ps -fp PID
```

Example:

```bash
ps -fp 742
```

Output:

```text
UID   PID  PPID CMD
root  742    1  sshd
```

Information:

| Field | Meaning |
|---|---|
| PID | Process ID |
| PPID | Parent Process ID |
| CMD | Command |

---

# Parent and Child Processes

Processes can create other processes.

Example:

```text
systemd
 |
 ├── sshd
 |    |
 |    └── bash
 |
 └── cron
```

View process relationships:

```bash
pstree
```

This shows the hierarchy of processes.

---

# Background Processes

Commands normally run in the foreground.

Example:

```bash
sleep 60
```

The terminal waits until the command finishes.

To run a command in the background:

```bash
sleep 300 &
```

Example output:

```text
[1] 12345
```

The number returned is the process ID.

---

# Viewing Background Jobs

Show running background jobs:

```bash
jobs
```

Example:

```text
[1]+ Running sleep 300 &
```

---

# Bringing Jobs to the Foreground

Move a background job back:

```bash
fg
```

Example:

```bash
fg %1
```

---

# Sending Processes to the Background

A running command can be moved into the background.

Press:

```text
CTRL + Z
```

Then:

```bash
bg
```

Example:

```bash
sleep 300

CTRL + Z

bg
```

---

# Process Signals

Linux controls processes using signals.

Common signals:

| Signal | Number | Purpose |
|---|---|---|
| SIGHUP | 1 | Reload configuration |
| SIGTERM | 15 | Graceful shutdown |
| SIGKILL | 9 | Force termination |

---

# Stopping Processes

## Using kill

Terminate a process:

```bash
kill PID
```

Example:

```bash
kill 12345
```

This sends:

```text
SIGTERM
```

---

## Force Stopping Processes

If a process does not stop:

```bash
kill -9 PID
```

Example:

```bash
kill -9 12345
```

SIGKILL immediately stops the process.

Use carefully because the application cannot clean up.

---

# Using pkill

Kill processes by name:

```bash
pkill process_name
```

Example:

```bash
pkill sleep
```

---

# Monitoring Processes

## top

The `top` command provides real-time process monitoring.

Run:

```bash
top
```

Shows:

- CPU usage
- Memory usage
- Running processes
- System load

---

## htop

If installed:

```bash
htop
```

Provides an interactive interface.

Install:

```bash
sudo apt install htop
```

---

# Process Priority

Linux allows processes to have different priorities.

Priority is controlled using:

```bash
nice
renice
```

View priority:

```bash
ps -el
```

---

# Starting a Process with Priority

Example:

```bash
nice -n 10 command
```

Higher nice values mean lower priority.

---

# Changing Process Priority

Example:

```bash
renice 10 -p PID
```

---

# Practical Exercises

## Task 1 - View Processes

Run:

```bash
ps aux
```

Identify:

- Your shell process
- System processes
- Running applications

---

## Task 2 - Monitor the System

Run:

```bash
top
```

Record:

```text
Highest CPU process:

Highest memory process:
```

---

## Task 3 - Create a Background Process

Run:

```bash
sleep 300 &
```

Find it:

```bash
ps aux | grep sleep
```

Stop it:

```bash
kill PID
```

---

## Task 4 - Explore Process Tree

Run:

```bash
pstree
```

Identify:

- Parent processes
- Child processes

---

# Knowledge Check

1. What does PID stand for?

2. Which command shows all running processes?

3. What command displays a process tree?

4. What symbol runs a command in the background?

5. What signal does `kill` send by default?

6. What is the difference between SIGTERM and SIGKILL?

7. Which command provides live process monitoring?

---

# Summary

In this lesson you learned:

✓ How to view Linux processes  
✓ How to find specific processes  
✓ How parent and child processes work  
✓ How to run background jobs  
✓ How to stop processes safely  
✓ How to monitor system activity  
✓ How Linux signals control processes  

---

# Next Lesson

## Lesson 03 - Systemd and Service Management

You will learn:

- What systemd is
- How services are managed
- Starting and stopping services
- Enabling services at boot
- Checking service status