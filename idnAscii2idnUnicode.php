<?php

$description = "
 Usage: php idnAscii2idnUnicode.php [IDNA_ASCII_DOMAIN]

 Convert domain name from IDNA ASCII to IDNA Unicode.

 Example:

 php idnAscii2idnUnicode.php www.уk.com

 Output:

 www.xn--k-bub.com

";

if (!isset($argv[1])) {
    echo $description;
    exit();
}

echo idn_to_ascii(iconv(mb_detect_encoding($argv[1], mb_detect_order(), true), "UTF-8", $argv[1]));
