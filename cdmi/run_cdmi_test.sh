#!/bin/bash
# Run 

set -e

. test.conf

CONTAINER=$BASE_URL/$TEST_CONTAINER
FILE=$CONTAINER/$TEST_FILE

TMPFILE="/tmp/$(basename $0).$$.tmp"
echo "testtesttest" > $TMPFILE

echo "Executing a test against $BASE_URL with token from $TOKEN_OUTPUT_FILE"

# CRUD for containers and file
echo Creating a container
$cdmiclient -t $TOKEN_OUTPUT_FILE create_container $CONTAINER
echo Creating a file
$cdmiclient -t $TOKEN_OUTPUT_FILE create_object -f $TMPFILE $FILE
echo Reading in a remote file
$cdmiclient -t $TOKEN_OUTPUT_FILE get $FILE
echo Getting container metadata
$cdmiclient -t $TOKEN_OUTPUT_FILE get $CONTAINER
echo Deleting a file
$cdmiclient -t $TOKEN_OUTPUT_FILE delete $FILE
echo Deleting a container
$cdmiclient -t $TOKEN_OUTPUT_FILE delete $CONTAINER
