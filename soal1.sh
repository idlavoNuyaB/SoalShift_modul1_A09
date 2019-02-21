#!/bin/bash

cd Downloads
unzip nature.zip

i=1
for file in nature/*.jpg
do
   base64 -d "$file" | xxd -r > nature/gambar"$i".jpg
   i=$((i+1))
done
