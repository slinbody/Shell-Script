#!/bin/bash
dir[0]="/tmp/test/a/"
dir[1]="/tmp/test/b/"
dir[2]="/tmp/test/c/"
dir[3]="/tmp/test/d/"
dir[4]="/tmp/test/e/"
while :
do
  for i in {0..4}
  do
    name=${dir[$i]}$(cat /dev/urandom | tr -dc '[:alnum:]' | fold -w 32 | head -n 1)
    echo $name
    touch $name
    dd if=/dev/zero of=$name bs=512 count=200 > /dev/null
  done
  sleep $(( $RANDOM % 5 ))
done

