#!/bin/bash
# =========================================
# Simple System Health Monitoring Script
# Author: DevOps Learner
# =========================================

echo "========================================"
echo " System Health Report - $(date)"
echo "========================================"

# ----- CPU -----
echo -e "\nCPU Load:"
# 'uptime' shows load average (1, 5, 15 min)
uptime

# ----- Memory -----
echo -e "\nMemory Usage:"
# 'free -h' shows total, used, free memory
free -h

# ----- Disk -----
echo -e "\nDisk Usage:"
# 'df -h' lists disk partitions and usage
df -h | grep -vE '^Filesystem|tmpfs|cdrom'

# ----- Top Processes -----
echo -e "\nTop 5 Processes (by memory):"
# Shows top 5 memory-consuming processes
ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -6

# ----- Network -----
echo -e "\nNetwork Connectivity:"
# Ping Google DNS to check internet reachability
ping -c 2 8.8.8.8 >/dev/null
if [ $? -eq 0 ]; then
    echo "Network: OK"
else
    echo "Network: DOWN"
fi

# ----- Service Check -----
SERVICE="nginx"
echo -e "\nService Check ($SERVICE):"
# Checks if nginx service is active
systemctl is-active --quiet $SERVICE
if [ $? -eq 0 ]; then
    echo "$SERVICE is running"
else
    echo "$SERVICE is NOT running"
fi

echo -e "\nReport Completed."
