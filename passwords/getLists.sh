#!/bin/bash

source=https://github.com/danielmiessler/SecLists/tree/master/Passwords

for list in $(wget $source -q -O - | sed -n 's/.*href="\([^"]*txt\).*/\1/p')
do
    wget "https://github.com$list?raw=true" --directory-prefix=lists --content-disposition
done
