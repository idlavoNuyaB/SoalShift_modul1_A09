#!/bin/bash
a='password'
b=1
x=1
var='a'
value='b'
while [ -e $a$b.txt ]
do
b=$((b+1))
while [ $x -ne $b -a $b -ne 1 ]
do
if [ -e $a$b.txt ]
then
var=$(<$a$b.txt)
value=$(<$a$x.txt)
fi
  if [ "$var" != "$value" ]
then
x=$((x+1))
elif [ "$var" == "$value" ]
then
  x=1
pwgen 12 1 -c -n -s > $a$b.txt
var=$(<$a$b.txt)
else
  break;
fi
done
x=1
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
  c=1
pwgen 12 1 -c -n -s > $a$b.txt
var=$(<$a$b.txt)
else
  break;
fi
done
