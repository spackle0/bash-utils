#!/bin/bash
# Log monitoring script
LOGFILE="/var/log/app.log"

# Tail the file continuously. If an error is found, send an email
# read with -r to preserve backslashes
tail -f ${LOGFILE} | while read -r line
do
  if echo "${line}" | grep -i "ERROR"
  then
    # Uncomment the below to send an email or pipe to another command
    echo "Error found: ${line}" # | mail -s "Error log message"
  fi
done