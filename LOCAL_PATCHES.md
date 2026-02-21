# Local Patches

## 2026-02-21 — Control UI accent set to vibrant purple

### Why
OpenClaw Control UI chat accent remained red even after setting `ui.seamColor` in `~/.openclaw/openclaw.json`.

### What was patched
- File:
  - `/opt/homebrew/lib/node_modules/openclaw/dist/control-ui/assets/index-DNdFNvs2.css`
- Backup created:
  - `/opt/homebrew/lib/node_modules/openclaw/dist/control-ui/assets/index-DNdFNvs2.css.bak-purple`

### Change summary
Replaced core red accent tokens with purple equivalents (examples):
- `#ff5c5c` -> `#a020f0`
- `#ff7070` -> `#b34dff`
- `#dc2626` -> `#9333ea`
- `#ef4444` -> `#a855f7`
- Matching rgba accent/focus values updated to purple hues.

### Apply/recover
- Restart gateway after patch:
  - `openclaw gateway restart`
- Restore original CSS if needed:
  - `cp /opt/homebrew/lib/node_modules/openclaw/dist/control-ui/assets/index-DNdFNvs2.css.bak-purple /opt/homebrew/lib/node_modules/openclaw/dist/control-ui/assets/index-DNdFNvs2.css`
  - `openclaw gateway restart`

### Note
This is a local patch and may be overwritten by OpenClaw updates/reinstalls.
