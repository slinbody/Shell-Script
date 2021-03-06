#/bin/bash
echo "192.168.203.11 > 225.0.184.180:18400 sfs ss" | sed 's/.*> \(225.0.184.180\):18400.*/\1/'
echo "192.168.203.11 > 225.0.184.180:18400 sfs ss" | sed -n 's/.*> \(225.0.184.180\):18400.*/\1/p'
echo "192.168.203.11 > 225.0.184.180:18400 sfs ss" | sed 's/.*> \(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\):.*/\1/'
echo "aDDress 192.168.203.11 = String 11:22:33:44:55:66" | sed -n 's/.*ress \(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\) \= String \(.\{16,17\}\)$/\1,\3/p'
###  result ###
225.0.184.180

#### get ip address & MAC address
echo "aDDress 192.168.203.11 = String 1a:b2:3c:44:55:66" | sed -n 's/^aDDress \(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\) = String \(\([0-9a-f]\{2\}\:\)\{5\}\)\([0-9a-f]\{2\}\)$/\1,\3\5/p'
### result ###
192.168.203.11,11:22:33:44:55:66

