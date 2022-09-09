#!/bin/bash
# Usage:
#  	./run-Docker.sh  build_image_name  run_image_name
# Sample:
#	./run-Docker.sh  leakreducer  LeakReducer
#

set -e
BIN=$1  	# Build Image Name
RIN=$2  	# Run Image Name
if [[ -z $BIN ]]; then BIN="leakreducer"; fi
if [[ -z $RIN ]]; then RIN="LeakReducer"; fi


docker build -t $BIN .
docker run  --name $RIN  $BIN  &
sleep 3
docker stop $RIN


docker cp ${RIN}:/app/LeakReducer/GA-results.txt  ./
docker cp ${RIN}:/app/LeakReducer/MO-results.txt  ./
docker rm $RIN
