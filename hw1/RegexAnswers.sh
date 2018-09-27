#!/bin/bash
# Author: Bryce DesBrisay

echo "How many lines end with a number?"
grep -c -P "\d$" $1
# 15371
echo "How many lines start with a vowel?"
grep -c -P "^[aeiouAEIOU]" $1
# 7749
echo "How many 9 letter (alphabet only) lines?"
grep -c -P "^[a-zA-Z]{9}$" $1
# 2027
echo "How many phone numbers are in the dataset (format: '___-___-____')?"
grep -c -P "^\d{3}-\d{3}-\d{4}$" $1
# 767
echo "How many city of Boulder phone numbers are there (starting with 303)?"
grep -c -P "^303-\d{3}-\d{4}$" $1
# 406
echo "How many lines begin with a number and end with a vowel?"
grep -c -P "^\d.*[aeiouAEIOU]$" $1
# 79
echo "How many email addressed are from UC Denver? (Eg. end with UCDenver.edu)?"
grep -c -P "^.*@UCDenver.edu$" $1
# 454
echo "How many email addresses are in ‘first.last’ name format and involve someone whose first name starts with a letter in the second half of the alphabet (n-z)?"
grep -c -P "^[n-zN-Z]\w+\.\w+@.*$" $1
# 81