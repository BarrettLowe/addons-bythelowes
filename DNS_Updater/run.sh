#!/usr/bin/env bashio
bashio::log.info "running run.sh"

CONFIG_PATH=/data/options.json

jq -c ".servers[]" $CONFIG_PATH | while read s; do


    HOSTNAME=$(echo "$s" | jq --compact-output ".host")
    SECRET=$(echo "$s" | jq --compact-output ".secret")
    URL=$(echo "$s" | jq --compact-output ".api_endpoint")

    bashio::log.info "Trying to update $HOSTNAME using $SECRET at $URL"

    sh /ddns_update.sh "$HOSTNAME" "$SECRET" "$URL"
done
