#!/bin/bash
awk 'BEGIN {sum=10} $1 ~ /d/ {sum+=$2} END {print sum}' $1

# input file content
#a 1
#b 2
#c 4
#d 5
#d 6
#d 8
#d 7

