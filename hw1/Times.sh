#!/bin/bash
# Author: Bryce DesBrisay

file=$1

while IFS= read -r line || [ -n "$line" ]
do
    set $line
    avg=$((($4 + $5 + $6)/3))
    echo "$1 [$avg] $3, $2"
done <"$file" | sort -d -k 3,3 -k 4,4 -k 1,1

