#!/bin/bash
random_color()
{
    x=`shuf -i 183-219 -n 1`
    echo -e "\\033[38;5;"$x"m"
}


ping 8.8.8.8 | while read line
do
    echo $(random_color) $line
done
