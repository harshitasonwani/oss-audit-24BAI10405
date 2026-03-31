#!/bin/bash

# I made this script to check logs and find keyword occurrences

# take log file from user or use default
log_file=${1:-"/var/log/syslog"}

# take keyword or use default "error"
keyword=${2:-"error"}

# check if file exists
if [ ! -f "$log_file" ]
then
    echo "Log file not found"
    exit 1
fi

echo "Checking log file: $log_file"
echo "Searching for: $keyword"
echo ""

# count number of matches
match_count=$(grep -i "$keyword" "$log_file" | wc -l)

echo "Total matches found: $match_count"
echo ""

echo "Last 5 matching lines:"
grep -i "$keyword" "$log_file" | tail -5

echo ""
echo "----- Log check complete -----"
