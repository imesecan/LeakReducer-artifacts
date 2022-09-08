#!/bin/bash

set -e

docker build -t leakreducer .


NAME=LeakReducer
docker run --name $NAME --cpus 2 leakreducer &
sleep 5
docker stop $NAME


docker cp ${NAME}:/app/LeakReducer/GA-results.txt  ./
docker cp ${NAME}:/app/LeakReducer/MO-results.txt  ./
docker rm $NAME
