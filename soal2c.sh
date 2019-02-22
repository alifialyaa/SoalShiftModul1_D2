awk -F"," '{if ($4 == "Mountaineering Equipment" || $4 == "Camping Equipment" || $4 == "Personal Accessories" ) arr[$6] += $10 } END { for ( i in arr ) { print arr[i], i } }' WA_Sales_Products_2012-14.csv | sort -n | tail -n3 > laporan2_c.csv

