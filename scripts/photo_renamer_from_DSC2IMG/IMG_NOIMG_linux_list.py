#!/usr/bin/python3


import piexif
from PIL import Image
import os
import pathlib
from pathlib import Path
import subprocess

pathXXL=[]
pathXXL.append("/data/Dlhodobe")
pathXXL.append("/data/2023")
pathXXL.append("/data/2024")


for pathOne in pathXXL:
    for pathS in Path(pathOne).rglob('IMG202*.jpg'):
        fullname = str( pathS.absolute() )
        print (fullname)
        directory_name=os.path.basename(os.path.dirname(fullname))
        whole_directory=os.path.dirname(os.path.abspath(fullname))
        file_name=os.path.splitext(fullname)[0]
        file_name=os.path.basename(file_name)
        file_extension=fullname.split(".")[-1]
        newname=file_name.replace("IMG","")
        newname=newname[:8]+"_"+newname[8:]

        print(whole_directory+'/'+newname+".jpg")
        os.rename(fullname,whole_directory+'/'+newname+".jpg")
        print('.')
