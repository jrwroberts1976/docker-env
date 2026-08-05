#!/bin/bash
set -e

source ~/docker/secrets/npm.env

echo "Disabling maintenance mode..."

curl -s -X PUT \
"$NPM_URL/api/nginx/proxy-hosts/$NPM_PROXY_ID" \
-H "Authorization: Bearer $NPM_TOKEN" \
-H "Content-Type: application/json" \
-d '{
  "forward_host":"training-platform",
  "forward_port":8000
}' | jq

echo "Maintenance mode disabled"
