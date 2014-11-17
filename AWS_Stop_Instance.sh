#!/bin/sh
#=============================================
#AWS stop instance by cli
#=============================================

echo `date +%Y.%m.%d`" "`date +%H:%M:%S`
/usr/local/bin/aws ec2 stop-instances --instance-ids i-xxxxd661 #redmine.urcosme.com
echo `date +%Y.%m.%d`" "`date +%H:%M:%S`
#not Default Region
/usr/local/bin/aws --region ap-northeast-1 ec2 stop-instances --instance-ids i-xxxxab20 

