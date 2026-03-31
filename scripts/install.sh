#!/usr/bin/env bash
# Script 1: Install all dependencies for PolicyDraft
# Run once after cloning the repo into /workspace
set -e

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
mkdir -p /workspace/generated_documents

echo "==> Installing supervisord config..."
cp /workspace/scripts/policydraft.conf /etc/supervisor/conf.d/policydraft.conf

echo "==> Done. Image is ready to share."
