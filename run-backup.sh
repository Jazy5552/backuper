#!/bin/sh
filename="$BACKUP_OUTPUT_DIR/${BACKUP_PREFIX}.$(date +%Y-%m-%d_%H-%M).tar"

cd $BACKUP_INPUT_DIR
tar pcf $filename $BACKUP_FILES

# Remove old backups
find $BACKUP_OUTPUT_DIR -type f -name "${BACKUP_PREFIX}.*.tar" -mtime +$STALE_BACKUP_TIME -exec rm {} \;

echo "$(du -sh $filename)" >> /backuplog.txt

