#!/bin/bash
a=(我 是 金 城 五)
a=($(shuf -e "${a[@]}"))

for i in ${a[*]}
do
    echo $i
done
