#!/bin/bash

LOG_FILE="/opt/linux-prod-toolkit/logs/system_health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

HIGH_CPU_PROCESSES=$(ps -eo pid,comm,%cpu --sort=-%cpu | awk '$3 > 80')

if [ -n "$HIGH_CPU_PROCESSES" ]; then
    echo "[$TIMESTAMP] [WARN] Processes exceeding CPU threshold:" >> "$LOG_FILE"
    echo "$HIGH_CPU_PROCESSES" >> "$LOG_FILE"
fi
