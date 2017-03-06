#!/bin/bash
# << input >>
# bridge name     bridge id               STP enabled     interfaces
# qvs0            8000.245ebe0bb6db       no              eth1
#                                                         eth5
# qvs5            8000.000000000000       no
# tbtbr0          8000.000000000000       no
#
# << output >>
# qvs0,eth1
# qvs0,eth5

#IFS='\n'
IFS=$(echo -e '\n') # this will be much better
qvs=''

brctl_info()
{
result=`brctl show | awk 'NR>1'`
echo $result | while read line
do
    #echo $line
    num=`echo "$line" | wc -w`
#    echo $num
    if [ $num -eq 4 ]
    then
#        echo $line
        qvs=`echo $line | awk '{print $1}'`
        mem=`echo $line | awk '{print $4}'`
    elif [ $num -eq 1 ]
    then
        mem=`echo $line | awk '{print $1}'`
    else
        continue
    fi
    echo $qvs,$mem
done
}

brctl_info
