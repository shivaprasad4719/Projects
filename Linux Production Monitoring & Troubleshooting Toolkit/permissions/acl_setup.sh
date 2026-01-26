#!/bin/bash
# -------------------------------------------
# ACL Setup Script for Linux Production Monitoring
# Author: DevOps Engineer
# Description: Applies file and directory permissions for monitoring scripts,
#              logs, and reports. Ensures least-privilege access.
# -------------------------------------------

# Base directory of the project
BASE_DIR="/opt/linux-prod-toolkit"

# 1️⃣ Monitoring scripts: executable by owner, readable by group, no access to others
echo "[INFO] Setting permissions for monitor scripts..."
chmod 750 $BASE_DIR/monitor/*.sh
chown root:devops $BASE_DIR/monitor/*.sh

# 2️⃣ Runner script: executable by owner, readable by group
echo "[INFO] Setting permissions for runner scripts..."
chmod 750 $BASE_DIR/runner/*.sh
chown root:devops $BASE_DIR/runner/*.sh

# 3️⃣ Logs directory: writable by scripts, readable by devops group
echo "[INFO] Setting ACL for logs..."
mkdir -p $BASE_DIR/logs
chmod 750 $BASE_DIR/logs
chown root:devops $BASE_DIR/logs
setfacl -R -m u:devops:rwX $BASE_DIR/logs
setfacl -R -m o::--- $BASE_DIR/logs  # Others have no access

# 4️⃣ Reports directory: readable by auditors, writable by devops
echo "[INFO] Setting ACL for reports..."
mkdir -p $BASE_DIR/reports
chmod 750 $BASE_DIR/reports
chown root:devops $BASE_DIR/reports
setfacl -R -m u:devops:rwX $BASE_DIR/reports
setfacl -R -m u:auditor:rX $BASE_DIR/reports
setfacl -R -m o::--- $BASE_DIR/reports  # Others have no access

# 5️⃣ Cron directory: readable only by root or devops
echo "[INFO] Setting permissions for cron files..."
chmod 640 $BASE_DIR/cron/*.sh 2>/dev/null || true
chmod 640 $BASE_DIR/cron/monitor_cron
chown root:devops $BASE_DIR/cron/*

echo "[INFO] ACL setup completed successfully."
