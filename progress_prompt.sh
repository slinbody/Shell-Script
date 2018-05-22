#!/bin/bash
# execute programs in background 
# with prompt in command line


random_color()
{
    x=`shuf -i 183-219 -n 1`
    echo -ne "\r\\033[38;5;"$x"m"$1"\\0"
}


sig=1
trap 'sig=2' 2

###############
#   execute area, put them to background
###############


while [ $sig -eq 1 ]
do
    sleep 1
    DATE=`date '+%Y-%m-%d %H:%M:%S'`
    random_color "$DATE"
done

echo " "
