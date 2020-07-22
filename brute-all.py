#!/bin/python3

import os
import sys

words=os.listdir("/home/anonybug/Tools/SecLists/Discovery/Web-Content")

for list in words:
	cmd="ffuf -u https://api.nykaa.com/FUZZ -c -t 300 -w ~/Tools/SecLists/Discovery/Web-Content/"+list+" 2>/dev/null"
	os.system(cmd)

