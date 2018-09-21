#!/bin/bash
# Author: Bryce DesBrisay

awk 'NR>0 {print $1 " [" int(($4 + $5 + $6) / 3) "] " $3 ", " $2}' $1 | sort -d -k 3,3 -k 4,4 -k 1,1