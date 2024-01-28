#!/usr/bin/python3

import sys
import subprocess
import os

proc = subprocess.Popen("nmap -p21,22,23,80,443,445,1433,3306,3389,8080 -sV 192.168.1.*  --osscan-guess ",stdout=subprocess.PIPE, shell=True)
proc.wait()
(output, err) = proc.communicate()

output=str(output).replace("b'\\n"," ").replace("\\n","\n")

for tas in output.split('\n'):
        if ("Nmap scan report for " in tas):
                print ('\033[34m'+"\n------------------------------------------------")
                print ('\33[96m' + tas.partition("for")[2])
        elif ("open" in tas):
                print ('\033[32m' + tas[:80])
        elif ("Service Info" in tas):
                print ('\033[90m' + tas[:80])

print ('\033[37m'+"\n###################################################")
input ("press any key")
