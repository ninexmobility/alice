#!/usr/bin/env bash
set -euo pipefail

SRC="${HOME}/.openclaw/workspace"
DST="${HOME}/.openclaw/settings-backup"

FILES=(
  "AGENTS.md"
  "SOUL.md"
  "USER.md"
  "IDENTITY.md"
  "TOOLS.md"
  "HEARTBEAT.md"
  "MEMORY.md"
)

mkdir -p "${DST}/memory"

for f in "${FILES[@]}"; do
  if [[ -f "${SRC}/${f}" ]]; then
    cp "${SRC}/${f}" "${DST}/${f}"
  fi
done

if [[ -d "${SRC}/memory" ]]; then
  # Keep only daily memory files (YYYY-MM-DD.md), skip timestamp/session dump files.
  rsync -a --delete \
    --include '*/' \
    --include '????-??-??.md' \
    --exclude '*' \
    "${SRC}/memory/" "${DST}/memory/"
fi

cd "${DST}"

if [[ -n "$(git status --porcelain)" ]]; then
  git add .
  git commit -m "Backup settings: $(date '+%Y-%m-%d %H:%M:%S %Z')"
  git push
  echo "Backup complete: committed + pushed."
else
  echo "No changes to backup."
fi
