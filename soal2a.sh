awk -F"," '{if ($7 == 2012) arr[$1] += $10 } END { for ( i in arr ) { print arr[i], i } }' WA_Sales_Products_2012-14.csv | sort -n | tail -n-1 > laporan2_a.csv

