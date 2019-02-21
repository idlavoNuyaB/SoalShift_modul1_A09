#!/bin/bash
#encrypt

#ambiljam
waktu=$(date "+%X" | awk -F : '{print $1}')
#konvert string ke int
waktu=$(echo "$waktu" | bc)

#batas bawah a ke huruf lain dengan mengubah decimal ke ascii
kecil=$(($waktu + 97))
kecil=$(printf \\$(printf '%03o' $kecil))
#batas atas z ke huruf lain dengan mengembalikin ascii ke decimal lalu ke ascii lagi
bawah=$(printf '%d' "'$kecil")
let bawah--
if [ $bawah -lt 97 ]
then
  bawah=122
fi
bawah=$(printf \\$(printf '%03o' $bawah))

#batas bawah A ke huruf lain decimal ascii
besar=$(($waktu+65))
besar=$(printf \\$(printf '%03o' $besar))
#batas atas Z ke huruf lain ascii decimal ascii
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
let waktu--
#batas bawah huruf kecil decimal ascii
dkecil=$((122-$waktu))
if [ $dkecil -gt 122 ]
then
    a=97
fi
dkecil=$(printf \\$(printf '%03o' $dkecil))
#batas atas huruf kecil ascii decimal ascii
dbawah=$(printf '%d' "'$dkecil")
let dbawah--
if [ $dbawah -lt 97 ]
then
    dbawah=122
fi
dbawah=$(printf \\$(printf '%03o' $dbawah))

#batas bawah huruf besar decimal ascii
cbesar=$((90-$waktu))
if [ $cbesar -gt 90 ]
then
    cbesar=65
fi
cbesar=$(printf \\$(printf '%03o' $cbesar))
#batas atas huruf besar ascii decimal ascii
datas=$(printf '%d' "'$cbesar")
let datas--
if [ $datas -lt 65 ]
then
    datas=90
fi
datas=$(printf \\$(printf '%03o' $datas))

cat "$jam:$menit $tanggal-$bulan-$tahun".txt | tr [a-z] ["$dkecil"-za-"$dbawah"] | tr [A-Z] ["$cbesar"-ZA-"$datas"] > "$jam:$menit $tanggal-$bulan-$tahun-decrypted".txt

