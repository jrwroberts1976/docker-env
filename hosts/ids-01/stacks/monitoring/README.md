# ids-01 monitoring stack

## Purpose

This directory is the Git authority for the Docker monitoring stack running on `ids-01`.

Runtime paths remain under:

```text
/home/james/docker/stacks/monitoring
/home/james/docker/data/monitoring
/home/james/docker/secrets
```

Do not confuse this host-specific authority with the TestServer stack at `stacks/monitoring/`.

## Validated state — 4 September 2026

Key services:

```text
Grafana    13.2.0   :3001
Prometheus 3.13.1   :9090
Loki       3.7.6    :3100
cAdvisor   0.60.5   :8089
WUD        8        :3002
```

Grafana Zabbix integration:

```text
plugin:     alexanderzobnin-zabbix-app 6.6.0
datasource: Zabbix
uid:        zabbix
endpoint:   http://192.168.2.184:8080/api_jsonrpc.php
auth:       API token
```

Final functional proof:

```text
grafana_to_zabbix=PASS
proxmox_group_visibility=PASS
grafana_alert_authority=PASS
git_live_parity=PASS
```

The `Infrastructure/Proxmox` Zabbix host group is visible through Grafana. Proxmox-host enrollment into Zabbix remains separate backlog work.

## Tracked Grafana authority

Tracked files include:

```text
grafana/provisioning/plugins/zabbix-app.yaml
grafana/provisioning/datasources/zabbix.yaml
grafana/alerting/linux-host-down.json
grafana/run-with-zabbix-secret.sh
deploy-zabbix-grafana.sh
deploy-grafana-alerts.sh
```

The `Linux Host Down` alert remains API-managed inside Grafana because the existing `Infrastructure` rule group contains other API-managed rules. Git is the source of truth for the canonical payload, and `deploy-grafana-alerts.sh` enforces that payload through Grafana's provisioning API while preserving `provenance=api`.

Existing live Prometheus/Loki datasource provisioning remains under the runtime Grafana provisioning tree and must not be overwritten casually.

## Secret flow

```text
secrets/ids-01/grafana-zabbix.sops.env
        |
        | sops --decrypt
        v
/home/james/docker/secrets/zabbix-grafana-api-token
        |
        | Docker Compose secret
        v
/run/secrets/zabbix_grafana_api_token
        |
        | startup wrapper exports process environment
        v
Grafana secureJsonData.apiToken
```

No plaintext token belongs in Git.

## Runtime ownership requirement

Grafana runs as UID `472`.

The Docker secret source file must be readable by that UID. The validated working state is:

```text
owner UID = 472
mode      = 0400
```

If the file is left as `james:0600`, Grafana will restart with:

```text
FAIL: Zabbix Grafana API token secret is not readable
```

Before recreating Grafana, validate:

```bash
stat -c 'owner_uid=%u mode=%a' \
  /home/james/docker/secrets/zabbix-grafana-api-token
```

The current deployment helper materialises the secret but the ownership correction must be preserved in future automation.

## Deployment

Prepare the runtime from the ids-01 repository checkout:

```bash
cd /home/james/projects/docker-env

bash -n hosts/ids-01/stacks/monitoring/deploy-zabbix-grafana.sh
bash hosts/ids-01/stacks/monitoring/deploy-zabbix-grafana.sh
```

The helper validates the host/SOPS authority, materialises the runtime secret, installs tracked provisioning files, backs up the live Compose file and runs `docker compose config`.

Apply/verify Git-controlled Grafana alert authority separately:

```bash
cd /home/james/projects/docker-env

bash -n hosts/ids-01/stacks/monitoring/deploy-grafana-alerts.sh
bash hosts/ids-01/stacks/monitoring/deploy-grafana-alerts.sh
```

Required environment:

```text
GRAFANA_TOKEN=<Grafana API token with alert-rule provisioning rights>
```

The alert helper:

- validates it is running on `ids-01`;
- validates the tracked rule UID, expression, folder and group;
- fetches and backs up the existing API-managed rule;
- checks Git/live functional parity;
- applies the Git payload only when drift is detected;
- preserves Grafana `provenance=api`;
- verifies parity after apply;
- reports the current number of firing targets.

Grafana recreation is deliberately separate:

```bash
cd /home/james/docker/stacks/monitoring

docker compose up -d \
  --no-deps \
  --force-recreate \
  grafana
```

## Acceptance

Required gates:

```text
Grafana /api/health HTTP 200
database=ok
version=13.2.0
plugin registered: alexanderzobnin-zabbix-app
datasource provisioned: Zabbix uid=zabbix
grafana_to_zabbix=PASS
proxmox_group_visibility=PASS
```

A pre-existing disabled dashboard warning about `homelab-backup-recovery-health-grafana13.json` having an empty title is unrelated to the Zabbix integration.

## Scope

Zabbix complements the existing Prometheus/Loki/Alloy observability stack. This integration does not replace those paths and does not require optional dashboard/alert expansion.
