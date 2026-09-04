#!/bin/bash
set -euo pipefail

EXPECTED_HOST="ids-01"
GRAFANA_URL="${GRAFANA_URL:-http://localhost:3001}"
REPO_ROOT="$(cd "$(dirname "$0")/../../../.." && pwd)"
RULE_DIR="$REPO_ROOT/hosts/ids-01/stacks/monitoring/grafana/alerting"

fail() {
    echo "FAIL: $*" >&2
    exit 1
}

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
      queryType,
      relativeTimeRange,
      datasourceUid,
      model: {
        datasource: .model.datasource,
        editorMode: .model.editorMode,
        expr: .model.expr,
        format: .model.format,
        instant: .model.instant,
        intervalMs: .model.intervalMs,
        maxDataPoints: .model.maxDataPoints,
        queryType: .model.queryType,
        range: .model.range,
        refId: .model.refId,
        conditions: .model.conditions,
        expression: .model.expression,
        reducer: .model.reducer,
        type: .model.type
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

validate_authority() {
    local file="$1"
    local uid

    uid="$(jq -r '.uid' "$file")"

    case "$uid" in
        bfvmih7jpj0u8e)
            jq -e '
              .title == "Linux Host Down"
              and .folderUID == "homelab-alerts"
              and .ruleGroup == "Infrastructure"
              and .condition == "A"
              and .for == "0s"
              and .labels.severity == "critical"
              and .data[0].model.expr ==
                  "max_over_time(up{job=\"linux-hosts\"}[5m]) == 0"
              and .data[0].model.instant == true
              and .data[0].model.range == false
            ' "$file" >/dev/null
            ;;

        cfvnc96tiqha8f)
            jq -e '
              .title == "Hardware fault detected"
              and .folderUID == "homelab-alerts"
              and .ruleGroup == "Hardware Health"
              and .condition == "C"
              and .for == "1m"
              and .labels.severity == "critical"
              and (.data[0].model.expr | contains("PCIe Bus Error"))
              and (.data[0].model.expr | contains("!~"))
              and (.data[0].model.expr | contains("severity=Correctable"))
              and (.data[0].model.expr | contains("AER: Correctable error received"))
            ' "$file" >/dev/null
            ;;

        cfvnpciaerwarn01)
            jq -e '
              .title == "Correctable PCIe error detected"
              and .folderUID == "homelab-alerts"
              and .ruleGroup == "Hardware Health"
              and .condition == "C"
              and .for == "0s"
              and .labels.severity == "warning"
              and (.data[0].model.expr | contains("severity=Correctable"))
              and (.data[0].model.expr | contains("AER: Correctable error received"))
            ' "$file" >/dev/null
            ;;

        *)
            fail "unapproved tracked Grafana alert UID: $uid"
            ;;
    esac
}

echo "===== IDS-01 GRAFANA ALERT AUTHORITY ====="

[ "$(hostname -s)" = "$EXPECTED_HOST" ] ||
    fail "host gate expected $EXPECTED_HOST"
echo "host_gate=PASS"

: "${GRAFANA_TOKEN:?GRAFANA_TOKEN is not set}"

[ -d "$RULE_DIR" ] || fail "rule authority directory missing: $RULE_DIR"

mapfile -t RULE_FILES < <(find "$RULE_DIR" -maxdepth 1 -type f -name '*.json' | sort)

[ "${#RULE_FILES[@]}" -gt 0 ] || fail "no tracked Grafana alert rules found"

echo "tracked_rules=${#RULE_FILES[@]}"

for rule_file in "${RULE_FILES[@]}"; do
    jq empty "$rule_file" || fail "invalid JSON: $rule_file"
    validate_authority "$rule_file" ||
        fail "Git authority validation failed: $rule_file"
done

echo "authority_validation=PASS"

curl -fsS "$GRAFANA_URL/api/health" >/dev/null ||
    fail "Grafana health check failed"
echo "grafana_health=PASS"

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

STAMP="$(date +%Y%m%d-%H%M%S)"
DRIFT_COUNT=0
APPLY_COUNT=0
CREATE_COUNT=0

for rule_file in "${RULE_FILES[@]}"; do
    RULE_UID="$(jq -r '.uid' "$rule_file")"
    RULE_TITLE="$(jq -r '.title' "$rule_file")"
    EXPECTED_FOLDER="$(jq -r '.folderUID' "$rule_file")"
    EXPECTED_GROUP="$(jq -r '.ruleGroup' "$rule_file")"

    SAFE_UID="$(tr -cd '[:alnum:]_-' <<<"$RULE_UID")"
    CURRENT="$WORKDIR/${SAFE_UID}.current.json"
    RESULT="$WORKDIR/${SAFE_UID}.result.json"
    AFTER="$WORKDIR/${SAFE_UID}.after.json"

    echo
    echo "===== RULE: $RULE_TITLE ($RULE_UID) ====="

    HTTP="$(
        curl -sS             -o "$CURRENT"             -w '%{http_code}'             -H "Authorization: Bearer $GRAFANA_TOKEN"             -H 'Accept: application/json'             "$GRAFANA_URL/api/v1/provisioning/alert-rules/$RULE_UID"
    )"

    if [ "$HTTP" = "404" ]; then
        echo "live_rule=PRESENT_NO"
        echo "apply_required=CREATE"

        HTTP="$(
            curl -sS                 -o "$RESULT"                 -w '%{http_code}'                 -X POST                 -H "Authorization: Bearer $GRAFANA_TOKEN"                 -H 'Content-Type: application/json'                 -H 'Accept: application/json'                 --data-binary "@$rule_file"                 "$GRAFANA_URL/api/v1/provisioning/alert-rules"
        )"

        if [ "$HTTP" != "200" ] && [ "$HTTP" != "201" ]; then
            cat "$RESULT" >&2
            fail "Grafana rule create failed for $RULE_UID, HTTP $HTTP"
        fi

        CREATE_COUNT=$((CREATE_COUNT + 1))
        APPLY_COUNT=$((APPLY_COUNT + 1))
        echo "api_create=PASS"

    elif [ "$HTTP" = "200" ]; then
        jq -e             --arg uid "$RULE_UID"             --arg title "$RULE_TITLE"             --arg folder "$EXPECTED_FOLDER"             --arg group "$EXPECTED_GROUP" '
              .uid == $uid
              and .title == $title
              and .folderUID == $folder
              and .ruleGroup == $group
              and .provenance == "api"
            ' "$CURRENT" >/dev/null ||
            fail "existing Grafana rule identity/provenance gate failed for $RULE_UID"

        BACKUP="/tmp/grafana-alert-${SAFE_UID}.before.${STAMP}.json"
        cp "$CURRENT" "$BACKUP"
        echo "live_backup=$BACKUP"

        if diff -u             <(jq -S "$canonical_filter" "$CURRENT")             <(jq -S "$canonical_filter" "$rule_file")             >/dev/null
        then
            echo "grafana_rule_drift=ZERO"
            echo "apply_required=NO"
        else
            echo "grafana_rule_drift=DETECTED"
            echo "apply_required=UPDATE"
            DRIFT_COUNT=$((DRIFT_COUNT + 1))

            HTTP="$(
                curl -sS                     -o "$RESULT"                     -w '%{http_code}'                     -X PUT                     -H "Authorization: Bearer $GRAFANA_TOKEN"                     -H 'Content-Type: application/json'                     -H 'Accept: application/json'                     --data-binary "@$rule_file"                     "$GRAFANA_URL/api/v1/provisioning/alert-rules/$RULE_UID"
            )"

            [ "$HTTP" = "200" ] || {
                cat "$RESULT" >&2
                fail "Grafana rule update failed for $RULE_UID, HTTP $HTTP"
            }

            APPLY_COUNT=$((APPLY_COUNT + 1))
            echo "api_update=PASS"
        fi
    else
        cat "$CURRENT" >&2
        fail "unable to fetch existing rule $RULE_UID, HTTP $HTTP"
    fi

    curl -fsS         -H "Authorization: Bearer $GRAFANA_TOKEN"         -H 'Accept: application/json'         "$GRAFANA_URL/api/v1/provisioning/alert-rules/$RULE_UID"         > "$AFTER"

    diff -u         <(jq -S "$canonical_filter" "$AFTER")         <(jq -S "$canonical_filter" "$rule_file")         >/dev/null ||
        fail "post-apply Git/live comparison failed for $RULE_UID"

    jq -e '.provenance == "api"' "$AFTER" >/dev/null ||
        fail "rule provenance changed unexpectedly for $RULE_UID"

    echo "rule_git_live_parity=PASS"
    echo "provenance=api"
done

echo
echo "===== SUMMARY ====="
echo "tracked_rules=${#RULE_FILES[@]}"
echo "drifted_rules=$DRIFT_COUNT"
echo "applied_rules=$APPLY_COUNT"
echo "created_rules=$CREATE_COUNT"
echo "git_live_parity=PASS"
echo "grafana_alert_authority=PASS"
