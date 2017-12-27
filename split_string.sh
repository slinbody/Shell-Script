#!/bin/bash

# Method 1:
TEST_NODE="11 22 33 44 55"
while IFS=' ' read -ra ADDR
do
    for i in "${ADDR[@]}"
    do
        echo $i
    done
done <<< "$TEST_NODE"

# Method 2:
TEST_NODE="11,22,33,44,55"
arrNODE=(${TEST_NODE//,/ })  # the space is necessary

for i in ${arrNODE[@]}
do
    echo $i
done
