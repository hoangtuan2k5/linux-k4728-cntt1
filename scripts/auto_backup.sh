#!/bin/bash

DATA_DIR=~/automation_project/data
BACKUP_DIR=~/automation_project/backups
LOGS_DIR=~/automation_project/logs
LOG_FILE="$LOGS_DIR/backup.log"

if [ -d "$BACKUP_DIR" ]; then
    echo "Thu muc backup da ton tai"
else
    mkdir $BACKUP_DIR
    echo "Da tao thu muc backups"
fi

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")
BACKUP_FILE="$BACKUP_DIR/data_backup_${TIMESTAMP}.tar.gz"

if [ -f "$LOG_FILE" ]; then
    echo "Backup log da ton tai"
else
    mkdir -p "$LOGS_DIR"
    touch "$LOG_FILE"
    echo "Da tao file backup.log"
fi

if [ -d "$DATA_DIR" ]; then
    tar -czf "$BACKUP_FILE" "$DATA_DIR"
    echo "Backup da hoan thanh: $BACKUP_FILE"
    echo "[${TIMESTAMP}] Backup da hoan thanh: $(basename "$BACKUP_FILE")" >> "$LOG_FILE"
else
    echo "Loi: Thu muc $DATA_DIR khong ton tai"
    echo "[${TIMESTAMP}] Loi: Thu muc $DATA_DIR khong ton tai" >> "$LOG_FILE"
fi

if ping -c 1 google.com.vn >/dev/null 2>&1; then
  echo "Co ket noi mang"
  echo "[${TIMESTAMP}] Co ket noi mang" >>"$LOG_FILE"
else
  echo "Khong ket noi mang"
  echo "[${TIMESTAMP}] Khong ket noi mang" >>"$LOG_FILE"
fi

# Giu 5 file backup moi nhat
BACKUP_COUNT=$(ls -1 "$BACKUP_DIR"/*.tar.gz 2>/dev/null | wc -l)

if [ "$BACKUP_COUNT" -gt 5 ]; then
    ls -1t "$BACKUP_DIR"/*.tar.gz | tail -n +6 | xargs rm -f
    echo "[${TIMESTAMP}] Da xoa file backup cu, chi giu lai 5 file moi nhat" >> "$LOG_FILE"
fi

# Auto đẩy code lên git
PROJECT_DIR=~/automation_project

cd "$PROJECT_DIR" || {
    echo "Loi: Khong the cd vao $PROJECT_DIR"
    echo "[${TIMESTAMP}] Loi: Khong the cd vao $PROJECT_DIR" >> "$LOG_FILE"
    exit 1
}

git add .
git commit -m "backup: $(date '+%Y-%m-%d %H:%M') - auto backup data"
git push origin main
echo "[${TIMESTAMP}] Da push len GitHub thanh cong" >> "$LOG_FILE"