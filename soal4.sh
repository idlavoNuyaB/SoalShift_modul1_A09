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
cat /var/log/syslog | tr [a-z] ["$kecil"-za-"$bawah"] | tr [A-Z] ["$besar"-ZA-"$atas"] > "$jam:$menit $tanggal-$bulan-$tahun".txt


#decrypt
let waktu--
#batas bawah huruf kecil decimal ascii
dkecil=$((122-$waktu))
dkecil=$(printf \\$(printf '%03o' $dkecil))
#batas atas huruf kecil ascii decimal ascii
dbawah=$(printf '%d' "'$dkecil")
let dbawah--
dbawah=$(printf \\$(printf '%03o' $dbawah))

#batas bawah huruf besar decimal ascii
cbesar=$((90-$waktu))
cbesar=$(printf \\$(printf '%03o' $cbesar))
#batas atas huruf besar ascii decimal ascii
datas=$(printf '%d' "'$cbesar")
let datas--
datas=$(printf \\$(printf '%03o' $datas))

cat "$jam:$menit $tanggal-$bulan-$tahun".txt | tr [a-z] ["$dkecil"-za-"$dbawah"] | tr [A-Z] ["$cbesar"-ZA-"$datas"] > "$jam:$menit $tanggal-$bulan-$tahun-decrypted".txt

