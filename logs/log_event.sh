#!/bin/bash

LOG_FILE="/storage/54FB-0CE4/SOC/logs/incidents.log"

SEVERITY="$1"
shift
MESSAGE="$*"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "$TIMESTAMP | $SEVERITY | $MESSAGE" >> "$LOG_FILE"
