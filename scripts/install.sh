#!/usr/bin/env bash
# Script 1: Install all dependencies for PolicyDraft
# Run once after cloning the repo
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
APP_DIR="$(dirname "$SCRIPT_DIR")"

echo "==> Installing Python dependencies..."
pip install --quiet \
  fastapi \
  uvicorn \
  sse-starlette \
  pydantic \
  pydantic-settings \
  weasyprint \
  httpx \
  httpx-sse

echo "==> Creating storage directory..."
mkdir -p "$APP_DIR/generated_documents"

echo "==> Installing supervisord config..."
sed "s|{{APP_DIR}}|$APP_DIR|g" "$SCRIPT_DIR/policydraft.conf" > /etc/supervisor/conf.d/policydraft.conf

echo "==> Done. App directory: $APP_DIR"
echo "==> Image is ready to share."
