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
