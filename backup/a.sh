#!/bin/bash

# MySQL database credentials
DB_USER="root"
DB_PASSWORD="my-secret-pw"
DB_NAME="auth"

# Backup directory
BACKUP_DIR="/home/root"

# Timestamp (for filename)
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Backup filename
BACKUP_FILE="$BACKUP_DIR/$DB_NAME_$TIMESTAMP.sql"

# Command to create backup
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

# Check if backup was successful
if [ $? -eq 0 ]; then
  echo "Backup successful. File: $BACKUP_FILE"
else
  echo "Backup failed."
fi
