#!/bin/sh
# Request a token from a trusted OpenStack service and save it to a file
set -e

. test.conf

echo "Getting trusted Keystone server from CDMI/Stoxy response..."
KEYSTONE=$(curl -s -i $BASE_URL | grep -i "www-authenticate:.*Keystone*"|cut -d'=' -f2 | tr -d ' ' | tr -d '\r')
echo "Found: $KEYSTONE"

echo "Requesting a scoped token for $TENANT_NAME tenant and saving to $TOKEN_OUTPUT_FILE..."
echo $KEYSTONE/asdasd
curl -v -s -k --cert $X509_USER_PROXY  \
     -d "{\"auth\":{\"voms\": true, \"tenantName\": \"${TENANT_NAME}\"}}" \
     -H "Content-type: application/json" $KEYSTONE/v2.0/tokens -o $TOKEN_OUTPUT_FILE
echo "Done"
