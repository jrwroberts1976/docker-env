# Docker Environment

Version-controlled Docker Compose configuration for the services running on my TestServer homelab host.

This repository is the authoritative configuration baseline for the managed Docker estate. It records Compose definitions, tracked local-build sources, operational helpers and selected training-content submodules. Runtime data and secrets are deliberately kept outside Git.

## Repository layout

```text
.
├── scripts/        Operational, validation and controlled-build helpers
├── stacks/         Docker Compose stacks and tracked build contexts
├── .gitmodules     Training-content submodule definitions
└── .gitignore      Runtime-data, secret, backup and generated-file exclusions
```

### Managed stacks

| Stack | Purpose |
|---|---|
| `alloy` | Grafana Alloy telemetry collection |
| `availability` | Availability monitoring, including SmokePing and related services |
| `birdnet-go` | BirdNET-Go and its tracked Prometheus exporter |
| `cloudflare-ddns` | Cloudflare dynamic DNS updates |
| `crowdsec` | CrowdSec security services |
| `dashboards` | Homepage and dashboard services |
| `maintenance-page` | Controlled maintenance page and switching helpers |
| `management` | Container-management and operational tools |
| `monitoring` | Prometheus, exporters, logs and monitoring services |
| `proxy-auth` | Reverse-proxy authentication and supporting services |
| `training-platform` | Preserved training-platform content and retirement documentation |
| `wud` | Container update visibility with What's Up Docker |

Some application repositories, such as the Engineering Portfolio and Projects documentation site, have their own source repositories and Compose ownership. They are intentionally not duplicated here.

## Operating model

Changes follow a controlled workflow:

1. Assess the running container and its current Compose ownership.
2. Make a narrow change on a branch.
3. Validate shell syntax and `docker compose config`.
4. Review and merge through a pull request.
5. Pull the merged `main` branch on TestServer.
6. Build or reconcile only the affected service.
7. Retain an explicit rollback image before container recreation.
8. Verify container health, service endpoints and monitoring targets.
9. Record the resulting image and source provenance.

Avoid running broad commands such as `docker compose up -d` from the repository root. Operate on one explicit Compose file and service at a time.

## Using a stack

The repository is deployed at `/home/james/docker` on TestServer. Paths and network names in several Compose files are host-specific.

Validate a stack before making any runtime change:

```bash
cd /home/james/docker

docker compose \
  --file stacks/<stack>/docker-compose.yml \
  config --quiet
```

Start or reconcile an explicitly selected service:

```bash
docker compose \
  --file stacks/<stack>/docker-compose.yml \
  up --detach <service>
```

Some stacks use `compose.yml` or `docker-compose.yaml`; use the filename committed within that stack.

## Local image builds and provenance

Tracked local builds use OCI labels to connect a Docker image to its source revision:

- `org.opencontainers.image.source`
- `org.opencontainers.image.revision`
- `org.opencontainers.image.created`

Controlled helpers currently include:

```text
scripts/build-birdnet-exporter.sh
scripts/build-crowdsec-exporter.sh
```

Each helper supports validation without changing a container:

```bash
bash scripts/build-birdnet-exporter.sh --validate-only
bash scripts/build-crowdsec-exporter.sh --validate-only
```

A labelled candidate can then be built explicitly with `--build`. Building an image does not by itself recreate the running container.

Registry images use version tags or immutable digests where practical. Approved exceptions and estate-wide policy assessment are maintained in the [Homelab Container Version Control](https://github.com/jrwroberts1976/homelab-container-version-control) project.

## Secrets and runtime data

Secrets must not be committed. Local configuration is supplied through ignored files or host-managed secret paths, including:

```text
.env
secrets/
*.key
*.pem
```

Runtime data under `data/`, logs, generated sites, operational backups and archived deployment trees are also excluded.

Before committing:

```bash
git status --short
git diff --check
git diff --cached --check
```

Review staged filenames and content carefully. Never paste secret values into issues, pull requests, logs or inventory reports.

## Submodules

Training repositories are represented as Git submodules. To initialise them after cloning:

```bash
git clone https://github.com/jrwroberts1976/docker-env.git
cd docker-env
git submodule update --init --recursive
```

Submodules may represent preserved or separately managed content; do not update every submodule automatically during an unrelated Docker change.

## Operational scripts

The `scripts/` directory includes helpers for:

- prerequisite and platform verification;
- repository and submodule setup;
- controlled BirdNET and CrowdSec exporter builds;
- maintenance-mode switching;
- training-content synchronisation and deployment.

Inspect a script and use its validation mode where available before execution.

## Recovery

Before recreating a service, tag its current image with a timestamped rollback reference:

```bash
docker image tag \
  "$(docker inspect <container> --format '{{.Image}}')" \
  "<service>:rollback-$(date +%Y%m%d-%H%M%S)"
```

Keep the rollback image until the replacement passes health, endpoint, monitoring and provenance checks.

## Scope

This is a personal homelab configuration repository, not a turnkey deployment for other environments. IP addresses, bind mounts, external Docker networks and filesystem paths may be specific to TestServer. Review every Compose file before reuse.
