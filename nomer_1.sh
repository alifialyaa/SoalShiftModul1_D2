#!/bin/bash/

no=1

for foto in *.jpg; do
	base64 -d $foto | xxd -r > 'pict'$no'.jpg'
	let no++
done
