<?php

$description = "
 Usage: php idnUnicode2idnAscii.php [IDNA_UNICODE_DOMAIN]

 Convert domain name from IDNA Unicode to IDNA ASCII.

 Example:

 php idnAscii2idnUnicode.php www.xn--k-bub.com

 Output:

 www.уk.com

";

if (!isset($argv[1])) {
    echo $description;
    exit();
}

echo idn_to_utf8($argv[1]);
