#!/usr/bin/env bash

# 1. Start your long-running command in the background
sync &

# 2. Capture its Process ID (PID)
PID=$!

# 3. Loop as long as the background process exists
while kill -0 $PID 2> /dev/null; do
    clear
    grep -e Dirty: -e Writeback: /proc/meminfo
    sleep 1 # Always include a sleep to protect your CPU
done

echo -e "\nSyncing has finished!"
