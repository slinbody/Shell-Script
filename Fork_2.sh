#/bin/bash

function_to_fork()
{
        echo $1" is start"
        sleep $1
        echo $1" is end"
}

for i in {1..3}
do
        function_to_fork $i &
done
wait
