#!/usr/bin/python3


import piexif
from PIL import Image
import os
import pathlib
from pathlib import Path
import subprocess

pathx="/data/Fotky/2022"

for pathS in Path(pathx).rglob('DSC_*.JPG'):
    fullname = str( pathS.absolute() )
    print (fullname)
    directory_name=os.path.basename(os.path.dirname(fullname))
    whole_directory=os.path.dirname(os.path.abspath(fullname))
    file_name=os.path.splitext(fullname)[0]
    file_name=os.path.basename(file_name)
    file_extension=fullname.split(".")[-1]
    #meno zacina spravne
    if not file_name.startswith("DSC_") :
        print("ERROR nema spravny format nazvu")
        print("ERROR "+fullname)
        print("ERROR "+file_name)
        exit;
    #meno suboru je dost dlhe na overenie
    if len(file_name) < 8 :
        print("ERROR short name")
        print("ERROR "+fullname)
        print("ERROR "+file_name)
        exit;
    #odstranit vlozeny string DSC, ktore ma nezaujima
    maxfilenamechar="DSC_"
    for charX in file_name.replace("DSC_",""):
        if charX in "1234567890.-_":
            maxfilenamechar+=charX
        else:
            break
    #print(maxfilenamechar)
    file_name=file_name[(len(maxfilenamechar)):]
    #print(file_name)


    #odstranit cisla ak su v nazve, ktore ma nezaujima
    maxdirchar=""
    for charX in directory_name:
        if charX in "1234567890.-_":
            maxdirchar+=charX
        else:
            break
    #print(maxdirchar)
    directory_name=directory_name[(len(maxdirchar)):]
    #print(directory_name)

     #vybereme ktore meno pouzijeme
    if (len(file_name) > 4 ) :
        add_name=file_name
    else :
        add_name=directory_name


    imageX = Image.open(fullname)
    exif_dict = piexif.load(imageX.info['exif'])
    unchangedstring=exif_dict['Exif'][piexif.ExifIFD.DateTimeOriginal]
    changedstring=str(unchangedstring, "utf-8").replace(":", "").replace(" ","")
    newname="IMG"
    newname+=changedstring
    newname+="."
    newname+=add_name
    newname+="."
    newname+=file_extension
    imageX.close()
    print(whole_directory+'/'+newname)

    os.rename(fullname,whole_directory+'/'+newname)
    print('.')

