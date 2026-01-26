#!/bin/bash

LOG_FILE="/opt/linux-prod-toolkit/logs/system_health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

LOAD_AVG=$(uptime | awk -F'load average:' '{print $2}')

echo "[$TIMESTAMP] [INFO] Load Average:$LOAD_AVG" >> "$LOG_FILE"
