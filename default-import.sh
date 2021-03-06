#!/bin/sh

# Call DefaultImportCommand: https://developer.kontomatik.com/api-doc/#default-import-command



sendPostRequest() {
    ARGS="-d apiKey=$APIKEY -d sessionId=$1 -d sessionIdSignature=$2 -d since=2017-01-01 -s"
    ARGS="$ARGS https://test.api.kontomatik.com/v1/command/default-import.xml"
    curl $ARGS
}


if [ -f apiKey ]
then
    APIKEY=`cat apikey`
    if [ $# -eq 2 ]
    then
        sendPostRequest $@
    else
        echo "Usage: sh default-import.sh sessionId sessionIdSignature"
    fi
else
    echo "Test apiKey file not found. Aborting..."
fi
