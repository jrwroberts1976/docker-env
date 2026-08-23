#!/usr/bin/env bash
set -euo pipefail

MODE="${1:---validate-only}"
REPOSITORY_ROOT="$(git rev-parse --show-toplevel)"
STACK_DIR="${REPOSITORY_ROOT}/stacks/birdnet-go"
COMPOSE_FILE="${STACK_DIR}/docker-compose.yaml"
SOURCE_URL="https://github.com/jrwroberts1976/docker-env"

case "$MODE" in
    --validate-only|--build)
        ;;
    *)
        echo "Usage: $0 [--validate-only|--build]" >&2
        exit 1
        ;;
esac

if [[ -n "$(git -C "$REPOSITORY_ROOT" status --porcelain -- stacks/birdnet-go)" ]]; then
    echo "ERROR: BirdNET source or Compose state is not clean." >&2
    git -C "$REPOSITORY_ROOT" status --short -- stacks/birdnet-go >&2
    exit 1
fi

BUILD_REVISION="$(git -C "$REPOSITORY_ROOT" rev-parse HEAD)"
BUILD_CREATED="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

export BUILD_REVISION
export BUILD_CREATED
export BUILD_SOURCE="$SOURCE_URL"

docker compose \
    --file "$COMPOSE_FILE" \
    --project-directory "$STACK_DIR" \
    config --quiet

printf 'Build revision: %s\n' "$BUILD_REVISION"
printf 'Build created:  %s\n' "$BUILD_CREATED"
printf 'Build source:   %s\n' "$BUILD_SOURCE"

if [[ "$MODE" == "--validate-only" ]]; then
    echo "Validation only: no image was built and no container was changed."
    exit 0
fi

docker compose \
    --file "$COMPOSE_FILE" \
    --project-directory "$STACK_DIR" \
    build birdnet-exporter

IMAGE_ID="$(
    docker compose \
        --file "$COMPOSE_FILE" \
        --project-directory "$STACK_DIR" \
        images --quiet birdnet-exporter
)"

if [[ -z "$IMAGE_ID" ]]; then
    echo "ERROR: built BirdNET exporter image ID was not resolved." >&2
    exit 1
fi

docker image inspect "$IMAGE_ID" |
jq -r '.[0] | {
  image_id: .Id,
  created: .Created,
  source: .Config.Labels["org.opencontainers.image.source"],
  revision: .Config.Labels["org.opencontainers.image.revision"],
  build_created: .Config.Labels["org.opencontainers.image.created"]
}'

echo "Image build completed. No container was recreated or restarted."
