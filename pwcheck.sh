#!/bin/bash

#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out

#Your code here
strength=0
password=$1
length=${#password}
if [ $length -gt 5 -a $length -lt 32 ]; then
	echo ">>Log: Works great!";
else
	echo ">>Log: Does not satisfy the condition";
fi
echo Strength: $strength
