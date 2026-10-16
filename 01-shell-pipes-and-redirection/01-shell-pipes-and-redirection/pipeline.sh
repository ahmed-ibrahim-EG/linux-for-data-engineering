#!/usr/bin/env bash

# 1. Check if the log file exists using conditional execution (&&) and suppress errors
[ -f server_logs.txt ] 2>/dev/null && echo "== Starting Pipeline ==" > report.txt

# 2. Count total ERROR occurrences using pipes and append the count
echo -n "Total Errors: " >> report.txt
grep "ERROR" server_logs.txt | wc -l >> report.txt

# 3. Sort errors in reverse order and append to report
echo -e "\n--- Sorted Errors ---" >> report.txt
grep "ERROR" server_logs.txt | sort -r >> report.txt

# 4. Append execution completion timestamp
echo -e "\nCompleted at: $(date)" >> report.txt

