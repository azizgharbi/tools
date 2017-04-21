#!/usr/bin/env python

import sys
import binascii

try:
    filePath = sys.argv[1]
except IndexError as e:
    print '\nError: missing file path arg\n'
    sys.exit()

try:
    f = open(filePath, "r")  
except IOError as e:
    print "\nI/O error({0}): {1} \n".format(e.errno, e.strerror)
    sys.exit()

try:
    eof = False
    while not eof:
        hex_string = f.read().replace('\n', '')
        binary_string = binascii.unhexlify(hex_string)
        if hex_string:
            print binary_string            
        else:
            eof = True
finally:
    f.close()
