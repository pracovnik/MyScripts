I have octoprint, where is an event trigger when a layer change. This event triggers a python script.

Python script does:
- read csv file, to get list of (per line)
  - web-camera-device url
  - where to place them (x0,y0)
  - resize the photo to (x, y)
  - rotation of photo(degree)
- get photo from each web-camera device url (parallel, but not in published script)
    - This step is important, as any delay may affect the position
- Create an end-photo
  - For each photo:
    - Resize
    - Rotate
    - Paste the modified photo to designated coordinates
- Store the end-photo to specific path+name, if was added as an argument (for use with octolapse)
- Store the end-photo to specific location  
