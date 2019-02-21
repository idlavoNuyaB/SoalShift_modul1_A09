#!/bin/bash
a='password'
b=1

while [ -e $a$b.txt ]
do
	b=$((b+1))
done
pwgen 12 1 -c -n -s > $a$b.txt
var=$(<$a$b.txt)
c=1
while [ $c -ne $b -a $b -ne 1 ]
do
	value=$(<$a$c.txt)
  	if [ "$var" != "$value" ]
	then
		c=$((c+1))
	elif [ "$var" == "$value" ]
	then
  		c=0
		pwgen 12 1 -c -n -s > $a$b.txt
		var=$(<$a$b.txt)
	else
  		break;
	fi
done
