#!/bin/bash

set -e

echo "Updating training platform"

cd ~/docker/stacks/training-platform

echo "Updating repositories"

git submodule update --init --recursive

echo "Pulling latest changes"

git pull

echo "Rebuilding container"

docker compose down

docker compose up -d --build

echo "Deployment complete"
