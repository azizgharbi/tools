<?php

$description = "
 Usage: php unicode-table-generator.php [DECIMAL_NUMBER]

 Generate unicode table.

 Example:

 php unicode-table-generator.php 5

 Output:

 DD H UUUUU
 00 0 &#x0;
 01 1 &#x1;
 02 2 &#x2;
 03 3 &#x3;
 04 4 &#x4;

";

if (!isset($argv[1])) {
    echo $description;
    exit();
}

$dec_number = $argv[1] ?: 0;
$dec_number_length = strlen($dec_number);
$hex_number_length = strlen(dechex($dec_number));

echo implode(" ", [
    str_pad('', $dec_number_length, 'D', STR_PAD_LEFT),
    str_pad('', $hex_number_length, 'H', STR_PAD_LEFT),
    str_pad('', $hex_number_length+4, 'U', STR_PAD_LEFT)
])."\n";

for ($i=0; $i <= $dec_number; $i++) {
    $hex = str_pad(dechex($i), $hex_number_length, '0', STR_PAD_LEFT);

    echo implode(" ", [
        str_pad($i, $dec_number_length, '0', STR_PAD_LEFT),
        $hex,
        html_entity_decode('&#x'.$hex.';', ENT_COMPAT, 'UTF-8')
    ])."\n";
}
