<?php

$description = "
 Usage: php idnAscii2idnUnicode.php [IDNA_ASCII_DOMAIN]

 Convert domain name from IDNA ASCII to IDNA Unicode.

 Example:

 php idnAscii2idnUnicode.php www.УК.com

 Output:

 xn--j1ar.com

";

if (!isset($argv[1])) {
    echo $description;
    exit();
}

$input_encoding = mb_detect_encoding($argv[1], mb_detect_order(), true);

$input_utf8 = iconv($input_encoding, "UTF-8", $argv[1]);

echo idn_to_ascii($input_utf8, 0, INTL_IDNA_VARIANT_UTS46);
