#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: log-archive <log-directory>"
    exit 1
fi

LOG_DIR=$1

if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

ARCHIVE_DIR="$HOME/log_archives"
mkdir -p "$ARCHIVE_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

ARCHIVE_FILE="$ARCHIVE_DIR/logs_archive_$TIMESTAMP.tar.gz"

tar -czf "$ARCHIVE_FILE" -C "$LOG_DIR" .

LOG_FILE="$ARCHIVE_DIR/archive.log"

echo "[$(date +"%Y-%m-%d %H:%M:%S")] Archived $LOG_DIR to $ARCHIVE_FILE" >> "$LOG_FILE"

echo "Archive created: $ARCHIVE_FILE"
