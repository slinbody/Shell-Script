#!/bin/sh
echo $$                             # show PID
i=0
trap 'date +%s;i=$(($i+1))' USR1

while [ 1 ]
do
    echo "i : $i"
    sleep 5
done

# kill -USR1 PID
# it will echo time and increase i value
