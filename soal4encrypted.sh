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
bawah=$(printf \\$(printf '%03o' $bawah))

#batas bawah A ke huruf lain decimal ascii
besar=$(($waktu+65))
besar=$(printf \\$(printf '%03o' $besar))
#batas atas Z ke huruf lain ascii decimal ascii
atas=$(printf '%d' "'$besar")
let atas--
atas=$(printf \\$(printf '%03o' $atas))

jam=`date "+%X" | awk -F: '{print $1}'`
menit=`date "+%X" | awk -F: '{print $2}'`
tanggal=`date | awk '{print $3}'`
bulan=`date | awk '{print $2}'`
tahun=`date | awk '{print $6}'`

# save
cat /var/log/syslog | tr [a-z] ["$kecil"-za-"$bawah"] | tr [A-Z] ["$besar"-ZA-"$atas"] > modul1/no4/"$jam:$menit $tanggal-$bulan-$tahun".txt

