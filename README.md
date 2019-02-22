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
       14 14 14 2 * /bin/bash/ /Home/ALIFI/SISOP/Soal/nature/nomer_1.sh
       14 14 * 2 5 /bin/bash/ /Home/ALIFI/SISOP/Soal/nature/nomer_1.sh
       ```
   - Kendala: crontab tidak berjalan
2.	Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file 		WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:
	a.	Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
	b.	Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
	c.	Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada 			soal poin b.
Langkah-langkah: 
a. Dengan menggunakan awk, masukan command seperti berikut.
```
awk -F"," '{if ($7 == 2012) arr[$1] += $10 } END { for ( i in arr ) { print arr[i], i } }' WA_Sales_Products_2012-14.csv | sort -n | tail -n-1 > laporan2_a.csv

```
Penjelasan:
if($7 == 2017) arr[$1] += $10 : jika dalam kolom "year" data tersebut berisi 2012, maka kolom pertama atau kolom "Retailer country" akan menjadi parameter dari sebuah array yang berisi penjumlahan data "Quantity" yang berada pada kolom ke-10.
for (i in arr) {print arr[i], i}}: menyatakan kondisi tertentu dalam array 'arr', akan terjadi loop. jika terdapat nama Retailer Country dalam index array tersebut maka penjumlahan "Quantity" dan nama dari "Retailer country" tersebut akan ditampilkan
WA_Sales_Products_2012-14.csv : File yang akan dibaca
sort -n : mengurutkan secara numerik 
tail -n -1 : menampilkan satu data
> laporan2_a.csv : output aka dimasukan ke dalam file laporan2_a.csv

b. Dengan menggunakan awk, masukan command seperti berikut.
```
awk -F"," '{if ($1 == "United States") arr[$4] += $10 } END { for ( i in arr ) { print arr[i], i } }' WA_Sales_Products_2012-14.csv | sort -n | tail -n3 > laporan2_b.csv

```
Penjelasan:
{if ($1 == "United States") arr[$4] += $10 : jika dalam kolom "Retailer Country" data tersebut berisi United States, maka kolom ke-empat atau kolom "Product line" akan menjadi index dari sebuah array yang berisi penjumlahan data "Quantity" yang berada pada kolom ke-10.
for (i in arr) {print arr[i], i}}: menyatakan kondisi tertentu dalam array 'arr', akan terjadi loop. jika terdapat nama Product line dalam index array tersebut maka penjumlahan "Quantity" dan nama dari "Product line" tersebut akan ditampilkan
WA_Sales_Products_2012-14.csv : File yang akan dibaca
sort -n : mengurutkan secara numerik 
tail -n3 : menampilkan tiga data
> laporan2_a.csv : output aka dimasukan ke dalam file laporan2_b.csv

c. Dengan menggunakan awk, masukan command seperti berikut.
```
awk -F"," '{if ($4 == "Mountaineering Equipment" || $4 == "Camping Equipment" || $4 == "Personal Accessories" ) arr[$6] += $10 } END { for ( i in arr ) { print arr[i], i } }' WA_Sales_Products_2012-14.csv | sort -n | tail -n3 > laporan2_c.csv
```
Penjelasan:
if ($4 == "Mountaineering Equipment" || $4 == "Camping Equipment" || $4 == "Personal Accessories"  : jika dalam kolom "Product Line" data tersebut berisi Mountaineering Equipment, Camping Equipment, atau Personal Accessories , maka kolom ke-enam atau kolom "Product" akan menjadi index dari sebuah array yang berisi penjumlahan data "Quantity" yang berada pada kolom ke-10.
for (i in arr) {print arr[i], i}}: menyatakan kondisi tertentu dalam array 'arr', akan terjadi loop. jika terdapat nama Product dalam index array tersebut maka penjumlahan "Quantity" dan nama dari "Product" tersebut akan ditampilkan
WA_Sales_Products_2012-14.csv : File yang akan dibaca
sort -n : mengurutkan secara numerik 
tail -n3 : menampilkan tiga data
> laporan2_a.csv : output aka dimasukan ke dalam file laporan2_c.csv

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

