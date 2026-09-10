#!/bin/bash
# Commit + push the Klipper config to GitHub. Triggered from a Mainsail macro.
set -euo pipefail
export HOME=/home/biqu
CFG_DIR=/home/biqu/printer_data/config
cd "$CFG_DIR"

if [ -z "$(git status --porcelain)" ]; then
    echo "config backup: nothing to commit"
    exit 0
fi

git add -A
git commit -m "backup $(date +'%Y-%m-%d %H:%M:%S')"
git push origin main
echo "config backup: pushed to GitHub"
