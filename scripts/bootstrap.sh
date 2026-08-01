#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo
echo "======================================"
echo "Engineering Platform Bootstrap"
echo "======================================"

echo
echo "Step 1: Checking prerequisites"
"$SCRIPT_DIR/check-prerequisites.sh"

echo
echo "Step 2: Updating repositories"
"$SCRIPT_DIR/clone-repositories.sh"

echo
echo "Step 3: Configuring workflows"
"$SCRIPT_DIR/add-deployment-trigger.sh"

echo
echo "Step 4: Updating submodules"
"$SCRIPT_DIR/update-submodules.sh"

echo
echo "Step 5: Syncing content"
"$SCRIPT_DIR/sync-content.sh"

echo
echo "Step 6: Verifying platform"
"$SCRIPT_DIR/verify-platform.sh"

echo
echo "======================================"
echo "Bootstrap Complete"
echo "======================================"
