#!/bin/sh
source='/tmp/file1'
exec < $source

while read line
do
        if ! grep -q "$line" /tmp/file2 ; then
                echo $line
        fi
done
 
