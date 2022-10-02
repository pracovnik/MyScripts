#!/usr/bin/env python3

from datetime import datetime
import cgitb
import os
from datetime import datetime
from datetime import date, timedelta

#folder with file per day
path="/network_history"

def mapFromTo(x,a,b,c,d):
   y=(x-a)/(b-a)*(d-c)+c
   return int(y)



import sqlite3

connection = sqlite3.connect("/network.sqlite3")
DBcursor = connection.cursor()


cgitb.enable()
print("Content-Type: text/html;charset=utf-8")
print("Content-type:text/html\r\n")


macset={}
macset=set()
list_report = []


for datetopast in range(4):
  xdate=datetime.today() - timedelta(days=datetopast)
  filename=path+"/"+xdate.strftime("%Y%m%d")+".csv"
  list_report.clear()
  macset.clear()
  if os.path.isfile(filename):
    print("<b>"+xdate.strftime("%d. %B [ %A ]")+"</B>")
    #open text file
    with open(filename,"r", newline='') as csvfile:
      for line in csvfile:
        inner_list = [elt.strip() for elt in line.split(',')]
        list_report.append(inner_list)
    #collect macs
    for row in list_report:
      macset.add(row[2])
    #make macs nicer
    print("<table border=1>")
    header = "<tr><th>Majitel</th><th>Info</th><th>Meno zariadenia</th>"
    for ii in range(0,24):
      header+="<th>"+str(ii).zfill(2)+"</th>"
    header+="</tr>"
    print(header)

    for macrow in macset:
      DBcursor.execute("SELECT owner,comment,devicename FROM NETWORKDEVICES WHERE macaddress like '"+macrow+"' and inreports like 'y'");
      resul=DBcursor.fetchall()
      if len(resul)==0:
        continue;
      for row in resul:
        print("<tr>")
        if row[0]=='-' :
          print("  <td bgcolor=RED>"+row[0]+"</td>");
        else:
          print("  <td>"+row[0]+"</td>");
        print("  <td><small>"+row[1]+"</small></td>");
        print("  <td><small>"+row[2]+"</small></td>");
      for hour in range(24):
        count=0;
        for row in list_report:
          if row[2] == macrow and row[0]==str(hour).rjust(2, '0') :
            count=count+1
        if count == 0:
          print( "  <td></td>")
        else:
          icolor=255-mapFromTo(count,0,62,20,235)
          xcolor=str(hex(icolor)).replace("0x","").zfill(2)
          print( "  <td bgcolor=FF"+str(xcolor)+str(xcolor)+" >"+str(count)+"</td>")
      print("</tr>")
    print("</table>")
    print("<br>")

DBcursor.close()
