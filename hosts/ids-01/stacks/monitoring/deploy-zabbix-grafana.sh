#!/bin/bash
set -u
set -o pipefail

EXPECTED_HOST="ids-01"
REPO_ROOT="$(cd "$(dirname "$0")/../../../.." && pwd)"
STACK_SRC="$REPO_ROOT/hosts/ids-01/stacks/monitoring"
SOPS_CONFIG="$REPO_ROOT/.sops.yaml"
SOPS_SECRET="$REPO_ROOT/secrets/ids-01/grafana-zabbix.sops.env"

LIVE_STACK="/home/james/docker/stacks/monitoring"
LIVE_PROVISION="/home/james/docker/data/monitoring/grafana/provisioning"
LIVE_SECRET_DIR="/home/james/docker/secrets"
LIVE_SECRET="$LIVE_SECRET_DIR/zabbix-grafana-api-token"

fail() {
    echo "FAIL: $*" >&2
    return 1
}

main() {
    echo "===== IDS-01 GRAFANA ZABBIX DEPLOYMENT ====="

    if [ "$(hostname -s)" != "$EXPECTED_HOST" ]; then
        fail "host gate expected $EXPECTED_HOST"
        return 1
    fi
    echo "host_gate=PASS"

    if [ ! -f "$SOPS_CONFIG" ] || [ ! -f "$SOPS_SECRET" ]; then
        fail "SOPS authority missing"
        return 1
    fi
    echo "sops_authority=PASS"

    mkdir -p "$LIVE_SECRET_DIR"
    umask 077

    TMP_SECRET="$(mktemp "$LIVE_SECRET_DIR/.zabbix-grafana-api-token.XXXXXX")" || {
        fail "unable to create temporary secret file"
        return 1
    }

    if ! sops --config "$SOPS_CONFIG" --decrypt "$SOPS_SECRET" |
       sed -n 's/^ZABBIX_GRAFANA_API_TOKEN=//p' |
       head -1 > "$TMP_SECRET"
    then
        rm -f "$TMP_SECRET"
        fail "SOPS decrypt failed"
        return 1
    fi

    if [ ! -s "$TMP_SECRET" ]; then
        rm -f "$TMP_SECRET"
        fail "materialised token is empty"
        return 1
    fi

    chmod 0600 "$TMP_SECRET"
    mv -f "$TMP_SECRET" "$LIVE_SECRET"

    mkdir -p         "$LIVE_STACK/grafana"         "$LIVE_PROVISION/plugins"         "$LIVE_PROVISION/datasources"

    install -m 0755         "$STACK_SRC/grafana/run-with-zabbix-secret.sh"         "$LIVE_STACK/grafana/run-with-zabbix-secret.sh"

    install -m 0644         "$STACK_SRC/grafana/provisioning/plugins/zabbix-app.yaml"         "$LIVE_PROVISION/plugins/zabbix-app.yaml"

    install -m 0644         "$STACK_SRC/grafana/provisioning/datasources/zabbix.yaml"         "$LIVE_PROVISION/datasources/zabbix.yaml"

    BACKUP="/tmp/ids01-monitoring-compose.before-zabbix.$(date +%Y%m%d-%H%M%S)"
    cp -a "$LIVE_STACK/docker-compose.yml" "$BACKUP"

    cp "$STACK_SRC/docker-compose.yml" "$LIVE_STACK/docker-compose.yml"

    if docker compose -f "$LIVE_STACK/docker-compose.yml" config >/dev/null; then
        echo "compose_validation=PASS"
    else
        cp "$BACKUP" "$LIVE_STACK/docker-compose.yml"
        fail "Compose validation failed; previous live file restored"
        return 1
    fi

    echo "runtime_secret=PRESENT"
    echo "runtime_secret_mode=$(stat -c '%a' "$LIVE_SECRET")"
    echo "provisioning=INSTALLED"
    echo "compose_backup=$BACKUP"
    echo "deployment_prepare=PASS"
}

main "$@"
