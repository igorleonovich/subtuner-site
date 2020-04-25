#!/bin/bash

# env $(cat ".env" | xargs)
# DATABASE_HOST=localhost

# Backup database
BACKUP_DIR=./db
FILE_SUFFIX=_pg_backup.sql
OUTPUT_FILE=${BACKUP_DIR}/`date +"%Y_%m_%d__%H_%M"`${FILE_SUFFIX}
PGPASSWORD=S5ttG2vZNEzwhH pg_dump -U subtuner -h localhost -d subtuner --format=p --file=${OUTPUT_FILE}
gzip $OUTPUT_FILE

# Remove old backups
# DAYS_TO_KEEP=30
# find $BACKUP_DIR -maxdepth 1 -mtime +$DAYS_TO_KEEP -name "*${FILE_SUFFIX}.gz" -exec rm -rf '{}' ';'
