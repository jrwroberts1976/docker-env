#!/bin/bash

set -e

echo "Checking required tools..."

TOOLS=(
  git
  docker
)

for TOOL in "${TOOLS[@]}"
do
    if command -v "$TOOL" >/dev/null 2>&1
    then
        echo "✓ $TOOL installed"
    else
        echo "✗ $TOOL missing"
        exit 1
    fi
done

echo
echo "Prerequisites OK"
