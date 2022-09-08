#!/bin/bash

tolower(){
    echo $(echo $1 | tr '[:upper:]' '[:lower:]');
}

Sub=$1                  # Input - Subject Name: Atalk
Test=$2
sub=$(tolower "$Sub")   # lowercase subject name: atalk

# Atalk, Classify, Triangle, Underflow
SUB_FLD=
FNAME=$sub
EXT=c
if [[ $sub == "heartbeat" ]]; then
    # Heartbeat
    # echo "Using Heartbeat"
    SUB_FLD="ssl/"
    FNAME=d1_both
elif [[ $sub == "bignum" ]]; then
    # Heartbeat
    # echo "Using Bignum"
    SUB_FLD="crypto/bn/"
    FNAME=bn_lib
fi

Src=$(pwd)
dst="${Src}/subjects/${sub}"
# algos="afl-ATG afl-TA hash-ATG hash-TA"
cd ${Src}/${Test}/${Sub}
algos=$(ls -d *)

echo "$Src $dst"
echo "Algos: $algos"

    k=0;
    for algo in $algos;
    do
        src="${Src}/${Test}/${Sub}/${algo}"
        cd $src
        pwd
        folders=$(ls -d *)
        echo $folders;
        cd ${cdir}/$dst
        for folder in $folders
        do
            for input_file in ${src}/${folder}/*${FNAME}.${EXT}
            do
                printf "$folder $input_file "
                res=$(cp ${input_file} ${SUB_FLD}${FNAME}.${EXT} 2>&1 );
                err=$(echo $res | grep "cannot stat")
                if [[ -z $err ]]; then
                    output=$(./build.sh | grep "^Leak");
                    echo $output
                else
                    echo "";
                fi
            done
        done
    done;


rm -f driver ${SUB_FLD}${FNAME}.o  ${SUB_FLD}*.gc*  *.gc* ;
cp ${SUB_FLD}${FNAME}.${EXT}.orig ${SUB_FLD}${FNAME}.${EXT}
cd $Src
