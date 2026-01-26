# Linux Production Monitoring & Troubleshooting Toolkit

## 📌 Overview

This project is a **Linux-only, production-style monitoring and troubleshooting toolkit** built using core Linux commands and shell scripting. It simulates how DevOps / SRE / Linux engineers monitor systems, detect issues, and troubleshoot problems **without restarting services or using external tools**.

The project focuses on **continuous monitoring, automation, and safe troubleshooting practices** commonly followed in real production environments.

---

## 🎯 Project Objectives

* Monitor Linux system health (CPU, memory, disk, load)
* Identify high resource–consuming processes
* Check network ports and services
* Analyze system logs for errors
* Automate checks using cron jobs
* Generate logs and reports for auditing

---

## 🛠️ Tools & Technologies Used

* **OS:** Linux (RHEL / Ubuntu / Amazon Linux compatible)
* **Scripting:** Bash
* **Monitoring Commands:** ps, top, free, df, uptime
* **Networking:** ss, lsof
* **Logs:** journalctl, grep, awk
* **Automation:** cron
* **Permissions:** chmod, chown, setfacl

No cloud, Docker, or third-party tools are used.

---

## 📂 Project Structure

```
linux-prod-toolkit/
├── monitor/
│   ├── cpu_check.sh
│   ├── memory_check.sh
│   ├── disk_check.sh
│   ├── load_check.sh
│   └── network_check.sh
│       │
│       ▼
│   Logs individual metrics to system_health.log
│
├── runner/
│   └── run_all_checks.sh
│       │
│       ▼
│   Orchestrates all monitor scripts
│
├── logs/
│   └── system_health.log
│       │
│       ▼
│   Centralized log of all monitoring scripts
│
├── reports/
│   └── daily_report.txt
│       │
│       ▼
│   Summarized daily metrics (peak, avg, alerts)
│
├── cron/
│   └── monitor_cron
│       │
│       ▼
│   Cron schedules runner script (or individual scripts)
│
└── permissions/
    └── acl_setup.sh
        │
        ▼
    Applies proper permissions for scripts, logs, and reports

```

---

```
📊 Linux Monitoring Project Flow (With Runner)
               ┌───────────────┐
               │     Cron      │
               │ (monitor_cron)│
               └──────┬────────┘
                      │ triggers
                      ▼
            ┌──────────────────────┐
            │ run_all_checks.sh    │
            │ (Runner / Orchestrator)│
            └─────────┬────────────┘
                      │ calls scripts sequentially
                      ▼
   ┌─────────┐ ┌────────────┐ ┌───────────┐ ┌──────────┐ ┌─────────────┐
   │ cpu_check.sh │ memory_check.sh │ disk_check.sh │ load_check.sh │ network_check.sh │
   └─────┬──────┘ └───────┬───────┘ └─────┬───────┘ └─────┬──────┘ └─────┬──────┘
         │                │                 │                │                │
         ▼                ▼                 ▼                ▼                ▼
       ┌───────────────────────────────────────────────────────────────┐
       │                     system_health.log                          │
       │   Logs CPU, Memory, Disk, Load, Network statuses with timestamps │
       └───────────────────────────────────────────────────────────────┘
                              │
                              ▼
                     ┌───────────────────┐
                     │ daily_report.txt  │
                     │  Summarized info  │
                     │  Peak, Average,   │
                     │  Alerts           │
                     └───────────────────┘

```
## ⚙️ Features

### 1️⃣ CPU Monitoring

* Detects high CPU usage
* Lists top CPU-consuming processes
* Logs warnings when threshold is exceeded

### 2️⃣ Memory Monitoring

* Tracks used and free memory
* Identifies memory pressure

### 3️⃣ Disk Monitoring

* Checks disk usage on all mounted filesystems
* Alerts when usage crosses safe limits

### 4️⃣ Load Average Monitoring

* Uses uptime to detect system overload

### 5️⃣ Network & Port Monitoring

* Lists listening ports
* Detects unexpected open ports

### 6️⃣ Log Monitoring

* Scans system logs for ERROR, FAIL, PANIC keywords
* Uses journalctl for systemd-based systems

### 7️⃣ Automation with Cron

* Runs monitoring scripts every 5 minutes
* Generates daily system health reports

---

## ⏱️ Automation (Cron Setup)

Example cron entry:

```
*/5 * * * * /bin/bash /opt/linux-prod-toolkit/monitor/cpu_check.sh
```

---

## 🔐 Security & Permissions

* Uses dedicated directories for logs and reports
* Implements ACLs to allow read-only access to logs
* Avoids running unnecessary scripts as root

---

## 🧪 Sample Output

```
[WARN] CPU usage is above 80%
Top process: java (PID 2345) using 92% CPU
```

---

## 💼 Real-World Use Cases

* Production server monitoring
* Incident troubleshooting without downtime
* Linux interview preparation
* DevOps / SRE hands-on practice

---

## 🧠 What This Project Demonstrates

* Strong Linux fundamentals
* Production troubleshooting mindset
* Automation using native tools
* Safe operational practices

---

## 🚀 Future Enhancements

* Email alerting using mailx
* Slack webhook integration (optional)
* Historical metrics storage
* Ansible-based deployment

---

## 🙌 Author

**Shiva V**
- Linux | DevOps | Cloud Enthusiast

---

> "In production, stability comes from observation before action."
