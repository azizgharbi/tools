#!/bin/bash

# Merge, remove short less than 8 chars, remove dublicated, save clean list

cat lists/*.txt | sed -r '/.{8,}/!d' | sort | uniq -u > list.txt
