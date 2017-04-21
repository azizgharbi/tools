#!/usr/bin/env python

import sys
import os

import binascii
import time

start_time = time.time()

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

byteRead = 0;

try:
    eof = False
    
    while eof is not True:

        byte = f.read(2**4) # 16 Bytes
    
        byteRead += len(byte)

        print binascii.hexlify(byte)

        if byte == "":
            eof = True

finally:
    f.close()

print "SIZE:  %d Byte(s)" % ( os.path.getsize(filePath) )
print "READ: %d Byte(s)\n" % ( byteRead )

print "EXECUTION TIME %.3f second(s)\n" % round(time.time()-start_time, 3)
