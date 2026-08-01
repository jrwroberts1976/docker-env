#!/bin/bash

set -e

GITHUB_USER="jrwroberts1976"

BASE_DIR="$HOME/docker"

REPOS=(
  "basic-linux-training"
  "azure-training"
  "cloud-platform"
  "kubernetes-homelab"
  "engineering-learning-portfolio"
  "james-roberts-cv"
)

echo
echo "======================================"
echo "Updating source repositories"
echo "======================================"

cd "$BASE_DIR"

for REPO in "${REPOS[@]}"
do
    echo
    echo "--------------------------------------"
    echo "Repository: $REPO"
    echo "--------------------------------------"

    if [ -d "$BASE_DIR/$REPO/.git" ]
    then
        echo "Repository exists - pulling latest changes"

        cd "$BASE_DIR/$REPO"

        git pull --ff-only

        cd "$BASE_DIR"

    else

        echo "Cloning repository"

        git clone \
        "https://github.com/${GITHUB_USER}/${REPO}.git"

    fi

done


echo
echo "======================================"
echo "Source repositories complete"
echo "======================================"
