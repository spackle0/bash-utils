#!/bin/bash

CPU_MAX=80
MEM_MAX=80
DISK_MAX=90

while true
do
  # Check cpu usage
  cpu_usage=$(top -bn1 | grep "Cpu(s)" | aws  '{print $2}' | cut -d. -f1)

  # Check ram
  mem_usage=$(free | grep Mem | awk '{print int($3/$2*100)}')

  # Check disk
  disk_usage=$(df -h / | awk '{print int($5)}' | sed 's/%//')

  if [ ${cpu_usage} -gt ${CPU_MAX} ] || \
     [ ${mem_usage} -gt ${MEM_MAX} ] || \
     [ ${disk_usage} -gt ${DISK_MAX} ]
  then
    echo "Resource usage is too high"
    # Uncomment the below to send an email or pipe to another command
    # echo "Resource usage is too high" | mail -s "Resource Alert"
  fi
done
