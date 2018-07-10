#!/bin/bash
# This is multi variable assignment example

# way 1.
while read a b c
do
    echo $a,$b,$c
done << EOF
$(awk '{print $1,$2,$3}' /tmp/123)
EOF

# way 2.
while read a b c
do
    echo $a,$b,$c
done < <(awk '{print $1,$2,$3}' /tmp/123)


--------- /tmp/123 ---------
a b c
z y x
6 5 4
