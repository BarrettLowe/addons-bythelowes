#!/usr/bin/env bash

# Start the run once job.
echo "Cron Docker container has been started"

#declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

CONFIG_PATH=/data/options.json

CRON_PATTERN=$(jq --raw-output ".cron_pattern" $CONFIG_PATH)

echo "Cron Pattern: ${CRON_PATTERN}"
echo "Config Path: ${CONFIG_PATH}"

# Setup a cron schedule
echo "${CRON_PATTERN} /run.sh" >> /etc/crontabs/root

crontab -l
crond -m /dev/stdout -f
