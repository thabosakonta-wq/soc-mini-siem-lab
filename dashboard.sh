#!/data/data/com.termux/files/usr/bin/bash

LOG_FILE="$HOME/SOC/logs/incidents.log"

echo "========================"
echo "     SOC DASHBOARD"
echo "========================"
echo ""

# If log file missing
if [ ! -f "$LOG_FILE" ]; then
    echo "SOC Status        : STOPPED"
    echo "No log file found"
    exit 1
fi

# Clean log (remove empty lines)
CLEAN_LOG=$(grep -v '^[[:space:]]*$' "$LOG_FILE")

# =========================
# CORE METRICS
# =========================

TOTAL=$(echo "$CLEAN_LOG" | wc -l)

CRITICAL=$(echo "$CLEAN_LOG" | grep -c "CRITICAL")
MEDIUM=$(echo "$CLEAN_LOG" | grep -c "MEDIUM")
LOW=$(echo "$CLEAN_LOG" | grep -c "LOW")

CREATE=$(echo "$CLEAN_LOG" | grep -c "CREATE")
MODIFY=$(echo "$CLEAN_LOG" | grep -c "MODIFY")
DELETE=$(echo "$CLEAN_LOG" | grep -c "DELETE")
BURST=$(echo "$CLEAN_LOG" | grep -c "BURST DETECTED")

LOG_SIZE=$(du -h "$LOG_FILE" | awk '{print $1}')

# =========================
# LAST EVENT (FIXED)
# =========================

LAST_EVENT=$(tac "$LOG_FILE" | grep -m 1 -v '^[[:space:]]*$')

# =========================
# RECENT EVENTS (FIXED)
# =========================

RECENT=$(tac "$LOG_FILE" | grep -v '^[[:space:]]*$' | head -n 5 | tac)

# =========================
# TOP TARGET FILE (FIXED)
# =========================

TOP_FILE=$(echo "$CLEAN_LOG" | awk -F'|' '{print $5}' | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

if [ -z "$TOP_FILE" ]; then
    TOP_FILE="None"
fi

# =========================
# DISPLAY
# =========================

echo "SOC Status        : ACTIVE"
echo "Total Incidents   : $TOTAL"
echo ""

echo "Severity Breakdown"
echo "-------------------"
echo "CRITICAL          : $CRITICAL"
echo "MEDIUM            : $MEDIUM"
echo "LOW               : $LOW"
echo ""

# Threat indicator
if [ "$CRITICAL" -gt 0 ]; then
    echo "⚠️  ACTIVE THREATS DETECTED"
    echo ""
fi

echo "Event Types"
echo "-------------------"
echo "CREATE            : $CREATE"
echo "MODIFY            : $MODIFY"
echo "DELETE            : $DELETE"
echo "BURST DETECTED    : $BURST"
echo ""

echo "Top Target File   : $TOP_FILE"
echo "Log Size          : $LOG_SIZE"
echo ""

echo "Last Event"
echo "-------------------"
echo "$LAST_EVENT" | cut -c1-100
echo ""

echo "Recent Activity"
echo "-------------------"
echo "$RECENT" | cut -c1-100
echo ""

echo "Last Updated      : $(date)"
echo "========================"
