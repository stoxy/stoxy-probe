#!/bin/bash

. test.conf

CONTAINER=$BASE_URL/$TEST_CONTAINER
FILE=$CONTAINER/$TEST_FILE

TMPFILE="/tmp/$(basename $0).$$.tmp"
echo "testtesttest" > $TMPFILE

echo "Executing a test against $BASE_URL"

# CRUD for containers and file
echo Creating a container && $cdmiclient -u $CREDENTIALS create_container $CONTAINER\
&& echo Creating a file && $cdmiclient -u $CREDENTIALS create_object -f $TMPFILE $FILE\
&& echo Reading in a remote file && $cdmiclient -u $CREDENTIALS get $FILE\
&& echo Getting container metadata && $cdmiclient -u $CREDENTIALS get $CONTAINER\
&& echo Deleting a file && $cdmiclient -u $CREDENTIALS delete $FILE\
&& echo Deleting a container && $cdmiclient -u $CREDENTIALS delete $CONTAINER\
