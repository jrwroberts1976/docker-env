# Managing GitHub Enterprise Server Operations

## Overview

Deploying an enterprise Git platform is only the beginning.

A production platform requires ongoing operational management to ensure availability, security, and performance.

In this lesson we will look at the responsibilities of a GitHub Enterprise Server administrator and how operational practices keep the platform reliable.

---

# Learning Objectives

By the end of this lesson you will understand:

- The operational responsibilities of managing GitHub Enterprise Server.
- How to monitor platform health.
- Why backups are important.
- How updates and maintenance are performed.
- How enterprise platforms are supported.

---

# Operating an Enterprise Git Platform

A production Git platform requires regular management.

The operational lifecycle:

```text
Deploy

 |

Configure

 |

Monitor

 |

Maintain

 |

Update

 |

Improve
```

---

# Administrator Responsibilities

A GitHub Enterprise Server administrator manages:

## Platform Availability

Ensuring users can:

- Access repositories.
- Clone code.
- Push changes.
- Create Pull Requests.

---

## User Management

Responsibilities include:

- Creating users.
- Managing teams.
- Reviewing permissions.
- Removing inactive accounts.

---

## Security Management

Tasks include:

- Reviewing access.
- Managing authentication.
- Applying security updates.
- Monitoring audit events.

---

# Monitoring Platform Health

Enterprise platforms should be monitored continuously.

Important areas:

```text
GitHub Enterprise Server

|

├── System Resources

├── Application Health

├── Storage

├── Network

└── Security Events
```

---

# System Monitoring

Monitor:

## CPU

High CPU usage may indicate:

- Heavy automation workloads.
- Large repository activity.
- Background processing.

---

## Memory

Monitor:

- Available memory.
- Application usage.
- Performance impact.

---

## Disk Usage

Repositories grow over time.

Monitor:

```bash
df -h
```

Example:

```text
Filesystem

Size

Used

Available
```

---

# Network Monitoring

Git operations rely on network availability.

Monitor:

- HTTPS connectivity.
- SSH access.
- DNS resolution.
- Latency.

Example:

```bash
ping github.home.local
```

---

# Backup Strategy

Backups protect against:

- Hardware failure.
- Configuration errors.
- Accidental deletion.
- Security incidents.

A backup strategy should include:

```text
Production Platform

        |

        |

Backup Process

        |

        |

Backup Storage
```

---

# Backup Considerations

Important items:

## Repository Data

Includes:

- Git repositories.
- Commit history.
- Branches.

---

## Configuration

Includes:

- System settings.
- Authentication configuration.
- Application settings.

---

## User Information

Includes:

- Accounts.
- Permissions.
- Organisations.

---

# Recovery Planning

A good backup strategy includes testing recovery.

Important terms:

| Term | Meaning |
|---|---|
| RPO | Maximum acceptable data loss |
| RTO | Maximum acceptable recovery time |

Example:

```text
Failure Occurs

        |

Restore Backup

        |

Platform Available Again
```

---

# Updating GitHub Enterprise Server

Enterprise software requires regular updates.

Reasons:

- Security fixes.
- Bug fixes.
- New features.
- Performance improvements.

---

# Update Process

A controlled update process:

```text
Review Update

        |

Backup System

        |

Schedule Maintenance

        |

Apply Update

        |

Validate Platform

        |

Resume Service
```

---

# Change Management

Enterprise changes should be controlled.

Example workflow:

```text
Change Request

        |

Review

        |

Approval

        |

Implementation

        |

Validation
```

This prevents uncontrolled changes.

---

# Logging and Auditing

Audit logs provide visibility into platform activity.

Examples:

- User logins.
- Repository changes.
- Permission changes.
- Administrative actions.

Audit information supports:

- Security investigations.
- Compliance.
- Troubleshooting.

---

# Incident Management

Operational teams need a process for failures.

Example:

```text
Issue Detected

        |

Investigate

        |

Restore Service

        |

Identify Cause

        |

Improve Process
```

---

# Monitoring Integration

Our homelab already contains monitoring tools:

```text
Homelab Monitoring

├── Prometheus

├── Grafana

├── Loki

└── Alerting
```

The Git platform can become part of this monitoring environment.

---

# Example Operational Dashboard

Useful metrics:

```text
Git Platform Health

CPU Usage

Memory Usage

Disk Capacity

Network Availability

User Activity

Repository Activity
```

---

# Security Operations

Regular security tasks:

## Access Reviews

Review:

- Users.
- Teams.
- Permissions.

---

## Secret Management

Ensure:

- Credentials are protected.
- Tokens are rotated.
- Secrets are not stored in repositories.

---

## Patch Management

Keep:

- Platform software.
- Operating systems.
- Dependencies.

up to date.

---

# Disaster Recovery Planning

A complete recovery plan includes:

```text
Backup

+

Recovery Procedure

+

Testing

+

Documentation
```

A backup that has never been tested is not a complete recovery strategy.

---

# Practical Exercise

## Operational Review

Create an operations checklist:

```text
Daily:

[ ] Check platform availability

[ ] Review alerts


Weekly:

[ ] Review storage usage

[ ] Review user activity


Monthly:

[ ] Review permissions

[ ] Review updates
```

---

# Knowledge Check

## Questions

1. Why does an enterprise Git platform require ongoing management?

2. What should backups protect?

3. Why should updates be planned?

4. What information do audit logs provide?

5. Why should recovery procedures be tested?

---

# Summary

In this lesson you learned:

- How GitHub Enterprise Server is operated.
- The importance of monitoring.
- Backup and recovery planning.
- Update management.
- Security and operational responsibilities.

---

# Next Lesson

Continue to **Git Enterprise Project - Building a Complete Engineering Workflow** to bring together Git, repositories, automation, and operations into one complete project.
