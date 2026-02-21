# Post-Update Checklist (Alice)

Use this after any `openclaw` update/reinstall.

## 1) Verify versions/services
- `openclaw status`
- Confirm Gateway service is running and dashboard loads.

## 2) Verify UI accent color
- Open Control UI and check chat accent/buttons.
- If red returned, reapply local patch:
  - `python3 - <<'PY'
from pathlib import Path
css = Path('/opt/homebrew/lib/node_modules/openclaw/dist/control-ui/assets/index-DNdFNvs2.css')
text = css.read_text()
repls = {
    '#ff5c5c':'#a020f0',
    '#ff7070':'#b34dff',
    'rgba(255, 92, 92, .15)':'rgba(160, 32, 240, .15)',
    'rgba(255, 92, 92, .25)':'rgba(160, 32, 240, .25)',
    '#dc2626':'#9333ea',
    '#ef4444':'#a855f7',
    'rgba(220, 38, 38, .12)':'rgba(147, 51, 234, .12)',
    'rgba(220, 38, 38, .15)':'rgba(147, 51, 234, .15)',
    'rgba(220, 38, 38, .2)':'rgba(147, 51, 234, .2)'
}
for a,b in repls.items():
    text = text.replace(a,b)
css.write_text(text)
print('Patched purple accent tokens')
PY`
  - `openclaw gateway restart`

## 3) Verify backup pipeline
- Manual run: `alice-backup`
- Confirm push succeeds to `git@github.com-alice:ninexmobility/alice.git`.

## 4) Verify weekly automation
- `launchctl print gui/$(id -u)/com.alice.settings-backup | head`
- Ensure LaunchAgent exists and is enabled.

## 5) Quick SSH sanity
- `ssh -T git@github.com-alice`
- Should authenticate for the account with repo access.

---
Reference docs:
- `LOCAL_PATCHES.md`
- `backup-settings.sh`
