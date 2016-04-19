#!/bin/bash

for j in {101..102}
do
i=$((10000+j))
echo "Target[bps_$i]: 1.3.6.1.2.1.31.1.1.1.10.$i&1.3.6.1.2.1.31.1.1.1.6.$i:NTU@140.112.116.244:::::2"
echo "MaxBytes[bps_$i]: 125000000"
echo "Title[bps_$i]: Traffic Analysis (interface Gi 0/$j)"
echo "PageTop[bps_$i]: Traffic Analysis (interface Gi 0/$j)"

echo " "
echo "Target[pps_$i]: 1.3.6.1.2.1.31.1.1.1.11.$i&1.3.6.1.2.1.31.1.1.1.7.$i:NTU@140.112.116.244:::::2"
echo "MaxBytes[pps_$i]: 999999999"
echo "Colours[pps_$i]: GREEN#00ffa0,ORANGE#ffa040,DARK GREEN#003310,DARK ORANGE#e07000"
echo "ShortLegend[pps_$i]: pps"
echo "Title[pps_$i]: Packet Analysis (interface Gi 0/$j)"
echo "PageTop[pps_$i]: Packet Analysis (interface Gi 0/$j)"
echo " "
done
