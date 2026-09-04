#!/bin/sh
set -eu

SECRET_FILE="/run/secrets/zabbix_grafana_api_token"

if [ ! -r "$SECRET_FILE" ]; then
    echo "FAIL: Zabbix Grafana API token secret is not readable" >&2
    exit 1
fi

ZABBIX_GRAFANA_API_TOKEN="$(cat "$SECRET_FILE")"

if [ -z "$ZABBIX_GRAFANA_API_TOKEN" ]; then
    echo "FAIL: Zabbix Grafana API token secret is empty" >&2
    exit 1
fi

export ZABBIX_GRAFANA_API_TOKEN
exec /run.sh
