#!/bin/sh
#set -x
mkdir -p $BACKUP_INPUT_DIR
mkdir -p $BACKUP_OUTPUT_DIR

sh /run-backup.sh

if [ "$CONTINOUS_BACKUP" = false ]
then
  exit
fi

env > /backup-cron.env
echo "$BACKUP_CRON_TIME cat /backup-cron.env | env sh /run-backup.sh" > /backup-cron.cron

crontab /backup-cron.cron

touch /backuplog.txt
crond -L /backuplog.txt

tail -f /backuplog.txt # Keep container alive

