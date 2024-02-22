#!/bin/bash
copy=$1
paste=$2

if [ ! -d $copy ]; then
	echo -e "\033[31m----- | $(date +"%Y-%m-%d | %H:%M:%S") | Backup completed Unsuccessfully! | Source directory does not exist. | -----\033[0m" >> /var/log/rsync-cron-$(date +"%Y-%m-%d").log
elif [ ! -d $paste ]; then
	echo -e "\033[31m----- | $(date +"%Y-%m-%d | %H:%M:%S") | Backup completed Unsuccessfully! | Destination directory does not exist. | -----\033[0m" >> /var/log/rsync-cron-$(date +"%Y-%m-%d").log
else
	rsync -a --checksum --verbose --delete --progress --exclude '.*' $copy $paste >> /var/log/rsync-cron-$(date +"%Y-%m-%d").log
        echo -e "\033[32m----- | $(date +"%Y-%m-%d | %H:%M:%S") | Backup completed Successfully! | -----\033[0m" >> /var/log/rsync-cron-$(date +"%Y-%m-%d").log
fi
