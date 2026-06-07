#!/bin/bash

WATCH_DIR="$HOME/SOC/rules"

echo "[SOC] FIM started on: $WATCH_DIR"

inotifywait -m -r -e create,modify,delete "$WATCH_DIR" --format "%e %f" |
while read EVENT FILE; do

    [ -z "$FILE" ] && continue

    echo "[RAW EVENT] $EVENT on $FILE"

    echo "$EVENT $FILE" | $HOME/SOC/engine/incident_correlator.sh

done
