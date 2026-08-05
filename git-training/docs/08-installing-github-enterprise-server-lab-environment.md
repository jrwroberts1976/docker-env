# Installing GitHub Enterprise Server in the Lab Environment

## Overview

In this lesson we will begin the installation process for our enterprise Git platform.

GitHub Enterprise Server is delivered as a virtual appliance designed to run on supported virtualisation platforms.

Before installation, we must understand the deployment requirements, prepare the host environment, and complete the initial configuration process.

This lesson focuses on the installation approach and the engineering practices required when deploying enterprise software.

---

# Learning Objectives

By the end of this lesson you will understand:

- How GitHub Enterprise Server is deployed.
- The role of the virtual appliance.
- The infrastructure preparation required.
- Network requirements.
- Initial configuration steps.
- How the deployment fits into an operational environment.

---

# GitHub Enterprise Server Architecture

GitHub Enterprise Server is a complete application platform.

It includes:

- Git repository hosting.
- Web interface.
- User management.
- Authentication.
- Pull Requests.
- Actions workflows.
- Administration tools.

The platform architecture:

```text
GitHub Enterprise Server Appliance

|

+-- Web Application

|

+-- Git Services

|

+-- Repository Storage

|

+-- Database Services

|

+-- Background Workers

|

+-- Administration Interface
```

---

# Deployment Requirements

Before installation, confirm the required resources.

## Compute Requirements

The appliance requires sufficient:

- CPU.
- Memory.
- Disk capacity.

Sizing depends on:

- Number of users.
- Repository size.
- Automation workload.
- Expected growth.

---

## Storage Requirements

Storage is critical because GitHub Enterprise Server stores:

- Repository data.
- Commit history.
- User information.
- Application configuration.

Planning considerations:

```text
Repository Growth

+

User Growth

+

Backup Storage

=

Required Capacity
```

---

## Network Requirements

The platform requires reliable network access.

Example:

```text
Developer Machine

        |

        |

      HTTPS

        |

        |

GitHub Enterprise Server

192.168.2.220
```

Required services:

| Port | Purpose |
|---|---|
| 443 | Web access and Git operations |
| 22 | SSH access |
| 80 | HTTP redirect |

---

# Preparing the Lab Environment

Our lab server:

```text
Hostname:

TestServer


IP Address:

192.168.2.220


Network:

192.168.2.0/24
```

Before deployment verify:

## Network Connectivity

Test connectivity:

```bash
ping 192.168.2.220
```

---

## System Resources

Check CPU:

```bash
lscpu
```

Check memory:

```bash
free -h
```

Check storage:

```bash
df -h
```

---

# Installation Planning

Before installing any enterprise platform, document:

## Application

What is being installed?

```text
GitHub Enterprise Server
```

---

## Location

Where will it run?

```text
Private Lab Environment

192.168.2.220
```

---

## Access

Who requires access?

Examples:

- Administrators.
- Developers.
- Operations teams.

---

## Operations

How will it be managed?

Examples:

- Monitoring.
- Backups.
- Updates.
- Security reviews.

---

# Initial Configuration Process

After deployment, the administrator completes initial setup.

Typical steps:

```text
Start Appliance

        |

Network Configuration

        |

Create Administrator Account

        |

Configure Authentication

        |

Configure Organisation

        |

Create Repositories
```

---

# Administrator Access

Administrative access should be controlled carefully.

Good practice:

- Use strong authentication.
- Limit administrator accounts.
- Enable audit logging.
- Avoid shared accounts.

Example:

```text
Administrator

        |

Authentication

        |

GitHub Enterprise Server

        |

Management Console
```

---

# Initial Repository Structure

After installation, create an initial structure.

Example:

```text
Organisation:

Engineering


Repositories:

├── infrastructure

├── automation

├── documentation

├── applications

└── training
```

---

# Connecting Git Clients

Once the platform is running, engineers connect using Git.

Example:

```bash
git clone https://github.home.local/engineering/project.git
```

or:

```bash
git clone git@github.home.local:engineering/project.git
```

---

# Security Considerations

During installation consider:

## Access Control

Who can:

- Create repositories?
- Modify code?
- Administer the platform?

---

## Network Security

Restrict:

- Management access.
- External exposure.
- Administrative interfaces.

---

## Updates

Enterprise platforms require regular maintenance:

- Security patches.
- Version upgrades.
- Configuration reviews.

---

# Operational Integration

The Git platform becomes part of the wider engineering environment.

Example:

```text
GitHub Enterprise Server

        |

        |

Monitoring

        |

        |

Prometheus / Grafana


        |

        |

Documentation Platform
```

---

# Practical Exercise

## Installation Preparation Checklist

Complete the following:

- [ ] Confirm server resources.
- [ ] Confirm network connectivity.
- [ ] Document access requirements.
- [ ] Plan DNS name.
- [ ] Plan backup location.
- [ ] Plan monitoring.

---

# Knowledge Check

## Questions

1. What type of platform is GitHub Enterprise Server?

2. Why is storage planning important?

3. Which ports are commonly required for GitHub access?

4. Why should administrator access be controlled?

5. Why should enterprise platforms be monitored?

---

# Summary

In this lesson you learned:

- How GitHub Enterprise Server is structured.
- The resources required for deployment.
- How to prepare the lab environment.
- Initial configuration considerations.
- Operational requirements after installation.

---

# Next Lesson

Continue to **Configuring GitHub Enterprise Server and Creating Your First Organisation** to begin using the platform after installation.
