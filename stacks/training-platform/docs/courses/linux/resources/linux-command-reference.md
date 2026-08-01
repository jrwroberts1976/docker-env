# Linux Command Reference

A quick reference guide for common Linux commands used throughout the training course.

This document is designed as a companion reference and does not replace the individual lessons.

---

# Navigation Commands

## pwd - Print Working Directory

Shows your current location.

```bash
pwd
```

Example:

```text
/home/james/projects
```

---

## ls - List Files

Displays files and directories.

Basic usage:

```bash
ls
```

Detailed listing:

```bash
ls -l
```

Show hidden files:

```bash
ls -a
```

Human-readable sizes:

```bash
ls -lh
```

Common combination:

```bash
ls -lah
```

---

## cd - Change Directory

Move between directories.

Go to home directory:

```bash
cd
```

Go to a specific directory:

```bash
cd /etc
```

Move up one level:

```bash
cd ..
```

Return to previous directory:

```bash
cd -
```

---

# File and Directory Management

## mkdir - Create Directory

Create a directory:

```bash
mkdir directory-name
```

Create nested directories:

```bash
mkdir -p projects/linux/module01
```

---

## touch - Create Empty File

Create a file:

```bash
touch notes.txt
```

Create multiple files:

```bash
touch file1.txt file2.txt
```

---

## cp - Copy Files

Copy a file:

```bash
cp source.txt destination.txt
```

Copy directories:

```bash
cp -r directory backup-directory
```

---

## mv - Move or Rename

Move a file:

```bash
mv file.txt /tmp/
```

Rename a file:

```bash
mv oldname.txt newname.txt
```

---

## rm - Remove Files

Remove a file:

```bash
rm file.txt
```

Remove a directory:

```bash
rm -r directory
```

Force removal:

```bash
rm -rf directory
```

⚠️ Use `rm -rf` carefully.

---

## rmdir - Remove Empty Directory

```bash
rmdir directory-name
```

---

# Viewing Files

## cat

Display file contents:

```bash
cat filename
```

---

## less

View large files page by page:

```bash
less logfile.txt
```

Useful keys:

```
q       Quit
space   Next page
/word   Search
```

---

## head

Display first lines:

```bash
head file.txt
```

Specify number of lines:

```bash
head -n 20 file.txt
```

---

## tail

Display last lines:

```bash
tail logfile.txt
```

Follow live changes:

```bash
tail -f logfile.log
```

Commonly used for log monitoring.

---

# Searching

## find

Search the filesystem.

Find by name:

```bash
find /home -name "*.txt"
```

Find files:

```bash
find . -type f
```

Find directories:

```bash
find . -type d
```

---

## locate

Fast file searching.

```bash
locate filename
```

Update database:

```bash
sudo updatedb
```

---

## grep

Search inside files.

Example:

```bash
grep error logfile.txt
```

Recursive search:

```bash
grep -r "error" /var/log
```

---

# Permissions

## chmod

Change permissions.

Make a script executable:

```bash
chmod +x script.sh
```

Numeric permissions:

```bash
chmod 755 script.sh
```

---

## chown

Change ownership.

Example:

```bash
sudo chown james file.txt
```

Change owner and group:

```bash
sudo chown james:developers file.txt
```

---

# Users and Groups

## whoami

Show current user:

```bash
whoami
```

---

## who

Show logged-in users:

```bash
who
```

---

## id

Show user information:

```bash
id
```

---

## useradd

Create user:

```bash
sudo useradd username
```

---

## passwd

Set password:

```bash
sudo passwd username
```

---

## groupadd

Create group:

```bash
sudo groupadd developers
```

---

# Processes

## ps

Display processes:

```bash
ps
```

Detailed view:

```bash
ps aux
```

---

## top

Live process monitoring:

```bash
top
```

---

## systemctl

Manage services.

Check service:

```bash
systemctl status ssh
```

Start service:

```bash
sudo systemctl start service-name
```

Enable at boot:

```bash
sudo systemctl enable service-name
```

---

## journalctl

View system logs.

View logs:

```bash
journalctl
```

Follow live logs:

```bash
journalctl -f
```

View service logs:

```bash
journalctl -u ssh
```

---

# Networking

## ip

View network information:

```bash
ip addr
```

View routes:

```bash
ip route
```

---

## ping

Test connectivity:

```bash
ping google.com
```

---

## curl

Test HTTP services:

```bash
curl https://example.com
```

---

## ssh

Remote login:

```bash
ssh username@server
```

---

## ss

View network connections:

```bash
ss -tulpn
```

---

# Storage

## df

Display filesystem usage:

```bash
df -h
```

---

## du

Display directory usage:

```bash
du -sh directory
```

---

## lsblk

Display disks:

```bash
lsblk
```

---

## mount

Display mounted filesystems:

```bash
mount
```

---

# Package Management

## Debian / Ubuntu

Update packages:

```bash
sudo apt update
```

Install software:

```bash
sudo apt install package-name
```

Remove software:

```bash
sudo apt remove package-name
```

---

## Red Hat / Rocky Linux

Install software:

```bash
sudo dnf install package-name
```

Update system:

```bash
sudo dnf update
```

---

# Shell and Environment

## echo

Display text:

```bash
echo "Hello Linux"
```

Display variables:

```bash
echo $PATH
```

---

## history

Show previous commands:

```bash
history
```

---

## which

Locate commands:

```bash
which ls
```

---

## man

Display manual pages:

```bash
man command
```

Example:

```bash
man ls
```

---

# System Information

## uname

Kernel information:

```bash
uname -r
```

Full information:

```bash
uname -a
```

---

## hostname

Display hostname:

```bash
hostname
```

---

## free

Memory usage:

```bash
free -h
```

---

## uptime

System uptime:

```bash
uptime
```

---

# Keyboard Shortcuts

| Shortcut | Description |
|---|---|
| Ctrl + C | Cancel command |
| Ctrl + L | Clear terminal |
| Ctrl + D | Logout |
| Tab | Auto-complete |
| ↑ | Previous command |
| ↓ | Next command |

---

# Useful Linux Directories

| Directory | Purpose |
|---|---|
| `/` | Root filesystem |
| `/home` | User files |
| `/etc` | Configuration files |
| `/var` | Logs and changing data |
| `/tmp` | Temporary files |
| `/usr` | Applications and utilities |
| `/bin` | Essential commands |
| `/opt` | Optional software |

---

# Course Modules Using This Reference

This reference supports:

- Module 00 - Introduction to Linux
- Module 01 - Command Line Fundamentals
- Module 02 - Linux Filesystem Administration
- Module 03 - Users and Groups
- Module 04 - Processes and Services
- Module 05 - Package Management
- Module 06 - Networking
- Module 07 - Storage
- Module 08 - Bash Scripting
- Module 09 - Security
- Module 10 - Troubleshooting