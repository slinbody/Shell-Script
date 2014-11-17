#!/bin/sh
#This is used to 
#by Rsync over ssh
echo `date +%Y.%m.%d`" "`date +%H:%M:%S`" Delete files older than 13 days!!" 
# delete files more than 13 days
find /mnt -iname "105*" -maxdepth 1 -ctime +13 -exec rm -rf {} \;
echo `date +%Y.%m.%d`" "`date +%H:%M:%S`" Delete finished !!"

dst='/mnt/105-'`date +%Y%m%d`
mkdir $dst
src=/media/media1/officePublicPartition/

echo `date +%Y.%m.%d`" "`date +%H:%M:%S`" backup 192.168.1.105 Starting !!"
/usr/local/bin/rsync -az -e 'ssh -p 22 -o StrictHostKeyChecking=no' root@192.168.1.105:$src $dst
echo `date +%Y.%m.%d`" "`date +%H:%M:%S`" backup 192.168.1.105 Finished !!!"

#don't backup logs directory
rsync -aR -v  -e 'ssh -p 22' --exclude='logs' --rsync-path='sudo rsync' ubuntu@54.2.11.1:/mnt $dst/urcosme_nginx/


