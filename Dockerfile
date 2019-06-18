FROM alpine:3.9

# ****************************************************
# Prefix for backup tar files
ENV BACKUP_PREFIX="backup-"

# Specific files to backup (Appended to tar command)
ENV BACKUP_FILES="."

# Dir to backup and dir to put backup tar into
ENV BACKUP_INPUT_DIR="/backup-input"
ENV BACKUP_OUTPUT_DIR="/backup-output"

# Enable/disable continous backups
ENV CONTINOUS_BACKUP="true"
# MIN HOUR DAY MONTH WEEKDAY
ENV BACKUP_CRON_TIME="0 9 */3 * *"

# Number of days after which a back is stale and can be deleted
ENV STALE_BACKUP_TIME="30"
# ****************************************************

COPY entrypoint.sh /
COPY run-backup.sh /

VOLUME $BACKUP_INPUT_DIR
VOLUME $BACKUP_OUTPUT_DIR

ENTRYPOINT ["/bin/sh", "entrypoint.sh"]

