#!/usr/bin/python3

import nmap
import socket
import sqlite3
from datetime import datetime
import subprocess

socket.setdefaulttimeout(5)
nm = nmap.PortScanner()
nm.scan(hosts='192.168.2.0/24', arguments='-sP -n -PE --max-parallelism 100')
host_list = nm.all_hosts()

path="/root/network_history"
DBconnection = sqlite3.connect("/root/network.sqlite3")

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
      #Adding to text file
      mixlist+=curDT.strftime("%H,%M")+","+xaddress+"\n"
      #adding to sql

      #Test if device is already in known
      queryX="select * from NETWORKDEVICES where macaddress='"+xaddress+"' ; "
      xxx=DBconnection.cursor()
      xxx.execute(queryX)
      results = xxx.fetchall()
      if len(results)==0:
        query1="insert into NETWORKDEVICES (macaddress , lastseen , devicename, inreports ) VALUES (\""+xaddress+"\" , CURRENT_TIMESTAMP , \""+xname+"\" ,\"y\" ) ; "
        DBconnection.execute(query1)
        subprocess.call(["bash","/root/scripts/phonepushnotification.sh", "New MAC "+xaddress,"Name: "+xname])
        #Push notification to phone
      
      query2="update NETWORKDEVICES set lastseen=CURRENT_TIMESTAMP where macaddress=\""+xaddress+"\" ; "
      DBconnection.execute(query2)
      DBconnection.commit()
  #Write to history of encouters via for cycle
  file.write(mixlist)

DBconnection.close()
