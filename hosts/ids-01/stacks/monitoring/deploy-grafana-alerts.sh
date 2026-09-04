#!/bin/bash
set -euo pipefail

EXPECTED_HOST="ids-01"
GRAFANA_URL="${GRAFANA_URL:-http://localhost:3001}"
RULE_UID="bfvmih7jpj0u8e"
REPO_ROOT="$(cd "$(dirname "$0")/../../../.." && pwd)"
RULE_FILE="$REPO_ROOT/hosts/ids-01/stacks/monitoring/grafana/alerting/linux-host-down.json"

fail() {
    echo "FAIL: $*" >&2
    exit 1
}

echo "===== IDS-01 GRAFANA ALERT AUTHORITY ====="

[ "$(hostname -s)" = "$EXPECTED_HOST" ] || fail "host gate expected $EXPECTED_HOST"
echo "host_gate=PASS"

: "${GRAFANA_TOKEN:?GRAFANA_TOKEN is not set}"

[ -r "$RULE_FILE" ] || fail "rule authority missing: $RULE_FILE"

jq -e '
  .uid == "bfvmih7jpj0u8e"
  and .title == "Linux Host Down"
  and .folderUID == "homelab-alerts"
  and .ruleGroup == "Infrastructure"
  and .condition == "A"
  and .for == "0s"
  and .data[0].model.expr ==
      "max_over_time(up{job=\"linux-hosts\"}[5m]) == 0"
  and .data[0].model.instant == true
  and .data[0].model.range == false
' "$RULE_FILE" >/dev/null || fail "Git rule authority failed validation"

echo "authority_validation=PASS"

curl -fsS "$GRAFANA_URL/api/health" >/dev/null || fail "Grafana health check failed"
echo "grafana_health=PASS"

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

CURRENT="$WORKDIR/current.json"
AFTER="$WORKDIR/after.json"
RESULT="$WORKDIR/result.json"
BACKUP="/tmp/grafana-linux-host-down.before.$(date +%Y%m%d-%H%M%S).json"

HTTP="$(
    curl -sS         -o "$CURRENT"         -w '%{http_code}'         -H "Authorization: Bearer $GRAFANA_TOKEN"         -H 'Accept: application/json'         "$GRAFANA_URL/api/v1/provisioning/alert-rules/$RULE_UID"
)"

[ "$HTTP" = "200" ] || {
    cat "$CURRENT" >&2
    fail "unable to fetch existing rule, HTTP $HTTP"
}

jq -e '
  .uid == "bfvmih7jpj0u8e"
  and .title == "Linux Host Down"
  and .folderUID == "homelab-alerts"
  and .ruleGroup == "Infrastructure"
  and .provenance == "api"
' "$CURRENT" >/dev/null || fail "existing Grafana rule identity/provenance gate failed"

cp "$CURRENT" "$BACKUP"
echo "live_backup=$BACKUP"

canonical_filter='{
  uid,
  orgID,
  folderUID,
  ruleGroup,
  title,
  condition,
  data: [
    .data[] | {
      refId,
      relativeTimeRange,
      datasourceUid,
      model: {
        editorMode: .model.editorMode,
        expr: .model.expr,
        format: .model.format,
        instant: .model.instant,
        intervalMs: .model.intervalMs,
        maxDataPoints: .model.maxDataPoints,
        range: .model.range,
        refId: .model.refId
      }
    }
  ],
  noDataState,
  execErrState,
  for,
  annotations,
  labels,
  isPaused
}'

if diff -u     <(jq -S "$canonical_filter" "$CURRENT")     <(jq -S "$canonical_filter" "$RULE_FILE")     >/dev/null
then
    echo "grafana_rule_drift=ZERO"
    echo "apply_required=NO"
else
    echo "grafana_rule_drift=DETECTED"
    echo "apply_required=YES"

    HTTP="$(
        curl -sS             -o "$RESULT"             -w '%{http_code}'             -X PUT             -H "Authorization: Bearer $GRAFANA_TOKEN"             -H 'Content-Type: application/json'             -H 'Accept: application/json'             --data-binary "@$RULE_FILE"             "$GRAFANA_URL/api/v1/provisioning/alert-rules/$RULE_UID"
    )"

    [ "$HTTP" = "200" ] || {
        cat "$RESULT" >&2
        fail "Grafana rule update failed, HTTP $HTTP"
    }

    echo "api_apply=PASS"
fi

curl -fsS     -H "Authorization: Bearer $GRAFANA_TOKEN"     -H 'Accept: application/json'     "$GRAFANA_URL/api/v1/provisioning/alert-rules/$RULE_UID"     > "$AFTER"

diff -u     <(jq -S "$canonical_filter" "$AFTER")     <(jq -S "$canonical_filter" "$RULE_FILE")     >/dev/null || fail "post-apply Git/live comparison failed"

jq -e '.provenance == "api"' "$AFTER" >/dev/null ||
    fail "rule provenance changed unexpectedly"

echo "git_live_parity=PASS"
echo "provenance=api"

PROM_RESULT="$(
    curl -fsSG         'http://localhost:9090/api/v1/query'         --data-urlencode         'query=max_over_time(up{job="linux-hosts"}[5m]) == 0'
)"

FIRING_COUNT="$(jq '.data.result | length' <<<"$PROM_RESULT")"
echo "current_firing_targets=$FIRING_COUNT"

echo "grafana_alert_authority=PASS"
