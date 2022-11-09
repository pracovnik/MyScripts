#!/usr/bin/python3

import nmap
import socket
import sqlite3
from datetime import datetime


socket.setdefaulttimeout(5)
nm = nmap.PortScanner()
nm.scan(hosts='292.268.2.0/22', arguments='-sP -n -PE')
host_list = nm.all_hosts()

path="/network_history"
curDT = datetime.now()

mixlist=""
with open(path+"/"+curDT.strftime("%Y%m%d")+".csv","a") as file:
  for host in host_list:
    try:
      xname=socket.gethostbyaddr(host)[0]
    except:
      xname='-'
    if 'mac' in nm[host]['addresses'] :
      xaddress=nm[host]['addresses']['mac']
      mixlist+=curDT.strftime("%H,%M")+","+xaddress+"\n"
#      file.write(curDT.strftime("%Y,%m,%d,%H,%M")+","+xaddress+"\n")
  file.write(mixlist)
