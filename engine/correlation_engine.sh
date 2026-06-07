#!/bin/bash

LOG_FILE="/storage/54FB-0CE4/SOC/logs/incidents.log"
STATE_FILE="/storage/54FB-0CE4/SOC/logs/state.tmp"

mkdir -p "$(dirname "$STATE_FILE")"
touch "$STATE_FILE"

calculate_risk() {
    EVENT_TYPE="$1"

    case "$EVENT_TYPE" in
        CREATE) echo 1 ;;
        MODIFY) echo 5 ;;
        DELETE) echo 10 ;;
        *) echo 0 ;;
    esac
}

while read line; do

    ACTION=$(echo "$line" | awk '{print $2}')
    FILE=$(echo "$line" | awk '{print $NF}')

    SCORE=$(calculate_risk "$ACTION")

    # Load current risk
    CURRENT_RISK=$(cat "$STATE_FILE" 2>/dev/null)
    CURRENT_RISK=${CURRENT_RISK:-0}

    NEW_RISK=$((CURRENT_RISK + SCORE))

    echo "$NEW_RISK" > "$STATE_FILE"

    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

    # INCIDENT LOGIC
    if [ "$NEW_RISK" -ge 15 ]; then
        SEVERITY="CRITICAL"
    elif [ "$NEW_RISK" -ge 8 ]; then
        SEVERITY="HIGH"
    else
        SEVERITY="MEDIUM"
    fi

    echo "$TIMESTAMP | $SEVERITY | RISK=$NEW_RISK | EVENT=$ACTION | FILE=$FILE" >> "$LOG_FILE"

done
