#!/bin/sh

# Call ImportOwnersCommand: https://developer.kontomatik.com/api-doc/#import-owners-command



sendPostRequest() {
    ARGS="-d apiKey=$APIKEY -d sessionId=$1 -d sessionIdSignature=$2 -s"
    ARGS="$ARGS https://test.api.kontomatik.com/v1/command/import-owners.xml"
    curl $ARGS
}


if [ -f apiKey ]
then
    APIKEY=`cat apikey`
    if [ $# -eq 2 ]
    then
        sendPostRequest $@
    else
        echo "Usage: sh import-owners.sh sessionId sessionIdSignature"
    fi
else
    echo "Test apiKey file not found. Aborting..."
fi
