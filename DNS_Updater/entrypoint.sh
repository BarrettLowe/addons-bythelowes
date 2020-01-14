#!/usr/bin/env bashio

# Start the run once job.
bashio::log.info "Cron Docker container has been started"

#declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

CONFIG_PATH=/data/options.json

CRON_PATTERN=$(jq --raw-output ".cron_pattern" $CONFIG_PATH)

bashio::log.info "Cron Pattern: ${CRON_PATTERN}"
bashio::log.info "Config Path: ${CONFIG_PATH}"

# Setup a cron schedule
echo "${CRON_PATTERN} /run.sh" >> /etc/crontabs/root

bashio::log.info "Running run.sh from entrypoint"
/run.sh

crontab -l
crond -m /dev/stdout -f
