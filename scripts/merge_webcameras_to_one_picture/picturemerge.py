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
tempfolder='/ssd/octoprint/timelapse/.temporary'
cameralist = '/ssd/octoprint/scripts/cameracsv'
Path(tempfolder).mkdir(parents=True, exist_ok=True)
Path(tempfolder+"/composite").mkdir(parents=True, exist_ok=True)


#To make same form of name per file
def photofile(theurl):
   return tempfolder+"/"+theurl.replace(":",'-').split('/')[2]+"/"+timestring+".jpg"


#After all photoes are made, we merge them.
def mergeofpictures(cameralistfile):
   print("start composite")
   compositeimage = Image.new(mode="RGB", size=(1280, 960),color = (0,0,0))
   with open(cameralistfile, 'r') as file:
      csvreader = csv.reader(file)
      for line in csvreader:
         xURL = line[0].strip()
         if "url" in xURL :
            continue
         if not os.path.exists(photofile(xURL)):
            continue
         imgimport=Image.open(photofile(xURL))
         print(imgimport.size)
         ycordinates=int(line[5])
         xcordinates=int(line[4])
         compositeimage.paste(imgimport,(xcordinates,ycordinates))

   compositeimage.save(picturefile("http://composite"), quality=95)
   try:
      if not os.path.exists(sys.argv[4]):
         os.makedirs(sys.argv[4])
      compositeimage.save(sys.argv[6], quality=95)
   except:
      print("No octolapse saving path")

#Make a photo
def OnePhoto(oneline):
   print("start "+oneline)
   xURL = oneline.split(",")[0]
   print(xURL)
   picturefile=tempfolder+"/"+(xURL.replace(":",'-')).split('/')[2]
   Path(picturefile).mkdir(parents=True, exist_ok=True)
   urllib.request.urlretrieve(xURL,photofile(xURL))
   rotateimage=int(oneline.split(",")[1])
   xsize=int(oneline.split(",")[2])
   ysize=int(oneline.split(",")[3])
   imgimport=Image.open(photofile(xURL))
   if rotateimage !=0:
      imgimport=imgimport.rotate(rotateimage,expand=True)
   imgimport.thumbnail((xsize,ysize))
   imgimport.save(photofile(xURL))

def beginner():
   Path(tempfolder).mkdir(parents=True, exist_ok=True)
   Path(tempfolder+"/composite").mkdir(parents=True, exist_ok=True)
   print ("start prepare")

def photoes():
   print ("start photoes")

if __name__ == '__main__':
   beginner
   with open(cameralist, 'r') as file:
      for line in file.readlines():
         print(line)
         if "url" in line:
            continue
         OnePhoto(str(line) )

   photoes
   mergeofpictures
