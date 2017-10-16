#!/bin/bash
file=(`ls /home/pi/*.mp3`)
file=($(shuf -e "${file[@]}"))

for i in ${file[@]}
do

omxplayer -o local --vol 500 $i

done
