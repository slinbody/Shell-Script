#!/bin/bash

f1()
{
  sleep $1
  echo "END f1"
}

#f1 2>/dev/null &
f1 ${1:-10} &
pid=$! 

spin=(
"-"
"\\"
"|"
"/"
)

echo -n "[status] ${spin[0]}"
while kill -0 $pid 2> /dev/null
do
  for i in "${spin[@]}"
  do
        echo -ne "\b$i"
        sleep 0.1
  done
done
