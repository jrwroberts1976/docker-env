#!/bin/bash

set -Eeuo pipefail

DOCKER_ROOT="$HOME/docker"
PLATFORM_DIR="$DOCKER_ROOT/stacks/training-platform"
MANAGER_DIR="$PLATFORM_DIR/training-platform-manager"
IMAGE_NAME="training-platform:test"

cleanup() {
    echo "Disabling maintenance mode"

    if [ -x "$DOCKER_ROOT/scripts/maintenance-disable.sh" ]; then
        "$DOCKER_ROOT/scripts/maintenance-disable.sh" || true
    fi
}

trap cleanup EXIT

echo "Starting training platform deployment"

cd "$DOCKER_ROOT"

echo "Pulling latest docker-env changes"
git pull --ff-only origin main

echo "Updating training platform manager"

if [ ! -d "$MANAGER_DIR/.git" ]; then
    echo "Training platform manager is missing"
    exit 1
fi

git -C "$MANAGER_DIR" fetch --prune origin
git -C "$MANAGER_DIR" checkout main
git -C "$MANAGER_DIR" reset --hard origin/main

echo "Synchronising, validating and indexing training courses"

cd "$MANAGER_DIR"

python3 training_manager.py build

echo "Enabling maintenance mode"

if [ -x "$DOCKER_ROOT/scripts/maintenance-enable.sh" ]; then
    "$DOCKER_ROOT/scripts/maintenance-enable.sh"
fi

cd "$PLATFORM_DIR"

echo "Building validation image"
docker build -t "$IMAGE_NAME" .

echo "Validating MkDocs documentation"
docker run --rm "$IMAGE_NAME" mkdocs build --strict

echo "Deploying training platform"
docker compose up -d --build --remove-orphans

echo "Checking container status"
docker compose ps

echo "Deployment completed successfully"
