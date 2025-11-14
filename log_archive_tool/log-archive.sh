#!/usr/bin/bash

# Log Archive Tool
#
read -p "Enter the log directory path: " LOG_DIR

CURRENT_DATE=$(date +"%Y-%m-%d_%H-%M-%S")

OUTPUT_FILE="logs_archive_${CURRENT_DATE}.tar.gz"

echo "Creating archive: $OUTPUT_FILE"

tar -cvzf "$OUTPUT_FILE" -C "$LOG_DIR" .

# NOTE: Do not remove system logs, maybe just application specific logs
#
read -p "Do you want to clear the logs? (Y/n), defaults to No " Y_OR_N
Y_OR_N=${Y_OR_N:-n}

case "$Y_OR_N" in
    y|Y)
        rm -rf "${LOG_DIR}"/*
        echo "Cleared the logs directory: ${LOG_DIR}"
        ;;
    n|N)
        echo "Gotcha!"
        ;;
    *)
        echo "Invalid command: '$Y_OR_N'"
        echo "Exiting..."
        exit 1
        ;;
esac
