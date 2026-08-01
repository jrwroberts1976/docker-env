# Lesson 03 - Systemd and Service Management

> **Estimated time:** 60–90 minutes  
>
> **Prerequisites:**
> - Module 04 – Processes and Services
> - Lesson 01 – Understanding Linux Processes
> - Lesson 02 – Managing Linux Processes
>
> **Difficulty:** Beginner to Intermediate
>
> **Hands-on exercises:** Yes

---

# Overview

Modern Linux systems use **systemd** to manage system startup, background services and system processes.

Services such as web servers, databases, SSH access and monitoring tools are controlled by systemd.

Understanding systemd is an essential Linux administration skill because it allows administrators to:

- Start and stop services
- Enable services at boot
- Check service status
- Investigate failures
- Review service logs

---

# What is systemd?

systemd is the service manager used by most modern Linux distributions.

Examples:

- Ubuntu
- Debian
- Rocky Linux
- Fedora
- Red Hat Enterprise Linux

systemd is responsible for:

- Starting services during boot
- Managing running services
- Monitoring service health
- Handling dependencies
- Recording service events

The systemd process normally runs as:

```text
PID 1
```

Check:

```bash
ps -p 1
```

Example:

```text
PID TTY      TIME CMD
1   ?        00:00:03 systemd
```

---

# Services

A service is a background process that provides functionality to the system.

Examples:

| Service | Purpose |
|---|---|
| ssh | Remote administration |
| nginx | Web server |
| cron | Scheduled tasks |
| docker | Container management |
| networking | Network management |

Services normally run without user interaction.

---

# Service Units

systemd manages services using unit files.

Common unit types:

| Unit Type | Purpose |
|---|---|
| `.service` | System services |
| `.timer` | Scheduled tasks |
| `.socket` | Network sockets |
| `.mount` | Filesystem mounts |

Example:

```text
ssh.service
```

---

# Checking Service Status

The main command for managing services is:

```bash
systemctl
```

To check a service:

```bash
systemctl status ssh
```

Example:

```text
● ssh.service - OpenBSD Secure Shell server
     Loaded: loaded
     Active: active (running)
```

Important information:

- Service name
- Current state
- Process ID
- Recent log messages

---

# Service States

Common service states:

| State | Meaning |
|---|---|
| active (running) | Service is running |
| inactive | Service is stopped |
| failed | Service failed |
| activating | Service starting |
| deactivating | Service stopping |

---

# Starting Services

Start a service:

```bash
sudo systemctl start service_name
```

Example:

```bash
sudo systemctl start nginx
```

The service starts immediately.

---

# Stopping Services

Stop a service:

```bash
sudo systemctl stop service_name
```

Example:

```bash
sudo systemctl stop nginx
```

The service stops immediately.

---

# Restarting Services

Restart a service:

```bash
sudo systemctl restart service_name
```

Example:

```bash
sudo systemctl restart ssh
```

Restarting is commonly used after configuration changes.

---

# Reloading Services

Some services support configuration reloads without stopping.

Example:

```bash
sudo systemctl reload nginx
```

This applies configuration changes while keeping the service running.

---

# Enabling Services at Boot

A service can be configured to start automatically when Linux boots.

Enable:

```bash
sudo systemctl enable service_name
```

Example:

```bash
sudo systemctl enable docker
```

---

# Disabling Services at Boot

Prevent automatic startup:

```bash
sudo systemctl disable service_name
```

Example:

```bash
sudo systemctl disable nginx
```

---

# Checking Enabled Services

View enabled services:

```bash
systemctl list-unit-files --type=service
```

Example:

```text
ssh.service       enabled
docker.service    enabled
nginx.service     disabled
```

---

# Listing Running Services

View active services:

```bash
systemctl list-units --type=service
```

Example:

```text
ssh.service
cron.service
docker.service
```

---

# Finding Service Files

Service files are stored in:

```text
/usr/lib/systemd/system/
```

and:

```text
/etc/systemd/system/
```

Example:

```bash
ls /etc/systemd/system
```

---

# Viewing Service Dependencies

Services can depend on other services.

View dependencies:

```bash
systemctl list-dependencies service_name
```

Example:

```bash
systemctl list-dependencies ssh
```

---

# Practical Exercises

## Task 1 - Check SSH Service

Run:

```bash
systemctl status ssh
```

Record:

```text
Status:

PID:
```

---

## Task 2 - Find Running Services

Run:

```bash
systemctl list-units --type=service
```

Identify:

- Running services
- Service names
- Current states

---

## Task 3 - Check Service Startup

Run:

```bash
systemctl is-enabled ssh
```

Record:

```text
Enabled:
```

---

# Knowledge Check

1. What is systemd?

2. What PID does systemd normally use?

3. What command checks service status?

4. How do you restart a service?

5. How do you enable a service at boot?

6. Where are systemd service files stored?

---

# Summary

In this lesson you learned:

✓ What systemd is  
✓ How Linux manages services  
✓ How to check service status  
✓ How to start and stop services  
✓ How to enable services at boot  
✓ How to investigate service information  

---

# Next Lesson

## Lesson 04 - Logs and journalctl

You will learn:

- Linux logging
- systemd journal
- Viewing service logs
- Troubleshooting failed services
- Analysing system events