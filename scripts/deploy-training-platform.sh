#!/bin/bash

set -e

echo "======================================"
echo "Deploying Training Platform"
echo "======================================"

cd ~/docker

echo "Updating docker-env repository"
git pull

echo "Updating submodules"
git submodule update --init --recursive
git submodule update --remote --merge

echo "Deploying training platform"

cd ~/docker/stacks/training-platform

docker compose up -d --build

echo
echo "Checking container status"

docker compose ps

echo
echo "======================================"
echo "Deployment complete"
echo "======================================"
