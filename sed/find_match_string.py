#/bin/bash
echo "192.168.203.11 > 225.0.184.180:18400 sfs ss" | sed 's/.*> \(225.0.184.180\):18400.*/\1/'
echo "192.168.203.11 > 225.0.184.180:18400 sfs ss" | sed -n 's/.*> \(225.0.184.180\):18400.*/\1/p'
echo "192.168.203.11 > 225.0.184.180:18400 sfs ss" | sed 's/.*> \(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\):.*/\1/'
###  result ###
225.0.184.180
