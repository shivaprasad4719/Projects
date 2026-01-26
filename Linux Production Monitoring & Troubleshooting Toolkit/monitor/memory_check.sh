#!/bin/bash

LOG_FILE="/opt/linux-prod-toolkit/logs/system_health.log"
MEM_THRESHOLD=80
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')

if [ "$MEM_USAGE" -ge "$MEM_THRESHOLD" ]; then
    TOP_PROCESS=$(ps -eo pid,comm,%mem --sort=-%mem | head -n 2 | tail -n 1)
    echo "[$TIMESTAMP] [WARN] High memory usage: ${MEM_USAGE}% | Top process: $TOP_PROCESS" >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] [INFO] Memory usage normal: ${MEM_USAGE}%" >> "$LOG_FILE"
fi
