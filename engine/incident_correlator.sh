#!/data/data/com.termux/files/usr/bin/bash

LOG_FILE="$HOME/SOC/logs/incidents.log"
COUNTER_FILE="$HOME/SOC/logs/incident_id.counter"

mkdir -p "$HOME/SOC/logs"
touch "$LOG_FILE"

# Init counter
if [ ! -f "$COUNTER_FILE" ]; then
    echo 0 > "$COUNTER_FILE"
fi

echo "[SOC] Correlator started"

# Burst detection
BURST_WINDOW=5
BURST_THRESHOLD=3

declare -A FILE_COUNT
declare -A FILE_TIME

while IFS='|' read -r EVENT FILE; do

    # 🔴 HARD FIX: reject empty or malformed lines
    if [[ -z "$EVENT" || -z "$FILE" ]]; then
        continue
    fi

    # trim whitespace
    EVENT=$(echo "$EVENT" | xargs)
    FILE=$(echo "$FILE" | xargs)

    if [[ -z "$EVENT" || -z "$FILE" ]]; then
        continue
    fi

    CURRENT_TIME=$(date +%s)
    KEY="$FILE"

    LAST_TIME=${FILE_TIME[$KEY]:-0}
    COUNT=${FILE_COUNT[$KEY]:-0}

    # Burst logic
    if (( CURRENT_TIME - LAST_TIME <= BURST_WINDOW )); then
        COUNT=$((COUNT + 1))
    else
        COUNT=1
    fi

    FILE_COUNT[$KEY]=$COUNT
    FILE_TIME[$KEY]=$CURRENT_TIME

    SCORE=0
    SEVERITY="LOW"

    case "$EVENT" in
        CREATE*) SCORE=2 ;;
        MODIFY*) SCORE=4 ;;
        DELETE*) SCORE=7 ;;
        *) continue ;;
    esac

    ID=$(($(cat "$COUNTER_FILE") + 1))
    echo "$ID" > "$COUNTER_FILE"

    if (( COUNT >= BURST_THRESHOLD )); then
        echo "$(date '+%Y-%m-%d %H:%M:%S') | INC-$ID | CRITICAL | BURST DETECTED | FILE=$KEY | SCORE=10" >> "$LOG_FILE"
        echo "[ALERT] Burst detected on $KEY"
        FILE_COUNT[$KEY]=0
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') | INC-$ID | $SEVERITY | $EVENT | $KEY | SCORE=$SCORE" >> "$LOG_FILE"
        echo "[RAW EVENT] $EVENT on $KEY"
    fi

done
