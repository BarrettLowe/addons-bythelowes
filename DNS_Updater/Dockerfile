ARG BUILD_FROM=hassioaddons/base
FROM ${BUILD_FROM}

ENV TERM="xterm-256color"

# Install cron
RUN apk update && apk add dcron wget rsync ca-certificates sshpass openssh-client bash bash-doc bash-completion tar jq curl && rm -rf /var/cache/apk/*

RUN mkdir -p /var/log/cron && mkdir -m 0644 -p /var/spool/cron/crontabs && touch /var/log/cron/cron.log && mkdir -m 0644 -p /etc/cron.d


# Add files
ADD run.sh /run.sh
ADD ddns_update.sh /ddns_update.sh
ADD entrypoint.sh /entrypoint.sh
 
RUN chmod +x /run.sh /entrypoint.sh /ddns_update.sh

ENTRYPOINT /entrypoint.sh
