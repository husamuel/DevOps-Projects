#!/bin/bash

# Total CPU usage
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}'

# Total memory usage (Free vs Used including percentage)
top -bn1 | grep "MiB Mem" | awk '{print $4 " GB"}'

# Total disk usage (Free vs Used including percentage)
df -h / | awk 'NR>1 {print $5}'

# Top 5 processes by CPU usage
top -b -n 1 -o %CPU | head -n 12

# Top 5 processes by memory usage
top -b -n 1 -o %MEM | head -n 12

# uptime
uptime -p

# load average
uptime | awk -F 'load average:' '{print $2}'

# logged in users
who

# failed login attempts
sudo journalctl _COMM=sshd | grep "Failed password"
