#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/.openclaw/settings-backup"
CHECKLIST="$REPO/POST_UPDATE_CHECKLIST.md"

echo "== Alice post-update quick check =="
echo

echo "[1/5] OpenClaw status"
openclaw status || true
echo

echo "[2/5] SSH alias sanity"
ssh -T git@github.com-alice || true
echo

echo "[3/5] LaunchAgent status"
launchctl print "gui/$(id -u)/com.alice.settings-backup" | head -n 20 || true
echo

echo "[4/5] Manual backup run"
"$REPO/backup-settings.sh" || true
echo

echo "[5/5] Checklist reference"
echo "$CHECKLIST"

if command -v open >/dev/null 2>&1; then
  open "$CHECKLIST" || true
fi

echo
echo "Done. If UI accent reverted, follow step 2 in POST_UPDATE_CHECKLIST.md."
