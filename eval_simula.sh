#!/bin/bash
set -euo pipefail

IMAGE_NAME="${1:-"javiergelatti/simula"}"

docker run \
    --interactive \
    --rm \
    "$IMAGE_NAME" sh -c 'cat > program.sim && run_simula'
