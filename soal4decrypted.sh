for x in modul1/no4/*.txt
do
	echo $x
#mengambil jam dijalankannya command
	waktu=$(echo $x | awk -F / '{print $3}' | awk -F : '{print $1}')
#mengkonvert string ke int
	waktu=$(echo "$waktu" | bc)
	let waktu--

#batas bawah huruf kecil
	atas=$((122-$waktu))
	if [ $atas -gt 122 ]
	then
    	atas=97
	fi
	atas=$(printf \\$(printf '%03o' $atas))
#batas atas huruf kecil
	bawah=$(printf '%d' "'$atas")
	bawah=$(($bawah-1))
	if [ $bawah -lt 97 ]
	then
    	bawah=122
	fi
	bawah=$(printf \\$(printf '%03o' $bawah))

#batas bawah huruf besar
	cacad=$((90-$waktu))
	if [ $cacad -gt 90 ]
	then
    	cacad=65
	fi
	cacad=$(printf \\$(printf '%03o' $cacad))
#batas atas huruf besar
	dash=$(printf '%d' "'$c")
	dash=$(($dash-1))
	if [ $dash -lt 65 ]
	then
    	dash=90
	fi
	dash=$(printf \\$(printf '%03o' $dash))
	y=$(echo $x | awk -F / '{print $3}')
 	cat "$x" | tr [a-z] ["$atas"-za-"$bawah"] | tr [A-Z] ["$cacad"-ZA-"$dash"]  > modul1/"$y"
done
