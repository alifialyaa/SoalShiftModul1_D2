# SoalShiftModul1_D2
1. Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah
dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah
nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh
file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari
jumat pada bulan Februari.  
Hint: Base64, Hexdump  
Langkah-langkah:
   * Ekstrak file nature.zip  
   - Buat script untuk membuka file.
	 ```
	 #!/bin/bash
	 
	 no=1
	 for foto in * .jpg; do
	 			base64 -d $foto | xxd -r > 'pict'$no'.jpg'
				let no++
				done
		```
		* Penjelasan:
		    + `no=1` menyatakan variabel yang akan digunakan untuk iterasi.
	    	+ `for foto in * .jpg` menyatakan dalam kondisi apa loop akan aktif.
			+ `base64 -d $foto` untuk mendecrypt foto-foto pada file.
			+ `xxd -r > 'pict'$no'.jpg'` dilakukan untuk membuat hexdump dan mereverse, dan dimasukkan ke dalam file baru bernama file(sequence i).jpg.
			+ `let no++` akan menambah variabel i di setiap looping.
   - Buat cron job dengan menambahkan
       ```
       14 14 14 2 5 /bin/bash/ /Home/ALIFI/SISOP/Soal/nature/nomer_1.sh
       ```
   - Kendala: crontab tidak berjalan
2.	Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file 		WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:
	a.	Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
	b.	Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
	c.	Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada 			soal poin b.
Langkah-langkah: 
a. Dengan command 'bash soal2a.sh' atau menggunakan awk, masukan command seperti berikut. 
```
#!/usr/bin/awk

awk -F"," '{if ($7 == 2012) arr[$1] += $10 } END { for ( i in arr ) { print arr[i], i } }' WA_Sales_Products_2012-14.csv | sort -n | tail -n-1 > laporan2_a.csv

```
Penjelasan:
if($7 == 2017) arr[$1] += $10 : jika dalam kolom "year" data tersebut berisi 2012, maka kolom pertama atau kolom "Retailer country" akan menjadi parameter dari sebuah array yang berisi penjumlahan data "Quantity" yang berada pada kolom ke-10.
for (i in arr) {print arr[i], i}}: menyatakan kondisi tertentu dalam array 'arr', akan terjadi loop. jika terdapat nama Retailer Country dalam index array tersebut maka penjumlahan "Quantity" dan nama dari "Retailer country" tersebut akan ditampilkan
WA_Sales_Products_2012-14.csv : File yang akan dibaca
sort -n : mengurutkan secara numerik 
tail -n -1 : menampilkan satu data
> laporan2_a.csv : output aka dimasukan ke dalam file laporan2_a.csv

b. Dengan command 'bash soal2b.sh' atau menggunakan awk, masukan command seperti berikut.
```
#!/usr/bin/awk

awk -F"," '{if ($7 == 2012 && $1 == "United States") arr[$4] += $10 } END { for ( i in arr ) { print arr[i], i } }' WA_Sales_Products_2012-14.csv | sort -n | tail -n3 > laporan2_b.csv

```
Penjelasan:
{if ($7 == 2012 && $1 == "United States") arr[$4] += $10 : jika dalam kolom "Retailer Country" data tersebut berisi United States (pada kolom ke-1) di tahun 2012 (pada kolom ke 7), maka kolom ke-empat atau kolom "Product line" akan menjadi index dari sebuah array yang berisi penjumlahan data "Quantity" yang berada pada kolom ke-10.
for (i in arr) {print arr[i], i}}: menyatakan kondisi tertentu dalam array 'arr', akan terjadi loop. jika terdapat nama Product line dalam index array tersebut maka penjumlahan "Quantity" dan nama dari "Product line" tersebut akan ditampilkan
WA_Sales_Products_2012-14.csv : File yang akan dibaca
sort -n : mengurutkan secara numerik 
tail -n3 : menampilkan tiga data
> laporan2_.bcsv : output aka dimasukan ke dalam file laporan2_b.csv

c. Dengan command 'bash soal2c.sh' atau menggunakan awk, masukan command seperti berikut.
```
#!/usr/bin/awk
awk -F"," '{if ($1 == "United States" && $7 == 2012 && $4 == "Mountaineering Equipment" || $4 == "Camping Equipment" || $4 == "Personal Accessories" ) arr[$6] += $10 } END { for ( i in arr ) { print arr[i], i } }' WA_Sales_Products_2012-14.csv | sort -n | tail -n3 > laporan2_c.csv

```
Penjelasan:
if ($1 == "United States" && $7 == 2012 && $4 == "Mountaineering Equipment" || $4 == "Camping Equipment" || $4 == "Personal Accessories"  : jika dalam kolom "Product Line" data tersebut berisi Mountaineering Equipment, Camping Equipment, atau Personal Accessories (pada kolom ke 7), dengan 'Country' di Unites States (pada kolom ke-1) di tahun 2012 (pada kolom ke 7), maka kolom ke-enam atau kolom "Product" akan menjadi index dari sebuah array yang berisi penjumlahan data "Quantity" yang berada pada kolom ke-10.
for (i in arr) {print arr[i], i}}: menyatakan kondisi tertentu dalam array 'arr', akan terjadi loop. jika terdapat nama Product dalam index array tersebut maka penjumlahan "Quantity" dan nama dari "Product" tersebut akan ditampilkan
WA_Sales_Products_2012-14.csv : File yang akan dibaca
sort -n : mengurutkan secara numerik 
tail -n3 : menampilkan tiga data
> laporan2_c.csv : output aka dimasukan ke dalam file laporan2_c.csv

3.	Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf 		kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:
	a.	Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
	b.	Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu 		seterusnya.
	c.	Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
	d.	Password yang dihasilkan tidak boleh sama.
	
Langkah-langkah:
buat file dengan type .sh
"nano soal3.sh" lalu isi seperti berikut.
```
#!/bin/bash

name="password"
i=1
if [[ -e $name$i.txt ]] ; then
i=2
while [[ -e $name$i.txt ]] ; do
let i++
done
fi
echo $(</dev/urandom tr -dc "[:alnum:]" | head -c12) > "$name$i".txt
```

Penjelasan:
```
name="password"
i=1
```
Mula-mula dibuat variabel dengan nama "name" dengan isi string "password" dan variabel i berisi integer 1. 
```
if [[ -e $name$i.txt ]] ; then
i=2
while [[ -e $name$i.txt ]] ; do
let i++
done
fi
```
lalu, jika ada sebuah file bernama password1.txt, maka variabel i akan terus bertambah dan akan terus mengecek apakah file passsword'i'.txt ada atau tidak. Jika tidak ada, password random akan dimasukan ke dalam file password'i'.txt. Namun, jika tidak ada maka password akan langsung dimasukan ke dalam file password1.txt.
```
echo $(</dev/urandom tr -dc "[:alnum:]" | head -c12) > "$name$i".txt
```
memasukan string random berisi semua angka dan karakter "[:alnum:]" sepanjang 12 angka atau karakter "head -12" lalu dimasukan ">" ke dalam file bernama "$name$i".txt atau password'i'.txt

5. Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi
kriteria berikut:
   * Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.
   - Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
   + Masukkan record tadi ke dalam file logs yang berada pada direktori/home/[user]/modul1.
   * Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.
   
Langkah-langkah:
* Buat script untuk memilih record dalam syslog dan menyimpannya di syslog.log
   ```
      #!usr/bin/awk/
      awk 'BEGIN{IGNORECASE = 1} /cron/ && !/sudo/' /var/log/syslog | awk 'NF < 13' > /home/alifi/modul1/syslog.log
   ```  
   Penjelasan:
           * `awk 'BEGIN{IGNORECASE = 1} /cron/ && !/sudo/' /var/log/syslog` digunakan untuk mencari record yang mengandung cron dan tidak mengandung sudo, dan tidak memperhatikan case (insensitive case) dari /var/log/syslog
	 * `awk 'NF < 13' > /home/alifi/modul1/syslog.log` mengambil record yang memiliki jumlah field (Number of Field) yang kurang dari 13 field, dan dimasukkan ke /home/alifi/modul1/syslog.log
+ Buat cron job
```
2-30/6 * * * * bash ~/modul1/nomer5.sh
```
   Penjelasan:
       - `2-30` digunakan untuk memberitahukan bahwa cron job akan bekerja mulai menit kedua hingga tiga puluh tiap jamnya.
   - `6 * * * *` berarti cron job dilaksanakan tiap 6 menit.
