#!/bin/bash
sed -e

CONFIG_PATH=/data/options.json

SERVER=$(jq --raw-output ".server" $CONFIG_PATH)
CRON_PATTERN=$(jq --raw-output ".cron_pattern" $CONFIG_PATH)

echo "Ima try to update $SERVER with ${CRON_PATTERN}"
