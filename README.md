# SoalShift_modul1_A09

Jawaban Praktikum Sistem Operasi Modul 1

1. Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari. Hint: Base64, Hexdump

<h3>Jawab : </h3>
  
[Source Code](https://github.com/idlavoNuyaB/SoalShift_modul1_A09/blob/master/soal1.sh)

<h3>Langkahnya : </h3>
    
a. buat scriptnya untuk mendecrypt

    cd Downloads -> untuk berpindah ke downloads
  
    unzip nature.zip -> untuk mengekstrak nature.zip ke folder nature

    base64 -d -> decode tiap file di folder nature

    xxd -r -> hexdump reverse tiap file di folder nature

b. buat crontabnya

    14 14 14 2 * /bin/bash /home/arvanna/soal1.sh

    14 14 * 2 Fri /bin/bash /home/arvanna/soal1.sh

2. Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:

    a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.

    b. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.

    c. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.

<h3>Jawab : </h3>
  
[Source Code](https://github.com/idlavoNuyaB/SoalShift_modul1_A09/blob/master/soal2.sh)

<h3>Langkahnya : </h3>

a. Mencari negara dengan penjualan terbanyak pada tahun 2012

    awk -F , '{if($7 == 2012) i[$1]+=$10} END {for(x in i) print i[x] "," x}' WA_Sales_Products_2012-14.csv | sort -nr  | head -1 | awk -F , '{print $2}'

**Keterangan : **
 
* {if($7 == 2012) i[$1]+=$10} digunakan untuk menghitung kolom 10 berdasarkan jumlahnya menurut indeks negaranya

* {for(x in i) print i[x] "," x} digunakan untuk mencetak jumlah dari kolom 10 dan negaranya dibatasi dengan koma

* sort -nr digunakan untuk mengurutkan dari besar ke kecil

* head -1 digunakan untuk menampilkan data yang paling atas

* awk -F , '{print $2}' digunakan untuk hanya mencetak bagian kedua yang merupakan negara

b. Mencari tiga *product line* yang memberikan jumlah terbanyak menurut poin a

    awk -F , '{if($7 == 2012 && $1 == "United States") i[$4]+=$10} END  {for(y in i)print i[y] "," y}' WA_Sales_Products_2012-14.csv | sort -nr  | head -3 | awk -F , '{print $2}'

**Keterangan :**

Perbedaan antara poin a dengan b terletak pada 

* syaratnya ditambah dengan negara yang memberikan jumlah terbanyak, yaitu United States

* indeks yang digunakan untuk menghitung kolom 10 sekarang berdasarkan product line

c. Mencari tiga *product* yang memberikan jumlah terbanyak menurut poin b

    awk -F , '{if($7 == 2012 && $1 == "United States" && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) i[$6]+=$10} END  {for(x in i) print i[x] "," x}' WA_Sales_Products_2012-14.csv | sort -nr  | head -3 | awk -F , '{print $2}'
    
**Keterangan :**

Perbedaan antara poin b dan c terletak pada

* syaratnya ditambah dengan product line yang memberikan jumlah terbanyak, yaitu *Personal Accesories*, *Camping Equipment* dan *Outdoor Protection*.

* indeks yang digunakan untuk menghitung kolom sekarang berdasarkan *product*

3. Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:

    a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt

    b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.

    c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.

    d. Password yang dihasilkan tidak boleh sama.

<h3>Jawab : </h3>
  
[Source Code](https://github.com/idlavoNuyaB/SoalShift_modul1_A09/blob/master/soal3.sh)

<h3>Langkahnya : </h3>

* awal-awal pastikan sudah terinstall pwgen, jika belum lakukan apt-get install pwgen

* lakukan inisialisasi variabel a='password' , b=1 , x= 1, var='a' dan value='b'

* lakukan while [ -e $a$b.txt ] untuk mencheck apakah file password’b’.txt ada atau tidak

* lakukan b=$((b+1)) jika sudah ada b++ untuk membuat file baru yang nama beda

* lakukan while [ $x -ne $b -a $b -ne 1 ] sebagai fungsi loop untuk mencheck apakah file lama ada yang sama atau tidak 

* if [ -e $a$b.txt ] digunakan untuk memasukkan isi file ke variable untuk dibandingkan 1 1

* if [ "$var" != "$value" ] -> jika isi file tidak sama maka lanjut dibandingkan dengan index lainnya

* elif [ "$var" == "$value" ] -> jika isi file sama, kita generate ulang passwordnya dan dicek lagi

* pwgen 12 1 -c -n -s > $a$b.txt -> untuk menggenerate password

* pwgen 12 1 -c -n -s > $a$b.txt -> untuk menggenerate password untuk file paling baru

* while [ $c -ne $b -a $b -ne 1 ] -> digunakan untuk mencheck apakah file yang baru sama atau tidak dengan yang lain

* if [ "$var" != "$value" ] -> jika tidak sama lanjut sampai index check terakhir

* elif [ "$var" == "$value" ] -> jika sama akan menggenerate password baru

4.Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal- bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:

   a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.

   b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya.

   c. setelah huruf z akan kembali ke huruf a

   d. Backup file syslog setiap jam.

   e. dan buatkan juga bash script untuk dekripsinya.

<h3>Jawab : </h3>
  
[Source Code](https://github.com/idlavoNuyaB/SoalShift_modul1_A09/blob/master/soal4.sh)

<h3>Langkahnya : </h3>

* Backup dan Enkripsi

  * waktu=$(date "+%X" | awk -F : '{print $1}') digunakan untuk mengambil jamnya

  * waktu=$(echo "$waktu" | bc) digunakan untuk mengkonversikan string jam menjadi integer

  * Mencari batas bawah dan atas huruf kecil dari 97 - 122
    
    * kecil=$(printf \\$(printf '%03o' $kecil)) digunakan untuk mengubah nilai desimal ke ASCII karakter batas bawah

    * bawah=$(printf '%d' "'$kecil") digunakan untuk mengubah karakter ASCII ke nilai desimal berdasarkan variabel kecil
    
    * bawah=$(printf \\$(printf '%03o' $bawah)) mengembalikan ke karakter ASCII batas atas
  
  * Mencari batas bawah dan atas huruf besar 65 -90

    * besar=$(printf \\$(printf '%03o' $besar)) digunakan untuk mengubah nilai desimal ke ASCII karakter batas bawah

    * atas=$(printf '%d' "'$besar") digunakan untuk mengubah karakter ASCII ke nilai desimal berdasarkan variabel kecil
    
    * atas=$(printf \\$(printf '%03o' $atas)) mengembalikan ke karakter ASCII batas atas
  
  * Mencari format save dalam waktu jam:menit tanggal-bulan-tahun
  
    * jam=`date "+%X" | awk -F: '{print $1}'` digunakan untuk mencari jam
    
    * menit=`date "+%X" | awk -F: '{print $2}'` digunakan untuk mencari menit
    
    * tanggal=`date | awk '{print $3}'` digunakan untuk mencari tanggal
    
    * bulan=`date | awk '{print $2}'` digunakan untuk mencari bulan
    
    * tahun=`date | awk '{print $6}'` digunakan untuk mencari tahun
    
  * cat /var/log/syslog | tr [a-z] ["$kecil"-za-"$bawah"] | tr [A-Z] ["$besar"-ZA-"$atas"] > "$jam:$menit 
  
    $tanggal-$bulan-$tahun".txt digunakan untuk menyimpan file dan mengenkripsi file tersebut
 
* Dekripsi
  
  * Mencari batas atas dan bawah huruf kecil dari 97 - 122
  
    * dkecil=$(printf \\$(printf '%03o' $dkecil)) digunakan untuk mengubah nilai desimal ke karakter ASCII

    * dbawah=$(printf '%d' "'$dkecil") digunakan untuk mengubah karakter ASCII ke nilai desimal dari variabel dkecil
    
    * dbawah=$(printf \\$(printf '%03o' $dbawah)) digunakan untuk mengubah nilai desimal ke karakter ASCII
    
  * Mencari batas atas dan bawah huruf besar dari 65 - 90
  
    * cbesar=$(printf \\$(printf '%03o' $cbesar)) digunakan untuk mengubah nilai desimal ke ASCII karakter batas bawah

    * datas=$(printf '%d' "'$cbesar") digunakan untuk mengubah karakter ASCII ke nilai desimal berdasarkan variabel kecil
    
    * datas=$(printf \\$(printf '%03o' $datas)) mengembalikan ke karakter ASCII batas atas

  * cat "$jam:$menit $tanggal-$bulan-$tahun".txt | tr [a-z] ["$dkecil"-za-"$dbawah"] | tr [A-Z] ["$cbesar"-ZA-"$datas"] > 
  
    "$jam:$menit $tanggal-$bulan-$tahun-decrypted".txt digunakan untuk menyimpan file dan mendekripsi dari file enkripsi
   
* Crontabnya

      @hourly /bin/bash /home/arvanna/soal4.sh
    
5. Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:

    a. Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.

    b. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.

    c. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.

    d. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.

<h3>Jawab : </h3>
  
[Source Code](https://github.com/idlavoNuyaB/SoalShift_modul1_A09/blob/master/soal5.sh)

<h3>Langkahnya : </h3>

* Memfilter menggunakan awk dengan 

  * tolower($0) ~ yang digunakan untuk melowercasekan karakter
  
  * /cron/ , /!sudo/ digunakan untuk mengecek jika ada kata cron dan tidak ada kata sudo
  
  * NF < 13 digunakan untuk mengecek jumlah kata jika kurang dari 13 maka tidak di print
  
* Crontabnya

      2-30/6 * * * * /bin/bash /home/arvanna/soal5.sh

