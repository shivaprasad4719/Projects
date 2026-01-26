#!/bin/bash

LOG_FILE="/opt/linux-prod-toolkit/logs/system_health.log"
CPU_THRESHOLD=80
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

CPU_USAGE_INT=${CPU_USAGE%.*}

if [ "$CPU_USAGE_INT" -ge "$CPU_THRESHOLD" ]; then
    TOP_PROCESS=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 2 | tail -n 1)
    echo "[$TIMESTAMP] [WARN] High CPU usage: ${CPU_USAGE_INT}% | Top process: $TOP_PROCESS" >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] [INFO] CPU usage normal: ${CPU_USAGE_INT}%" >> "$LOG_FILE"
fi
