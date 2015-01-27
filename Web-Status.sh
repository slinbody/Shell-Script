#!/bin/sh
#=============================================
#return http status code to know Server Status
#=============================================

TTT () {

#	echo -n  `date +%Y.%m.%d`" "`date +%H:%M:%S`"   "
#	echo -n `curl 54.251.112.196 --connect-timeout 2 -w '%{response_code}' -so /dev/null`"   "
#	echo -n `curl 54.251.115.157 --connect-timeout 2 -w '%{response_code}' -so /dev/null`"   "
#	echo `curl www.urcosme.com --connect-timeout 2 -w '%{response_code}' -so /dev/null`
#date
	msg1=`date +%Y.%m.%d`" "`date +%H:%M:%S`"   "
#Web_Backend
	msg2=`curl 5.2.12.96 --connect-timeout 2 -w '%{response_code}' -so /dev/null`"   "
#Web_Fronend
	msg3=`curl 4.25.5.17 --connect-timeout 2 -w '%{response_code}' -so /dev/null`"   "
#ELB
	msg4=`curl www.urcosme.com --connect-timeout 2 -w '%{response_code}' -so /dev/null`
#Internet Check
	msg5=`ping 8.8.8.8 -c 2 | awk '/received/{if($4==2)print "PASS";else print "FAIL"}'`
	echo $msg1"  "$msg2"  "$msg3"  "$msg4"   "$msg5

}

if [ `date +%H:%M` = "23:59" ];then
    mv /var/log/Web_Test.log /var/log/Web_Test.log.`date +%Y.%m.%d`
    echo "                   apache nginx urcosme" > /var/log/Web_Test.log
fi

for i in `seq 1 8`
do
	TTT
	if [ $i -lt 8 ];then
	sleep 5
	fi
done 
