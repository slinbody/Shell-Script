#!/bin/bash
export RSYNC_PASSWORD=admin
remote_dir="/mnt/ext/opt/netmgr/api/"
local_dir="/opt/168.95.1.1/api/"
remote_host="168.95.1.1"
rsync --delete -av --checksum\
      --include="nvs_util/" \
      --include="nvs_util/*" \
      --include="nvs_util/*/" \
      --include="nvs_util/*/*.py" \
      --include="lib/" \
      --include="lib/commonFunction.py" \
      --include="lib/click/" \
      --include="lib/click/*.py" \
      --include="lib/pyroute2/" \
      --include="lib/pyroute2/netlink/" \
      --include="lib/pyroute2/netlink/rtnl/" \
      --include="lib/pyroute2/netlink/rtnl/ifinfmsg.py" \
      --exclude="*" \
    admin@$remote_host:$remote_dir $local_dir
 
# 可以再搭配expect 解決要手動輸入密碼
#!/usr/bin/expect -f
set password yourpasswd
spawn /tmp/file_rsync.sh
expect "password: "
send "$password\n"
interact
