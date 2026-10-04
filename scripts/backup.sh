#!/bin/bash
set -e 

SOURCE_DIR="$HOME/ict_lab2/docs"
BACKUP_DIR="$HOME/ict_lab2/backup"
LOG_FILE="$HOME/ict_lab2/logs/backup.log"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/docs_backup_$TIMESTAMP.tar.gz"


if [ ! -d "$SOURCE_DIR" ]; then
    echo "[ERROR] Директория $SOURCE_DIR не существует!" | tee -a "$LOG_FILE"
    exit 1
fi


tar -czf "$BACKUP_FILE" -C "$HOME/ict_lab2" docs
echo "[$(date)] Успешный бэкап $BACKUP_FILE" >> "$LOG_FILE"


find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete

