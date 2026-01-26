#!/bin/bash

LOG_FILE="/opt/linux-prod-toolkit/logs/system_health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

OPEN_PORTS=$(ss -tuln | wc -l)

echo "[$TIMESTAMP] [INFO] Active listening ports count: $OPEN_PORTS" >> "$LOG_FILE"
