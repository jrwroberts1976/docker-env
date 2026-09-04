# ids-01 encrypted secret sources

This directory contains SOPS-encrypted secret authority for services hosted on `ids-01`.

## Recipient model

Files matching:

```text
secrets/ids-01/*.sops.env
```

are encrypted to three age recipients:

1. the existing TestServer operational recipient;
2. the existing protected recovery recipient;
3. the `ids-01` operational recipient.

This allows controlled deployment from the automation/control side while also allowing `ids-01` to decrypt its own encrypted monitoring secrets.

The `ids-01` private age identity is host-local and must never be committed. The public recipient is declared in `.sops.yaml`.

## Monitoring secret register

```text
grafana-zabbix.sops.env
  ZABBIX_GRAFANA_API_TOKEN

proxmox-monitoring.sops.env
  PROXMOX_ZABBIX_TOKEN_ID
  PROXMOX_ZABBIX_TOKEN_SECRET
```

Only encrypted SOPS files belong in Git.

Runtime consumers should receive protected materialised files or Docker Compose secrets. Do not expose decrypted values in shell output, logs, command-line arguments, Git history or documentation.

## Current validated use

The first use of this authority is now complete: the Grafana ↔ Zabbix integration on `ids-01` is working with a dedicated read-only Zabbix API identity.

The intended flow is:

```text
Zabbix API-token lifecycle via IaC
  -> encrypted SOPS recovery/authority source
  -> protected runtime secret on ids-01
  -> Grafana Compose secret
  -> provisioned Zabbix datasource
```

Secret creation/rotation must be idempotent and must not regenerate a working token on every run.

Validated evidence:

```text
token_api=PASS
proxmox_group_visibility=PASS
plaintext_staging=PASS_ABSENT
token_generated=NO
grafana_to_zabbix=PASS
```

The runtime file used by the Grafana container is `/home/james/docker/secrets/zabbix-grafana-api-token`. Grafana runs as UID `472`; the validated working source-file state is UID `472`, mode `0400`. Do not place the decrypted value in this README, shell logs or Git.
