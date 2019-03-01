#!/usr/bin/awk

awk -F"," '{if ($7 == 2012 && $1 == "United States") arr[$4] += $10 } END { for ( i in arr ) { print arr[i], i } }' WA_Sales_Products_2012-14.csv | sort -n | tail -n3 > laporan2_b.csv


