#!/usr/bin/env bash
# Author: Pritam Singh
set -euo pipefail
name="Pritam Singh"
roll_number="2601730287"
printf '%s\n' '========================================'
printf 'System Information Report — %s\n' "$name"
printf 'Roll number: %s\nDate: %s\n' "$roll_number" "$(date '+%Y-%m-%d')"
printf '%s\n\n' '========================================'
printf '%s\n' 'CPU'
lscpu | awk -F: '/Model name/ {gsub(/^[ \t]+/, "", $2); model=$2} /^CPU\(s\)/ {gsub(/^[ \t]+/, "", $2); cores=$2} END {printf "Model: %s\nCores (logical CPUs): %s\n", model, cores}'
printf '\n%s\n' 'Memory'
free -h | awk '/^Mem:/ {printf "Total: %s\nUsed: %s\n", $2, $3}'
printf '\n%s\n' 'Top 3 processes by CPU usage'
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 4
printf '\n%s\n' 'Report generated successfully.'
