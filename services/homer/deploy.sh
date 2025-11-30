#!/usr/bin/env bash
set -euo pipefail

# Always run from the directory containing docker-compose.yml
cd "$(dirname "$0")"

echo "[deploy] Updating Homer containers..."
docker compose pull
docker compose up -d

echo "[deploy] Done."
