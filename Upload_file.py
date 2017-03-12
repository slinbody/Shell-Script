#!
# 1. upload to amazon drive
# 2. check if file size is the same
# 3. delete source file

#!/bin/sh
IFS=$(echo -e "\n")

src_path='/mine/Amazon'
dst_path='/2017/'
date


amazon_list=`acd_cli ls /2017/ | awk '{print $3}' | sed -n 's/\///p'`

on_amazon() {

tmp=`echo $amazon_list`
line=`echo $tmp | wc -l`
#echo $line
while [ $line -gt 0 ]
do
    amazon_file=`echo "$tmp" | head -n 1`
    tmp=`echo $tmp | sed "1d" `

    if [ $amazon_file = $1 ]
    then

        return 1
    fi

    line=$(($line-1))
done

return 0
}

#amazon_list=`acd_cli ls /2017/ | awk '{print $3}'`
#amazon_list=`acd_cli ls /2017/ | awk '{print $3}' | sed -n 's/\///p'`


echo -e '\n'

while [ -n "$amazon_bsd" ]
do
    local_file=`echo "$amazon_bsd" | head -n 1`
    amazon_bsd=`echo $amazon_bsd | sed -e '1d' `

    on_amazon $local_file
    if [ $? -eq 1 ]
    then
        echo $local_file" exist"
    fi

    sleep 1
done

