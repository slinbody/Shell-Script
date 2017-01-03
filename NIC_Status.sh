#!/bin/bash
IFS=$'\n'  # default value of IFS is: space, tab and newline.
x=($(ip link))
unset IFS

pat=": ([^:]+?)(.*)state ([^ ]+?) "

for i in "${x[@]}"
do
    if [[ $i =~ $pat ]]
    then
        echo ${BASH_REMATCH[1]}" : "${BASH_REMATCH[3]}
    fi
done
