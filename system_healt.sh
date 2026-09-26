#!/bin/bash
LOG_FILE="/home/tarik/projects/aws-linux-lab/health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

MEM_USAGE=$(free -m | awk '/Mem:/ {print $3"/"$2"MB ("$3/$2*100"%)"}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $3"/"$2" ("$5")"}')

if systemctl is-active --quiet nginx; then
    NGINX_STATUS="AKTIVAN (Radi)"
else
    NGINX_STATUS="NEAKTIVAN (Zaustavljen)"
fi

echo "=== System Health Check: $TIMESTAMP ===" > $LOG_FILE
echo "--- RAM Usage ---" >> $LOG_FILE
echo "Zauzetost memorije: $MEM_USAGE" >> $LOG_FILE
echo "--- Disk Usage ---" >> $LOG_FILE
echo "Zauzetost diska: $DISK_USAGE" >> $LOG_FILE
echo "--- Nginx Status ---" >> $LOG_FILE
echo "Nginx servis: $NGINX_STATUS" >> $LOG_FILE
