# Lesson 05 - Processes and Services Administration Lab

> **Estimated time:** 90–120 minutes  
>
> **Prerequisites:**
> - Module 04 – Processes and Services
> - Lesson 01 – Understanding Linux Processes
> - Lesson 02 – Managing Linux Processes
> - Lesson 03 – Systemd and Service Management
> - Lesson 04 – Logs and journalctl
>
> **Difficulty:** Intermediate
>
> **Hands-on exercises:** Yes

---

# Overview

This practical lab combines the skills learned throughout the Processes and Services module.

You will perform common Linux administration tasks including:

- Monitoring processes
- Managing running applications
- Checking services
- Investigating service problems
- Reviewing system logs
- Troubleshooting failures

The tasks simulate activities performed by Linux system administrators.

---

# Lab Environment

You can complete this lab using:

- Linux server
- Virtual machine
- Raspberry Pi
- Cloud Linux instance

Recommended distributions:

- Debian
- Ubuntu Server
- Rocky Linux

---

# Task 1 - Identify Running Processes

## Objective

Understand what processes are running on your Linux system.

Run:

```bash
ps aux
```

Review:

- Running applications
- User ownership
- CPU usage
- Memory usage

---

## Process Tree

View parent and child relationships:

```bash
pstree
```

Identify:

- System processes
- User processes
- Background services

---

# Task 2 - Monitor System Activity

## Objective

Monitor live system activity.

Run:

```bash
top
```

Review:

- CPU usage
- Memory usage
- Running processes

If installed:

```bash
htop
```

Identify:

```text
Highest CPU process:

Highest memory process:
```

---

# Task 3 - Find a Process

## Objective

Locate running processes.

Search for SSH:

```bash
pgrep ssh
```

View details:

```bash
ps -fp PID
```

Replace:

```text
PID
```

with the process ID returned.

Record:

```text
SSH Process ID:
```

---

# Task 4 - Manage a Process

## Objective

Understand how processes can be controlled.

Start a background process:

```bash
sleep 300 &
```

Find the process:

```bash
ps aux | grep sleep
```

Stop the process:

```bash
kill PID
```

Confirm it has stopped:

```bash
ps aux | grep sleep
```

---

# Task 5 - Check System Services

## Objective

Use systemd to manage services.

Check SSH:

```bash
systemctl status ssh
```

Record:

```text
Service status:

Running PID:
```

---

# Task 6 - List Running Services

View active services:

```bash
systemctl list-units --type=service
```

Identify:

- Running services
- Service names
- Current states

Record three services:

```text
Service 1:

Service 2:

Service 3:
```

---

# Task 7 - Manage a Service

## Objective

Start, stop and restart services.

Choose a test service.

Example:

```text
cron
```

Check status:

```bash
systemctl status cron
```

Stop:

```bash
sudo systemctl stop cron
```

Confirm:

```bash
systemctl status cron
```

Start again:

```bash
sudo systemctl start cron
```

Verify:

```bash
systemctl status cron
```

---

# Task 8 - Enable a Service

Check if SSH starts automatically:

```bash
systemctl is-enabled ssh
```

Enable if required:

```bash
sudo systemctl enable ssh
```

Confirm:

```bash
systemctl is-enabled ssh
```

---

# Task 9 - Review Service Logs

## Objective

Investigate service activity.

View SSH logs:

```bash
journalctl -u ssh
```

View recent entries:

```bash
journalctl -u ssh -n 20
```

Identify:

- Service startup messages
- Login activity
- Errors

---

# Task 10 - Investigate System Errors

Find errors:

```bash
journalctl -p err
```

Review:

- Failed services
- Hardware messages
- System warnings

Record:

```text
Errors found:

Actions taken:
```

---

# Task 11 - Boot Troubleshooting

View current boot logs:

```bash
journalctl -b
```

View previous boot:

```bash
journalctl -b -1
```

Identify:

- Startup messages
- Failed services
- Warnings

---

# Troubleshooting Scenario

## Scenario

A web service is unavailable.

You are told:

> Users cannot access the website.

Perform the following investigation.

---

# Step 1 - Check Service Status

Example:

```bash
systemctl status nginx
```

Questions:

- Is the service running?
- Is the service failed?
- What PID is running?

---

# Step 2 - Review Logs

Run:

```bash
journalctl -u nginx
```

Look for:

- Configuration errors
- Permission issues
- Startup failures

---

# Step 3 - Restart Service

If appropriate:

```bash
sudo systemctl restart nginx
```

Verify:

```bash
systemctl status nginx
```

---

# Knowledge Check

1. What command shows running processes?

2. What does PID mean?

3. What command manages systemd services?

4. How do you view logs for a service?

5. How do you restart a service?

6. What command shows errors in the system journal?

7. Why are logs important when troubleshooting?

---

# Lab Completion Checklist

| Task | Complete |
|---|---|
| View running processes | ☐ |
| Monitor system activity | ☐ |
| Find processes | ☐ |
| Stop and manage processes | ☐ |
| Check services | ☐ |
| Start and stop services | ☐ |
| Enable services | ☐ |
| Review journal logs | ☐ |
| Investigate errors | ☐ |
| Complete troubleshooting scenario | ☐ |

---

# Summary

You have completed the Processes and Services module.

You should now understand:

✓ Linux processes  
✓ Process monitoring  
✓ Process management  
✓ systemd services  
✓ Service troubleshooting  
✓ Linux logging  
✓ journalctl administration  

---

# Next Module

## Module 05 - Package Management

You will learn:

- Linux package managers
- Software repositories
- Installing applications
- Updating systems
- Managing software packages