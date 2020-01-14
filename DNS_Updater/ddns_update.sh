#!/usr/bin/env bashio
# call script as:
# ./dynamic_dns_lambda_client.sh host1.dyn.example.com. SHARED_SECRET_1 "abc123.execute-api.us-west-2.amazonaws.com/prod"

# If the script is called with no arguments, show an instructional error message.
bashio::log.info "Running ddns_update.sh"
if [ $# -eq 0 ]
    then
    bashio::log.error 'The script requires hostname and shared secret arguments.'
    bashio::log.error "ie  $0 host1.dyn.example.com. sharedsecret \"abc123.execute-api.us-west-2.amazonaws.com/prod\""
    exit
fi

# Set variables based on input arguments
myHostname=$1
mySharedSecret=$2
myAPIURL=$3
# Call the API in get mode to get the IP address
myIP=`curl -q -s  $myAPIURL?mode=get | egrep -o '[0-9\.]+'`
# Build the hashed token
myHash=`echo -n $myIP$myHostname$mySharedSecret | sha256sum | awk '{print $1}'`
# Call the API in set mode to update Route 53
bashio::log.info "Attempting to contact $myAPIURL"
curl -q -s "$myAPIURL?mode=set&hostname=$myHostname&hash=$myHash"
echo
