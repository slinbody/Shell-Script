#!/bin/bash
# This is multi variable assignment example
while read a b c
do
    echo $a,$b,$c
done << EOF
$(awk '{print $1,$2,$3}' /tmp/123)
EOF

--------- /tmp/123 ---------
a b c
z y x
6 5 4
