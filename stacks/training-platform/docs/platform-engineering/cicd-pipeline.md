# CI/CD Pipeline

## Overview

The platform follows a continuous integration and continuous delivery approach to ensure documentation changes can be delivered safely, consistently, and repeatably.

The pipeline automates the process from content changes through validation and deployment, reducing manual effort and improving confidence in changes.

## Pipeline Workflow

The typical workflow is:

```text
Developer Change
        |
        v
Git Repository
        |
        v
GitHub Actions Pipeline
        |
        v
Docker Build
        |
        v
MkDocs Validation
        |
        v
Deployment
        |
        v
Published Documentation
```

## Continuous Integration

When changes are committed:

* Repository changes are tracked through Git
* The deployment pipeline is triggered automatically
* The training platform Docker image is built
* MkDocs validation is performed
* Configuration and documentation issues are identified before release

The validation process uses:

```bash
mkdocs build --strict
```

This ensures:

* Documentation builds successfully
* Navigation configuration is valid
* Build errors are identified early
* Broken changes do not reach the published platform

## Containerised Documentation Builds

The documentation platform uses Docker to provide a consistent build environment.

MkDocs and its dependencies are installed within the training platform container rather than relying on software installed directly on the host system.

This provides:

* Repeatable builds
* Consistent environments across systems
* Reduced dependency conflicts
* Easier platform migration
* Alignment with modern DevOps practices

The same container image used for validation is used as part of the deployment process, ensuring the tested environment matches the running platform.

## Dependency Management

Platform dependencies are managed through `requirements.txt`.

Dependencies are version controlled to ensure future builds use known working versions.

Example:

```text
mkdocs==<version>
mkdocs-material==<version>
```

Pinning dependencies prevents unexpected package updates from introducing changes that could affect the documentation platform.

## Continuous Delivery

Once changes pass validation:

* Deployment is performed automatically
* Updates are published without manual intervention
* The delivery process remains repeatable and auditable

The deployment workflow runs through GitHub Actions using a self-hosted runner within the homelab environment.

## Platform Engineering Principles

This pipeline demonstrates key platform engineering practices:

* Automation over manual processes
* Infrastructure and configuration managed as code
* Automated quality checks
* Repeatable deployments
* Continuous improvement

The objective is to provide a reliable internal platform that enables engineers to create, validate, and deliver technical content efficiently.
