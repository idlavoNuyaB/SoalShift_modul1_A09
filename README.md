# SoalShift_modul1_A09

Jawaban Praktikum Sistem Operasi Modul 1

Soal no 1

Soal no 2

Soal no 3

awal-awal pastikan sudah terinstall pwgen, jika blum lakukan 
apt-get install pwgen

#!/bin/bash

a='password'  //inisialisasi variable 

b=1		//inisialisasi variable

x=1		//inisialisasi variable, 1 karena password start pada password1.txt

var='a'		//inisialisasi variable

value='b'	//inisialisasi vairable

while [ -e $a$b.txt ]   // mengcheck apakah file password’b’.txt ada atau tidak

do

b=$((b+1))		// jika sudah ada b++ untuk membuat file baru yang nama beda

while [ $x -ne $b -a $b -ne 1 ] //fungsi loop untuk mengcheck apakah file lama ada yang sama 

do				//atau tidak

if [ -e $a$b.txt ]		//memasukkan isi file ke variable untuk dibandingkan 1 1

then

var=$(<$a$b.txt)

value=$(<$a$x.txt)

fi

if [ "$var" != "$value" ] //jika isi file tidak sama maka lanjut dibandingkan dengan index lainnya

then

x=$((x+1))

elif [ "$var" == "$value" ] // jika isi file sama, kita generate ulang passwordnya dan dicek lagi

then

x=1

pwgen 12 1 -c -n -s > $a$b.txt  //generate password

var=$(<$a$b.txt)

else

break;

fi

done

x=1

done

pwgen 12 1 -c -n -s > $a$b.txt //generate password untuk file paling baru

var=$(<$a$b.txt)

c=1

while [ $c -ne $b -a $b -ne 1 ] //mencheck apakah file yang baru sama atau tidak dengan yang lain

do

value=$(<$a$c.txt)

if [ "$var" != "$value" ] //jika tidak sama lanjut sampai index check terakhir

then

c=$((c+1))

elif [ "$var" == "$value" ] //jika sama akan mengenerate password baru

then

c=1

pwgen 12 1 -c -n -s > $a$b.txt

var=$(<$a$b.txt)

else

break;

fi

done

soal no 4

soal no 5
