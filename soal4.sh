#!/bin/bash
#encrypt

#ambiljam
waktu=`date "+%X" | awk -F : '{print $1}'`
#konvert string ke int
waktu=$(echo "$waktu" | bc)

#batas bawah a ke huruf lain
kecil=$(($waktu + 97))
kecil=$(printf \\$(printf '%03o' $kecil))
#batas atas z ke huruf lain
bawah=$(printf '%d' "'$kecil")
bawah=$(($bawah-1))
if [ $bawah -lt 97 ]
then
  bawah=122
fi
bawah=$(printf \\$(printf '%03o' $bawah))

#batas bawah A ke huruf lain
besar=$(($waktu+65))
besar=$(printf \\$(printf '%03o' $besar))
#batas atas Z ke huruf lain
atas=$(printf '%d' "'$besar")
let atas--
if [ $atas -lt 65 ]
then
    atas=90
fi
atas=$(printf \\$(printf '%03o' $atas))

jam=`date "+%X" | awk -F: '{print $1}'`
menit=`date "+%X" | awk -F: '{print $2}'`
tanggal=`date | awk '{print $3}'`
bulan=`date | awk '{print $2}'`
tahun=`date | awk '{print $6}'`

# save
cat /var/log/syslog | tr [a-z] ["$kecil"-za-"$bawah"] | tr [A-Z] ["$besar"-ZA-"$atas"] > "$jam:$menit $tanggal-$bulan-$tahun".txt


#decrypt
waktu=$(($waktu-1))
#batas bawah (a jadi apa) huruf kecil
dkecil=$((122-$waktu))
if [ $dkecil -gt 122 ]
then
    a=97
fi
dkecil=$(printf \\$(printf '%03o' $dkecil))
#batas atas huruf kecil
dbawah=$(printf '%d' "'$dkecil")
let dbawah--
if [ $dbawah -lt 97 ]
then
    dbawah=122
fi
dbawah=$(printf \\$(printf '%03o' $dbawah))

#batas bawah (A jadi apa) huruf besar
cbesar=$((90-$waktu))
if [ $cbesar -gt 90 ]
then
    cbesar=65
fi
cbesar=$(printf \\$(printf '%03o' $cbesar))
#batas atas huruf besar
datas=$(printf '%d' "'$cbesar")
let datas--
if [ $datas -lt 65 ]
then
    datas=90
fi
datas=$(printf \\$(printf '%03o' $datas))

cat "$jam:$menit $tanggal-$bulan-$tahun".txt | tr [a-z] ["$dkecil"-za-"$dbawah"] | tr [A-Z] ["$cbesar"-ZA-"$datas"] > "$jam:$menit $tanggal-$bulan-$tahun-decrypted".txt

