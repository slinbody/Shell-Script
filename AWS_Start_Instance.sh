#!/bin/sh
#=============================================
#AWS Start instance by aws cli
#=============================================

echo `date +%Y.%m.%d`" "`date +%H:%M:%S`
/usr/local/bin/aws ec2 start-instances --instance-ids i-3686d661 #open instance
#sleep 5
#echo `date +%Y.%m.%d`" "`date +%H:%M:%S`
#bind ip with instance if needed.
/usr/local/bin/aws ec2 associate-address --instance-id i-7e4f2728 --public-ip 54.169.37.16

sleep 5
echo `date +%Y.%m.%d`" "`date +%H:%M:%S`
/usr/local/bin/aws ec2 associate-address --instance-id i-3686d661 --public-ip 12.2.45.2
/usr/local/bin/aws --region ap-northeast-1 ec2 associate-address --instance-id i-26dcab20 --public-ip 5.24.27.5
echo "############"

