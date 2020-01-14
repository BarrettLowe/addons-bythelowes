#!/usr/bin/env bashio

CONFIG_PATH=/data/options.json

cat ${CONFIG_PATH}

jq -c ".server[]" $CONFIG_PATH | while read s; do


    HOSTNAME=$(echo "$s" | jq -r --compact-output ".host")
    SECRET=$(echo "$s" | jq -r --compact-output ".secret")
    URL=$(echo $s | jq -r --compact-output ".api_endpoint")

    bashio::log.info "Trying to update $HOSTNAME using $SECRET at $URL"

    /ddns_update.sh "$HOSTNAME" "$SECRET" $URL
done
