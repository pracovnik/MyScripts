#!/usr/bin/python3

import time
import urllib.request
import os
import sys
import glob
import os.path
import csv
from pathlib import Path
from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw
from PIL import ImageFilter

timestring = time.strftime("%Y%m%d-%H%M%S")
tempfolder='/opt/octoprint/timelapse/.temporary'
cameralist = '/opt/octoprint/scripts/cameracsv'

def picturepath(url,timer):
   return tempfolder+"/"+xURL.replace(":",'-').split('/')[2]+"/"+timer+".jpg"

def makefolder(url):
   Path(tempfolder+"/"+url.replace(":",'-').split('/')[2]).mkdir(parents=True, exist_ok=True)


with open(cameralist, 'r') as file:
   csvreader = csv.reader(file)
   for line in csvreader:
      xURL = line[0].strip()
      if "url" in xURL :
         continue
      print(xURL)
      makefolder(xURL)
      urllib.request.urlretrieve(xURL,picturepath(xURL,timestring))
      rotateimage=int(line[1])
      xsize=int(line[2])
      ysize=int(line[3])
      imgimport=Image.open(picturepath(xURL,timestring))
      if rotateimage !=0:
         imgimport=imgimport.rotate(rotateimage,expand=True)
      imgimport.thumbnail((xsize,ysize))
      imgimport.save(picturepath(xURL,timestring))
      print("Picture done: "+xURL)


print("Composite start")
makefolder("http://composite")
compositeimage = Image.new(mode="RGB", size=(1280, 960),color = (0,0,0))

with open(cameralist, 'r') as file:
   csvreader = csv.reader(file)
   for line in csvreader:
      xURL = line[0].strip()
      if "url" in xURL :
         continue
      print(xURL)
      imgimport=Image.open(picturepath(xURL,timestring))
      print(imgimport.size)
      ycordinates=int(line[5])
      xcordinates=int(line[4])
      compositeimage.paste(imgimport,(xcordinates,ycordinates))


print("Composite done")
compositeimage.save(picturepath("http://composite",timestring), quality=95)
compositeimage.save(tempfolder+"/composite/"+timestring+".jpg", quality=95)

print("Octoprint saving path")

try:
   if not os.path.exists(sys.argv[4]):
      os.makedirs(sys.argv[4])
   compositeimage.save(sys.argv[6], quality=95)
except:
   print("No octolapse saving path as missing arguments")
