#!/bin/bash
# reference http://www.pavel-jiranek.net/simple-progress-bar-in-bash/
bar=''
for i in {1..10}
do
        bar=$bar"="
        line=$(printf "[ %-10s ] (%d%%)\r" $bar $i)
        echo -en "${line}\r"
        sleep 1
done
echo
