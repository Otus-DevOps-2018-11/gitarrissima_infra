#!/usr/bin/python

import sys

if sys.argv[1] == '--list':
    with open("./inventory.json", 'r') as f:
        print f.read()

else:
    print "{}"
