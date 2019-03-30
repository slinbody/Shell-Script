#!/bin/bash
ip=(192.168.203.1 192.168.203.2 192.168.203.3 192.168.203.4)
res=''

#if [ ! $res ]
#then
#    echo 'empty string'
#fi

concat_string()
{
    for i in ${ip[@]}
    do
        if [ ! "$res" ]
        then
            res=$i
    #        echo 'EMPTY'
        else
            res="$res"' or '"$i"
        fi
    #    echo $i
    done

    echo "$res"  # this is return
}

x=$(concat_string $ip)  # how to return value
echo "the x is : $x"

###############   result   ###############
the x is : 192.168.203.1 or 192.168.203.2 or 192.168.203.3 or 192.168.203.4
