#!/bin/bash
# =========================================
# Website Availability Checker
# Author: DevOps Learner
# =========================================

URL="https://google.com"     # Change your website here

echo "Checking website: $URL"
echo "Time: $(date)"

# Use curl to check HTTP status code
STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" "$URL")

echo "Status Code: $STATUS_CODE"

if [ "$STATUS_CODE" -eq 200 ]; then
    echo "Website is UP"
else
    echo "Website is DOWN or Not Responding!"
fi
