#!/bin/bash

# Exit on error
set -e

# Check if the user provided an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR="$1"

# Check if the log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory $LOG_DIR does not exist."
    exit 1
fi

# Destination for archives
ARCHIVE_DIR="$HOME/log_archives"
mkdir -p "$ARCHIVE_DIR"

# Timestamp for filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive filename
ARCHIVE_FILE="logs_archive_${TIMESTAMP}.tar.gz"

# Create the archive
tar -czf "$ARCHIVE_DIR/$ARCHIVE_FILE" -C "$LOG_DIR" .

# Log the archive action
LOG_FILE="$ARCHIVE_DIR/archive_log.txt"
echo "$(date +"%Y-%m-%d %H:%M:%S") Archived $LOG_DIR to $ARCHIVE_FILE" >> "$LOG_FILE"

echo "✅ Logs from $LOG_DIR archived to $ARCHIVE_DIR/$ARCHIVE_FILE"
echo "📜 Action recorded in $LOG_FILE"

