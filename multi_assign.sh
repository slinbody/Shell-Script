#!/bin/bash
# This is multi variable assignment example
while read a b c
do
    echo $a,$b,$c
done << EOF
$(awk '{print $1,$2,$3}' /tmp/123)
EOF
