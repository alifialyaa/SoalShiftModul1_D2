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
   ~ Kendala: crontab tidak berjalan
