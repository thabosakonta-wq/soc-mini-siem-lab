#!/data/data/com.termux/files/usr/bin/bash

LOG_DIR="$HOME/SOC/logs"
LOG_FILE="$LOG_DIR/incidents.log"

mkdir -p "$LOG_DIR"

DATE=$(date +%Y-%m-%d)

# Rotate log if it exists
if [ -f "$LOG_FILE" ]; then

    mv "$LOG_FILE" "$LOG_DIR/incidents_$DATE.log"

    echo "[SOC] Log rotated: incidents_$DATE.log"

fi

# Create new log
touch "$LOG_FILE"

# Keep only last 7 logs
ls -t $LOG_DIR/incidents_*.log 2>/dev/null | tail -n +8 | xargs rm -f

echo "[SOC] Log rotation completed"
