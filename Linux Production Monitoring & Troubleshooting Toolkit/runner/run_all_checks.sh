#!/bin/bash

BASE_DIR="/opt/linux-prod-toolkit"
LOG_FILE="$BASE_DIR/logs/runner.log"

SCRIPTS=(
  "monitor/cpu_check.sh"
  "monitor/memory_check.sh"
  "monitor/load_check.sh"
  "monitor/disk_check.sh"
  "monitor/network_check.sh"
)

for script in "${SCRIPTS[@]}"; do
  if [ -x "$BASE_DIR/$script" ]; then
    "$BASE_DIR/$script" >> "$LOG_FILE" 2>&1
  else
    echo "$(date) [ERROR] $script not executable" >> "$LOG_FILE"
  fi
done
