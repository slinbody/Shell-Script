#!/bin/bash
awk 'BEGIN {sum=10} {sum+=$2} END {print sum}' $1

# input file content
# a 1
# b 2
# c 5
# d 5
