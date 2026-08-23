#!/usr/bin/env bash
set -Eeuo pipefail

NPM_PROXY_ID="${NPM_PROXY_ID:-27}"
NPM_ENV="/home/james/docker/secrets/npm.env"

if [ ! -r "$NPM_ENV" ]; then
    echo "ERROR: Cannot read $NPM_ENV"
    exit 1
fi

set -a
source "$NPM_ENV"
set +a

EXPECTED_DOMAIN="me.jrwroberts.co.uk"
TARGET_HOST="maintenance-page"
TARGET_PORT=80

CHANGE_STATE_DIR="/home/james/docker/stacks/maintenance-page/html"
CHANGE_STATE_FILE="${CHANGE_STATE_DIR}/change.json"

log() {
    printf '\n\033[1;34m==>\033[0m %s\n' "$1"
}

success() {
    printf '\033[1;32m✓\033[0m %s\n' "$1"
}

fail() {
    printf '\033[1;31m✗\033[0m %s\n' "$1" >&2
    exit 1
}

npm_api() {
    docker run --rm \
        --network container:npm \
        -e NPM_TOKEN="$NPM_TOKEN" \
        curlimages/curl:latest \
        curl --fail --silent --show-error \
        "$@"
}

log "Reading Nginx Proxy Manager proxy host ${NPM_PROXY_ID}"

proxy_json="$(npm_api \
    "http://127.0.0.1:81/api/nginx/proxy-hosts/${NPM_PROXY_ID}" \
    -H "Authorization: Bearer ${NPM_TOKEN}")"

domain="$(printf '%s' "$proxy_json" | jq -r '.domain_names[0] // empty')"
current_host="$(printf '%s' "$proxy_json" | jq -r '.forward_host // empty')"

[[ "$domain" == "$EXPECTED_DOMAIN" ]] ||
    fail "Proxy ${NPM_PROXY_ID} is '${domain}', expected '${EXPECTED_DOMAIN}'"

success "Correct proxy host confirmed: ${domain}"

if [[ "$current_host" == "$TARGET_HOST" ]]; then
    success "Maintenance mode is already enabled"

    if [[ -f "$CHANGE_STATE_FILE" ]]; then
        echo
        echo "Existing change control record:"
        jq . "$CHANGE_STATE_FILE" 2>/dev/null || cat "$CHANGE_STATE_FILE"
    fi

    exit 0
fi

log "Creating change control record"

mkdir -p "$CHANGE_STATE_DIR"

CHANGE_REF="CHG-$(date +%Y%m%d)-$(printf '%04d' $((RANDOM % 10000)))"
CHANGE_STARTED="$(date '+%d %B %Y, %H:%M %Z')"

cat > "$CHANGE_STATE_FILE" <<EOF
{
  "reference": "${CHANGE_REF}",
  "status": "IMPLEMENTING",
  "type": "Planned Maintenance",
  "service": "Engineering Portfolio",
  "started": "${CHANGE_STARTED}"
}
EOF

chmod 0644 "$CHANGE_STATE_FILE"

success "Change reference created: ${CHANGE_REF}"

log "Switching ${domain} to maintenance-page"

payload="$(printf '%s' "$proxy_json" | jq '{
    domain_names,
    forward_scheme,
    forward_host,
    forward_port,
    access_list_id,
    certificate_id,
    ssl_forced,
    caching_enabled,
    block_exploits,
    advanced_config,
    meta,
    allow_websocket_upgrade,
    http2_support,
    hsts_enabled,
    hsts_subdomains,
    locations
} | .forward_host = "maintenance-page" | .forward_port = 80')"

response="$(
    printf '%s' "$payload" |
    docker run --rm \
        --network container:npm \
        -i \
        -e NPM_TOKEN="$NPM_TOKEN" \
        curlimages/curl:latest \
        curl --fail --silent --show-error \
        -X PUT \
        "http://127.0.0.1:81/api/nginx/proxy-hosts/${NPM_PROXY_ID}" \
        -H "Authorization: Bearer ${NPM_TOKEN}" \
        -H "Content-Type: application/json" \
        --data-binary @-
)"

verify_host="$(printf '%s' "$response" | jq -r '.forward_host // empty')"

[[ "$verify_host" == "$TARGET_HOST" ]] ||
    fail "NPM returned unexpected target: '${verify_host}'"

success "Maintenance mode enabled"

echo
echo "=============================================="
echo "CHANGE CONTROL"
echo "=============================================="
echo "Reference : ${CHANGE_REF}"
echo "Status    : IMPLEMENTING"
echo "Type      : Planned Maintenance"
echo "Service   : Engineering Portfolio"
echo "Started   : ${CHANGE_STARTED}"
echo
echo "${domain} → ${TARGET_HOST}:${TARGET_PORT}"
