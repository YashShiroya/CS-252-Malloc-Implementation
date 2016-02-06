#!/bin/bash

#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out

#Your code here
strength=0
password=$1
length=${#password}

#Check length requirements
if [ $length -lt 6 -o $length -gt 32 ]; then
	echo "Error: Password length invalid.";
	strength=0;
else
	#Add strength for length of string
	let strength=strength+length;
	
#Check for special characters
	if `egrep -q [#$\+%@] $password`; then
	fi	
	
fi

echo Strength: $strength;

