#!/bin/bash

#DO NOT REMOVE THE FOLLOWING TWO LINES
git add $0 >> .local.git.out
git commit -a -m "Lab 2 commit" >> .local.git.out

#Your code here
strength=0
password=`cat $1`
printf "\n-----------------Password Checker-------------------\n"
printf "\nReading text: %s\n" $password;
length=${#password}
printf "Length: %d\n\n" $length;

#Check length requirements
if [ $length -lt 6 -o $length -gt 32 ]; then
	echo "Error: Password length invalid."
	strength=0;
	exit;
fi

#Add strength for length of string
let strength=strength+length;

echo 	" ----------------------- Log -----------------------"
#Check for any digits
if egrep -q [0-9] $1
then
	let strength=strength+5
	echo "| +5 points for any digits                          |"
fi

#Check for special characters
if egrep -q [#$\+%@] $1
then
  	let strength=strength+5
  	echo "| +5 points for special characters                  |"
fi	

#Check for alphabets
if [ `egrep -q [a-z] $1` -o `egrep -q [A-Z] $1` ]
then
  	let strength=strength+5
  	echo "| +5 points for alphabets                           |"
fi	

#Check for
#if [ `egrep -q [a-z]+ $1` -o `egrep -q [A-Z]+ $1` ]
#then
#	let strength=strength-10
#	echo "| -10 points for recurring consecutive alphabets    |"
#fi

#Check for 3 consecutive lower-case alphabets
if egrep -q [a-z][a-z][a-z] $1
then
	let strength=strength-3
	echo "| -3 points for 3 consecutive lower-case alphabets  |"
fi

#Check for 3 consecutive upper-case alphabets 
if egrep -q [A-Z][A-Z][A-Z] $1
then
	let strength=strength-3
	echo "| -3 points for 3 consecutive upper-case alphabets  |"
fi

#Check for 3 consecutive digits
if egrep -q [0-9][0-9][0-9] $1
then
	let strength=strength-3
	echo "| -3 points for 3 consecutive digits                |"
fi

echo 	" --------------------------------------------------"
printf "\n ---------------\n";
printf "| Strength: %d  |\n ---------------\n" $strength;


