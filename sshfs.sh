#!/bin/sh

IP=$2
action=$1

case "$1" in
  mount)
    if [ ! -d "/mnt/$IP" ];then            #若資料夾不存在，建立之
    mkdir /mnt/$IP
    fi
    sshfs username@$IP:/folder/ /mnt/$IP/
    echo 'mount '$IP' sucessfully!!'
    ;;

  umount)
    if [ -d "/mnt/$IP" ];then              #若資料夾存在，卸載之
      fusermount -u /mnt/$IP/ 2>/dev/null
    fi

    if [ ! "$(ls -A /mnt/$IP)"  ];then     #若資料夾內無檔案，刪除之
        rm -r /mnt/$IP
    fi
  echo 'umount '$IP' successfully!!'
  ;;
  *)
  echo "$0 mount IP"
  echo "$0 umount IP"
  exit 1
esac
