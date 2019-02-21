#!/bin/bash

cd Downloads
awk -F , '{if($7 == 2012) i[$1]+=$10} END  {for(x in i) print i[x] "," x}' WA_Sales_Products_2012-14.csv | sort -nr  | head -1 | awk -F , '{print $2}'
awk -F , '{if($7 == 2012 && $1 == "United States") i[$4]+=$10} END  {for(y in i)print i[y] "," y}' WA_Sales_Products_2012-14.csv | sort -nr  | head -3 | awk -F , '{print $2}'
awk -F , '{if($7 == 2012 && $1 == "United States" && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection")) i[$6]+=$10} END  {for(x in i) print i[x] "," x}' WA_Sales_Products_2012-14.csv | sort -nr  | head -3 | awk -F , '{print $2}'

