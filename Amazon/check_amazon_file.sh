#!/bin/sh
# check files that uploaded to amazon cloud drive by acd_cli

acd_cli sync

if [ "$#" == 0 ] # no filename
then
    echo "NO Filename!!"
    exit 0
fi

amazon_dir='/2017/'$1

file=`acd_cli ls $amazon_dir | awk '{print $3}'`
for i in $file
do
    echo -n $i": "
    acd_cli metadata $amazon_dir"/"$i | sed -n 's/ *"size": \([0-9][0-9]*\),/\1/p'
done

local_dir='/mine/Amazon/'$1

ls -la $local_dir | awk 'NR>1{if ($9 != "." && $9 != "..") {print $9": "$5}}'
