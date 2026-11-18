#!/usr/bin/env bash
# Author: Pritam Singh
set -euo pipefail
if [[ $# -lt 1 ]]; then echo 'Usage: ./backup.sh <folder>' >&2; exit 1; fi
source_dir=${1%/}
if [[ ! -d "$source_dir" ]]; then printf 'Error: folder does not exist: %s\n' "$1" >&2; exit 1; fi
backup_dir="$HOME/DeveloperPortfolio_Backups"
mkdir -p "$backup_dir"
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
archive="$backup_dir/backup_${timestamp}.tar.gz"
tar -czf "$archive" -C "$(dirname "$source_dir")" "$(basename "$source_dir")"
size=$(du -h "$archive" | awk '{print $1}')
printf 'Backup created: %s (%s)\n' "$archive" "$size"
printf '%s SUCCESS %s (%s)\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$(basename "$archive")" "$size" >> "$backup_dir/backup.log"
