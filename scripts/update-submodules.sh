#!/bin/bash

set -e

BASE_DIR="$HOME/docker"

echo
echo "======================================"
echo "Updating training platform submodules"
echo "======================================"

cd "$BASE_DIR"


if [ ! -f ".gitmodules" ]
then
    echo "No .gitmodules found"
    exit 0
fi


echo
echo "Initialising submodules..."

git submodule init


echo
echo "Updating submodules..."

git submodule update --remote --recursive


echo
echo "Current submodules:"

git submodule status


echo
echo "======================================"
echo "Submodule update complete"
echo "======================================"
