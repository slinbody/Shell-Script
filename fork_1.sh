###### a.out ######
#!/bin/sh
a=$1
echo $a" is start"
sleep 2
echo $a" is end"
###################

###### b.out  #####
#!/bin/bash
counter=0
for i in {1..10}
do
        ./a.out $i &
        counter=$(($counter+1))
        if [ "$counter" -gt 2 ]; then
                wait   #等所有程序結束
                counter=0
        fi
done
wait
###################
