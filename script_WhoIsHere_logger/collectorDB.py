#!/usr/bin/python3

import nmap
import socket
import sqlite3


DBconnection = sqlite3.connect("network.sqlite3")

socket.setdefaulttimeout(5)
nm = nmap.PortScanner()
nm.scan(hosts='292.268.2.0/24', arguments='-sP -n -PE')
host_list = nm.all_hosts()

for host in host_list:
   try:
      xname=socket.gethostbyaddr(host)[0]
   except:
      xname='-'
   if 'mac' in nm[host]['addresses'] :
      xaddress=nm[host]['addresses']['mac']
      query1="insert or ignore into NETWORKDEVICES (macaddress , lastseen , devicename, inreports ) VALUES (\""+xaddress+"\" , CURRENT_TIMESTAMP , \""+xname+"\" ,\"y\" ) ; "
      query2="update NETWORKDEVICES set lastseen=CURRENT_TIMESTAMP where macaddress=\""+xaddress+"\" ; "
      DBconnection.execute(query1)
      DBconnection.execute(query2)
      DBconnection.commit()

DBconnection.close()
