#!/usr/bin/env python

import sys
import binascii

try:
    filePath = sys.argv[1]
except IndexError as e:
    print '\nError: missing file path arg\n'
    sys.exit()

try:
    f = open(filePath, "rb")  
except IOError as e:
    print "\nI/O error({0}): {1} \n".format(e.errno, e.strerror)
    sys.exit()

try:
    eof = False
    while not eof:
        binary_string = f.read(2**4) # 16 Bytes
        if binary_string:
            print binascii.hexlify(binary_string)
        else:
            eof = True
finally:
    f.close()
