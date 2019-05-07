#!/bin/sh
set -x
mkdir -p $BACKUP_INPUT_DIR
mkdir -p $BACKUP_OUTPUT_DIR

sh /run-backup.sh

if [ ! $CONTINOUS_BACKUP ]
then
  exit
fi

echo "$BACKUP_CRON_TIME sh /run-backup.sh" > /backup-cron.cron

crontab /backup-cron.cron
crond
/bin/sh # Keep container alive

