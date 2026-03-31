#!/usr/bin/env bash
# Script 2: Start / manage the PolicyDraft app via supervisord
# Run this after install.sh (or on a shared image where install.sh already ran)
set -e

echo "==> Reloading supervisord config..."
supervisorctl reread
supervisorctl update

echo "==> Starting PolicyDraft backend..."
supervisorctl start policydraft_backend 2>/dev/null || supervisorctl restart policydraft_backend

echo "==> Backend running on port 3001"
echo ""
echo "--- Management commands ---"
echo "  supervisorctl status policydraft_backend    # check status"
echo "  supervisorctl start policydraft_backend     # start"
echo "  supervisorctl stop policydraft_backend      # stop"
echo "  supervisorctl restart policydraft_backend   # restart"
echo "  tail -f /var/log/supervisor/policydraft.log # view logs"
