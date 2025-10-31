#!/bin/bash

# get total cpu usage
TOTAL_USAGE=$(top -bn1 | grep "Cpu(s)" | awk -F'id,' '{split($1,a,","); print 100 - a[length(a)]}')
echo "Total CPU usage: $TOTAL_USAGE%"

# Memory usage percentages
convert_to_gb() {
    local value=$1
    local number=$(echo "$value" | grep -o '^[0-9.]\+')
    local unit=$(echo "$value" | grep -o '[A-Za-z]\+$')

    case $unit in
        Ki) awk "BEGIN {printf \"%.2f\", $number / (1024 * 1024)}" ;;  # KiB → GiB
        Mi) awk "BEGIN {printf \"%.2f\", $number / 1024}" ;;           # MiB → GiB
        Gi) awk "BEGIN {printf \"%.2f\", $number}" ;;                  # already GiB
        Ti) awk "BEGIN {printf \"%.2f\", $number * 1024}" ;;           # TiB → GiB
        *) echo 0 ;;
    esac
}

TOTAL_MEMORY=$(free -h | awk '/^Mem:/ {print $2}')
USED_MEMORY=$(free -h | awk '/^Mem:/ {print $3}')
FREE_MEMORY=$(free -h | awk '/^Mem:/ {print $4}')

TOTAL_GiB=$(convert_to_gb "$TOTAL_MEMORY")
USED_GiB=$(convert_to_gb "$USED_MEMORY")
FREE_GiB=$(convert_to_gb "$FREE_MEMORY")

USED_MEM_PCT=$(awk "BEGIN {printf \"%.1f\", ($USED_GiB / $TOTAL_GiB) * 100}" 2>/dev/null || echo "0")
FREE_MEM_PCT=$(awk "BEGIN {printf \"%.1f\", ($FREE_GiB / $TOTAL_GiB) * 100}" 2>/dev/null || echo "0")

echo "Memory used percentage: $USED_MEM_PCT%"
echo "Free memory percentage: $FREE_MEM_PCT%"
echo ""
echo "Memory Used: ${USED_GiB}GiB"
echo "Free Memory: ${FREE_GiB}GiB"
echo "Total Memory: ${TOTAL_GiB}GiB"
