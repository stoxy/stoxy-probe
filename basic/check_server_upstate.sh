#!/bin/bash

# Check if we can connect to Stoxy http port

. cdmi_settings.conf

STOXY_PATH=${1:-/}

curl --stderr /dev/null -o /dev/null -q $STOXY_HOST:${STOXY_PORT}${STOXY_PATH}
echo $?
