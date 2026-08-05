# Working With Remote Repositories

## Overview

Local Git repositories allow engineers to track changes on their own workstation, but professional engineering teams need a way to share work, collaborate, and manage projects centrally.

Remote repositories provide a shared location where teams can store Git repositories and collaborate using professional workflows.

In this lesson we will learn how Git connects to remote repositories, how changes are pushed and pulled, and how this workflow will later connect to GitHub Enterprise Server.

---

# Learning Objectives

By the end of this lesson you will understand:

- What a remote repository is.
- The difference between local and remote repositories.
- How to connect Git to a remote repository.
- How to push changes.
- How to pull changes.
- How GitHub Enterprise Server fits into the workflow.

---

# Local vs Remote Repositories

## Local Repository

A local repository exists on an engineer's workstation.

Example:

```text
Developer Laptop

git-project/

├── .git
├── README.md
└── application/
```

The local repository stores:

- Files.
- Commits.
- Branch history.
- Local configuration.

---

## Remote Repository

A remote repository is hosted on another system.

Examples:

- GitHub.
- GitHub Enterprise Server.
- GitLab.
- Bitbucket.

Example:

```text
                 Remote Repository

                 GitHub Enterprise Server

                         |

                         |

                  Developer Laptop

                    Local Repository
```

Remote repositories allow teams to:

- Share code.
- Collaborate.
- Review changes.
- Automate deployments.

---

# Adding a Remote Repository

## The Remote Name

Git uses a name to identify remote repositories.

The default name is normally:

```text
origin
```

Example:

```bash
git remote add origin https://github.example.com/team/project.git
```

This tells Git:

- Where the remote repository exists.
- What name to use when referencing it.

---

# Viewing Remote Connections

To view configured remotes:

```bash
git remote -v
```

Example output:

```text
origin https://github.example.com/team/project.git (fetch)

origin https://github.example.com/team/project.git (push)
```

---

# Pushing Changes

## Uploading Commits

The `git push` command sends local commits to a remote repository.

Example:

```bash
git push origin main
```

The workflow:

```text
Developer Laptop

        |

        |

        v

Local Repository

        |

        |

     git push

        |

        |

        v

Remote Repository
```

---

# First Push

When pushing a new repository for the first time:

```bash
git push -u origin main
```

The `-u` option creates a tracking relationship.

After this, Git remembers the remote branch.

Future pushes can simply use:

```bash
git push
```

---

# Pulling Changes

## Downloading Updates

The `git pull` command downloads changes from a remote repository.

Example:

```bash
git pull
```

Workflow:

```text
Remote Repository

        |

        |

     git pull

        |

        |

Local Repository
```

This keeps local work synchronised with the team.

---

# Fetch vs Pull

Git provides two ways to retrieve remote changes.

## Git Fetch

Downloads information but does not change local files.

Example:

```bash
git fetch
```

Workflow:

```text
Remote Repository

        |

        |

     git fetch

        |

        |

Review Changes
```

---

## Git Pull

Downloads changes and updates the current branch.

Example:

```bash
git pull
```

Workflow:

```text
Remote Repository

        |

        |

     git pull

        |

        |

Updated Local Branch
```

---

# Cloning a Repository

Instead of creating a repository manually, engineers often clone an existing repository.

Example:

```bash
git clone https://github.example.com/team/project.git
```

This creates a local copy.

Example:

```text
Remote Repository

        |

        |

      clone

        |

        |

Developer Laptop

project/

├── .git
├── README.md
└── files
```

---

# Authentication

Remote repositories require authentication.

Common methods include:

## Username and Password

Historically used, but now mostly replaced by stronger methods.

---

## SSH Keys

SSH authentication uses cryptographic keys.

Example:

```text
Developer

Private Key

     |

     |

     v

GitHub Enterprise Server

Public Key
```

Benefits:

- Secure authentication.
- No password required.
- Common in enterprise environments.

---

## Personal Access Tokens

Tokens provide controlled access to repositories.

Used for:

- API access.
- Automation.
- Command-line authentication.

---

# Enterprise Git Workflow

In a professional environment:

```text
Engineer

   |

Create Branch

   |

Make Changes

   |

Commit Changes

   |

Push Branch

   |

Remote Repository

   |

Pull Request

   |

Code Review

   |

Merge
```

This creates a controlled development process.

---

# GitHub Enterprise Server Example

Our course scenario:

```text
Microsoft Azure

└── GitHub Enterprise Server

    ├── Organisation

    │

    ├── Teams

    │

    ├── Repositories

    │

    └── Actions Pipelines
```

Engineers connect using Git:

```bash
git clone https://github.enterprise.local/platform/project.git
```

They can then:

- Create branches.
- Commit changes.
- Push updates.
- Submit Pull Requests.

---

# Practical Exercise

## Create a Remote Repository Workflow

Complete the following:

1. Create a repository on a Git hosting platform.
2. Connect your local repository:

```bash
git remote add origin <repository-url>
```

3. Push your changes:

```bash
git push -u origin main
```

4. Make another change.
5. Commit the change.
6. Push again.

---

# Knowledge Check

## Questions

1. What is the difference between a local and remote repository?

2. What does `git push` do?

3. What does `git pull` do?

4. Why are SSH keys commonly used with enterprise Git platforms?

5. What is the purpose of the remote name `origin`?

---

# Summary

In this lesson you learned:

- What remote repositories are.
- How local and remote repositories work together.
- How to add remote connections.
- How to push and pull changes.
- How authentication works.
- How Git connects to GitHub Enterprise Server.

---

# Next Lesson

Continue to **Git Branching and Collaboration Workflows** to learn how engineering teams use branches, Pull Requests, and reviews to safely manage changes.
