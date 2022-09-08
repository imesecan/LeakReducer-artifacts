#!/bin/bash

tolower(){
    echo $(echo $1 | tr '[:upper:]' '[:lower:]');
}

unzip GA.zip
unzip MO-part1.zip
unzip MO-part2.zip

mv MO-part1 MO
mv MO-part2/* MO/

cd subjects
Subs="Atalk Bignum Classify Heartbeat Triangle Underflow"
for Sub in $Subs; do
    sub=$(tolower "$Sub")   # lowercase subject name: atalk
    unzip ${sub}.zip
done
cd heartbeat/
./make.sh
cd ../bignum
./make.sh
cd ../../

for Sub in $Subs; do
    ./getFitness.sh $Sub GA  >> GA-results.txt  2>&1
    ./getFitness.sh $Sub MO  >> MO-results.txt  2>&1
done
