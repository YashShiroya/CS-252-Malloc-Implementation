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
    if echo "$password" | egrep -q [#$\+%@]
    then
    	let strength=strength+5
	fi	
	#Check for any digits
	if echo "$password" | egrep -q [0-9]+
	then
		let strength=strength+5
	fi
	
fi

echo Strength: $strength;

