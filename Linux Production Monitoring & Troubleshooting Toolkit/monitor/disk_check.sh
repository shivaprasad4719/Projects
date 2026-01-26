#!/bin/bash

LOG_FILE="/opt/linux-prod-toolkit/logs/system_health.log"
DISK_THRESHOLD=85
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

df -h | awk 'NR>1 {print $5, $6}' | while read usage mount
do
    USAGE_PERCENT=${usage%\%}

    if [ "$USAGE_PERCENT" -ge "$DISK_THRESHOLD" ]; then
        echo "[$TIMESTAMP] [WARN] Disk usage high on $mount: ${USAGE_PERCENT}%" >> "$LOG_FILE"
    fi
done
