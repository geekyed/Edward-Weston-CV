#!/usr/bin/env bash
# Builds index.html and Edward-Weston-CV.pdf from index.md.
# Requires: node (npx) and Google Chrome/Chromium. Override with CHROME=/path.
set -euo pipefail
cd "$(dirname "$0")/.."

LIMIT=5120

CHROME="${CHROME:-}"
if [ -z "$CHROME" ]; then
  for c in "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" google-chrome google-chrome-stable chromium chromium-browser; do
    if command -v "$c" >/dev/null 2>&1; then CHROME="$c"; break; fi
  done
fi
[ -n "$CHROME" ] || { echo "Chrome not found; set CHROME=" >&2; exit 1; }

npx --yes marked@15.0.12 --gfm -i index.md > build/content.html

node -e '
const fs = require("fs");
const t = fs.readFileSync("build/template.html", "utf8");
const c = fs.readFileSync("build/content.html", "utf8").replace(/<\/li>\n<\/ul>/g, "</li></ul>");
const out = t.replace("{{content}}", () => c)
  .split("\n").map(l => l.trim()).filter(Boolean).join("\n");
fs.writeFileSync("index.html", out);
'
rm build/content.html

"$CHROME" --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="$PWD/Edward-Weston-CV.pdf" "file://$PWD/index.html" >/dev/null 2>&1

raw=$(wc -c < index.html | tr -d ' ')
gz=$(gzip -9 -c index.html | wc -c | tr -d ' ')
echo "index.html: ${raw} bytes raw, ${gz} bytes gzipped (limit ${LIMIT} gzipped)"
[ "$gz" -lt "$LIMIT" ] || { echo "Over size budget" >&2; exit 1; }
