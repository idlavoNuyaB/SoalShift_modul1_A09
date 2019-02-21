# SoalShift_modul1_A09

Jawaban Praktikum Sistem Operasi Modul 1

Soal no 1

Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.

Hint: Base64, Hexdump

Langkahnya:
a. buat scriptnya untuk mendecrypt

cd Downloads -> untuk berpindah ke downloads

unzip nature.zip -> untuk mengekstrak nature.zip ke folder nature

base64 -d -> decode tiap file di folder nature

xxd -r -> hexdump reverse tiap file di folder nature

b. buat crontabnya


Soal no 2

Soal no 3

awal-awal pastikan sudah terinstall pwgen, jika belum lakukan apt-get install pwgen

lakukan inisialisasi variabel a='password' , b=1 , x= 1, var='a' dan value='b'

lakukan while [ -e $a$b.txt ] untuk mencheck apakah file password’b’.txt ada atau tidak

lakukan b=$((b+1)) jika sudah ada b++ untuk membuat file baru yang nama beda

lakukan while [ $x -ne $b -a $b -ne 1 ] sebagai fungsi loop untuk mencheck apakah file lama ada yang sama atau tidak 

if [ -e $a$b.txt ] digunakan untuk memasukkan isi file ke variable untuk dibandingkan 1 1

var=$(<$a$b.txt)

value=$(<$a$x.txt)

fi

if [ "$var" != "$value" ] -> jika isi file tidak sama maka lanjut dibandingkan dengan index lainnya

then

x=$((x+1))

elif [ "$var" == "$value" ] -> jika isi file sama, kita generate ulang passwordnya dan dicek lagi

then

x=1

pwgen 12 1 -c -n -s > $a$b.txt -> untuk menggenerate password

var=$(<$a$b.txt)

else

break;

fi

done

x=1

done

pwgen 12 1 -c -n -s > $a$b.txt -> untuk menggenerate password untuk file paling baru

var=$(<$a$b.txt)

c=1

while [ $c -ne $b -a $b -ne 1 ] -> digunakan untuk mencheck apakah file yang baru sama atau tidak dengan yang lain

do

value=$(<$a$c.txt)

if [ "$var" != "$value" ] -> jika tidak sama lanjut sampai index check terakhir

then

c=$((c+1))

elif [ "$var" == "$value" ] -> jika sama akan menggenerate password baru

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
