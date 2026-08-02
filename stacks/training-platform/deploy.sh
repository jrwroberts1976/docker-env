#!/bin/bash

set -e

echo "Updating training platform"

cd ~/docker/stacks/training-platform

echo "Pulling latest platform changes"

git pull

echo "Updating training repositories"

git submodule update --init --recursive

echo "Pulling latest submodule changes"

git submodule foreach git pull origin main

echo "Updating submodule references"

git add training-content

git commit -m "Update training content" || true

echo "Rebuilding container"

docker compose down

docker compose up -d --build

echo "Deployment complete"
