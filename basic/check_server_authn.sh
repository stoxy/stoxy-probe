#!/bin/bash

# Check if server response contains a reasonable CDMI string

. cdmi_settings.conf

# we always expect children fields
curl --stderr - -u $STOXY_USER:$STOXY_PASSWORD $STOXY_HOST:${STOXY_PORT}/storage|grep -q children
# todo - use cli json validator?
echo $?
