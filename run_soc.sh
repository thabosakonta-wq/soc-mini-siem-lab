#!/data/data/com.termux/files/usr/bin/bash

echo "===================================="
echo "   SOC MINI SIEM STARTING"
echo "===================================="

WATCH_DIR="$HOME/SOC/rules"

mkdir -p "$HOME/SOC/logs"

echo "[SOC] FIM started on: $WATCH_DIR"

# kill any old watchers (prevents duplicates)
pkill -f inotifywait 2>/dev/null

inotifywait -m -r \
-e create -e modify -e delete \
--format '%e|%f' \
"$WATCH_DIR" | bash "$HOME/SOC/engine/incident_correlator.sh"
