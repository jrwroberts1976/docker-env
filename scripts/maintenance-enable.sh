#!/bin/bash
set -e

source ~/docker/secrets/npm.env

echo "Enabling maintenance mode..."

curl -s -X PUT \
"$NPM_URL/api/nginx/proxy-hosts/$NPM_PROXY_ID" \
-H "Authorization: Bearer $NPM_TOKEN" \
-H "Content-Type: application/json" \
-d '{
  "forward_host":"maintenance-page",
  "forward_port":80
}' | jq

echo "Maintenance mode enabled"
