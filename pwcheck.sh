#!/bin/bash

#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out

#Your code here
strength=0
password=`cat $1`
printf "\n-----Password Checker-----\n"
echo Reading text: $password
length=${#password}

#Check length requirements
if [ $length -lt 6 -o $length -gt 32 ]; then
	echo "Error: Password length invalid."
	strength=0;
	exit;
fi

#Add strength for length of string
let strength=strength+length;
echo Length: $length;
	
#Check for any digits
if egrep -q [0-9] $1
then
	let strength=strength+5
	echo "+5 points for any digits"
fi

#Check for special characters
if egrep -q [#$\+%@] $1
then
  	let strength=strength+5
  	echo "+5 points for special characters"
fi	

#Check for alphabets
if egrep -q [a-z]|[A-Z] $1
then
  	let strength=strength+5
  	echo "+5 points for alphabets"
fi	

printf "Strength: %d\n\n" $strength;

