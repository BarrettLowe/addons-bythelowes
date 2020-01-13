#!/usr/bin/env bash
echo "running run.sh"

CONFIG_PATH=/data/options.json

jq -c ".servers[]" $CONFIG_PATH | while read s; do


    HOSTNAME=$(echo "$s" | jq --compact-output ".host")
    SECRET=$(echo "$s" | jq --compact-output ".secret")
    URL=$(echo "$s" | jq --compact-output ".api_endpoint")

    echo "Ima try to update $HOSTNAME using $SECRET at $URL"

    sh /ddns_update.sh "$HOSTNAME" "$SECRET" "$URL"
done
