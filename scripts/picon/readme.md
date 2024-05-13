Picon is  Raspberry Zero 1 wh , that I had no use for. So I added it to my 3D printer as second web camera. Is powered only when 3D printer is.

What is on it:
1. Connected LED strip via gpio
2. Connected raspberry camera
3. apache website with python-cgi enabled
 a. password protected
 b. cgi base on get trigger LED ON or OFF  (octoprint server run wget toward picon)
 c. entry webpage with all the urls for simplicity
4. ustreamer to stream the content from the rpi camera


Is planeed in the future:
1. Connected servo to try to kick object from hotbed
2. Connected filament detection thing to get a notification before printer detect it
  a. via ntfy get push notification
  b. filament detection thing is bought, just not implemented due to short cable
4. Now I use wget as trigger executed from home assistant.
  a. Would like to go more native control via home assistant
5. As power on/off is utilized without correct shutdown, making a script to re-copy all in case of failure
  a. maybe use ansible
