#!/bin/bash

tolower(){
    echo $(echo $1 | tr '[:upper:]' '[:lower:]');
}

echo "Starting to unzip data folders..."
unzip GA.zip
unzip MO-part1.zip
unzip MO-part2.zip

cdir=$(pwd)
mv MO-part1 MO
mv MO-part2/* MO/
rm -rf MO-part2

echo "Starting to unzip subject folders..."
cd subjects
Subs="Atalk Bignum Classify Heartbeat Triangle Underflow"
for Sub in $Subs; do
    sub=$(tolower "$Sub")   # lowercase subject name: atalk
    unzip ${sub}.zip
done

# Build heartbeat & bignum
echo "Starting to build Heartbeat and Bignum..."
cd heartbeat/
./make.sh
cd ../bignum
./make.sh

cd ${cdir}
echo "Fitness evaluation is starting."
echo "Output is directed to GA-results.txt and MO-results.txt"
for Sub in $Subs; do
	echo "Starting fitness evaluation for ${Sub} using GA."
    ./getFitness.sh $Sub GA  >> GA-results.txt  2>&1
	echo "Starting fitness evaluation for ${Sub} using MO."
    ./getFitness.sh $Sub MO  >> MO-results.txt  2>&1
done

echo "All finished..."
