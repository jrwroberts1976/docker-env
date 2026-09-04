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

## Planned monitoring secrets

```text
grafana-zabbix.sops.env
  ZABBIX_GRAFANA_API_TOKEN

proxmox-monitoring.sops.env
  PROXMOX_ZABBIX_TOKEN_ID
  PROXMOX_ZABBIX_TOKEN_SECRET
```

Only encrypted SOPS files belong in Git.

Runtime consumers should receive protected materialised files or Docker Compose secrets. Do not expose decrypted values in shell output, logs, command-line arguments, Git history or documentation.

## Initial use

The first use of this authority is the Grafana ↔ Zabbix integration for Proxmox infrastructure monitoring.

The intended flow is:

```text
Zabbix API-token lifecycle via IaC
  -> encrypted SOPS recovery/authority source
  -> protected runtime secret on ids-01
  -> Grafana Compose secret
  -> provisioned Zabbix datasource
```

Secret creation/rotation must be idempotent and must not regenerate a working token on every run.
