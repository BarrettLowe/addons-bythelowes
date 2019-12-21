#!/bin/bash

# Start the run once job.
echo "Cron Docker container has been started"

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

CONFIG_PATH=/data/options.json

CRON_PATTERN=$(jq --raw-output ".cron_pattern" $CONFIG_PATH)

# Setup a cron schedule
echo "SHELL=/bin/bash
BASH_ENV=/container.env
${CRON_PATTERN} /run.sh >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > scheduler.txt

crontab scheduler.txt
cron -f