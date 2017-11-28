#!/bin/bash
IFS='\n'
H1="1.1.1.1"
H2="1.1.1.2"
packet_loss=`ping 2.2.2.2 -q -c 5 | sed -n 's/.*, \([0-9][0-9]*\)% packet.*/\1/p'`
#echo $packet_loss

tr_code=`traceroute 2.2.2.2 -m 3`
code_result=`echo $tr_code | sed -n "s/.*\ \($H1\)\ .*/H1/p"`
#echo $code_result
code_result=$code_result`echo $tr_code | sed -n "s/.*\ \($H2\)\ .*/H2/p"`
#echo $code_result

if [ $packet_loss == 0 ]
then
    echo "PING GOOD"
fi

case $code_result in
    "H1H2")
        echo "TR Good"
        ;;
    "H1")
        echo "TR WRONG"
        ;;
    *)
        echo "TR FAIL"
        ;;
esac
