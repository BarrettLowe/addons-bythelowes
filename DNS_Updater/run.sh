#!/usr/bin/env bash
echo "running run.sh"

CONFIG_PATH=/data/options.json

HOSTNAME=$(jq --raw-output ".server" $CONFIG_PATH)
SECRET=$(jq --raw-output ".secret" $CONFIG_PATH)
URL=$(jq --raw-output ".api_endpoint" $CONFIG_PATH)

echo "Ima try to update $HOSTNAME using $SECRET at $URL"

sh /ddns_update.sh "$HOSTNAME" "$SECRET" "$URL"
