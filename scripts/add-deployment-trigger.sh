#!/bin/bash

set -u

GITHUB_USER="jrwroberts1976"

REPOS=(
  "basic-linux-training"
  "azure-training"
  "cloud-platform"
  "kubernetes-homelab"
  "engineering-learning-portfolio"
  "james-roberts-cv"
)

WORKFLOW_DIR=".github/workflows"
WORKFLOW_FILE="$WORKFLOW_DIR/update-training-platform.yml"

cat > /tmp/update-training-platform.yml <<'EOF'
name: Update Training Platform

on:
  push:
    branches:
      - main

jobs:
  notify-platform:
    runs-on: ubuntu-latest

    steps:
      - name: Trigger docker-env deployment
        env:
          TOKEN: ${{ secrets.REPO_DISPATCH_TOKEN }}
        run: |
          curl -X POST \
            -H "Accept: application/vnd.github+json" \
            -H "Authorization: Bearer ${TOKEN}" \
            https://api.github.com/repos/jrwroberts1976/docker-env/dispatches \
            -d '{"event_type":"content-updated"}'
EOF

echo
echo "======================================"
echo "Updating GitHub repositories..."
echo "======================================"

for REPO in "${REPOS[@]}"
do
    echo
    echo "--------------------------------------"
    echo "Repository: $REPO"
    echo "--------------------------------------"

    if [ ! -d "$REPO" ]; then
        echo "Cloning..."
        git clone "https://github.com/$GITHUB_USER/$REPO.git"
    fi

    cd "$REPO" || {
        echo "Unable to enter $REPO"
        continue
    }

    echo "Pulling latest changes..."
    git pull

    mkdir -p "$WORKFLOW_DIR"

    cp /tmp/update-training-platform.yml "$WORKFLOW_FILE"

    git add "$WORKFLOW_FILE"

    if git diff --cached --quiet; then
        echo "Workflow already up to date."
    else
        git commit -m "Add training platform deployment trigger"

        if git push; then
            echo "✓ Successfully updated $REPO"
        else
            echo "✗ Push failed for $REPO"
        fi
    fi

    cd ..

done

rm -f /tmp/update-training-platform.yml

echo
echo "======================================"
echo "Finished processing all repositories."
echo "======================================"
