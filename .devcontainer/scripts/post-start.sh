#!/usr/bin/env bash
set -euo pipefail

# Start PostgreSQL on container start (like your Gitpod task)
pg_start >/dev/null 2>&1 || true

echo "post-start completed"