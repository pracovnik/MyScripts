Got: https://www.aliexpress.com/item/1005004952726089.html

Followed for openhasp firmware for flashing:
https://www.openhasp.com/0.7.0/hardware/sunton/esp32-8048s0xx/

UI modification:
https://www.openhasp.com/0.7.0/integrations/home-assistant/sampl_conf/#dynamically-set-ui-element-dimensions

3rd party: zip of pictures (from page above) for weather icons

download link for examples：
http://pan.jczn1688.com/directlink/1/ESP32%20module/7.0inch_ESP32-8048S070.zip

Did:

a) Downloaded openhasp firmware for my LCD, note I have c version

b) Downloaded the link for examples on aliexpress page of the product

c) Unziped(from b) the flashing files flash_download_tool  [ do not use espflasher, cannot flash C3 chips yet ]

d) Flashed the LCD using the how-to in examples

e) Changed the wifi setting to my local

f) Assigned a static IP via my ISP router

g) Installed a mqtt server + config and added to HA as I didn't had it

h) Setup for LCD: mqtt configuration , credentials for http, time settings, set 0 for idle in display

i) In HA set met.no integration (called home) for my location, note there are hourly and daily entities

j) In HA added openhasp integration and LCD was detected as device

k) Added to HA's configuration.yaml the path to openhasp.yaml

l) Created the openhasp.yaml config for HA (page+ID reflects to pages.jsonl)

k) Update the LCD's pages.jsonl configuration

j) Setup antiburn scheduling for the LCD, to not burn pixels (see UI modifications)
.

.

.

will be added soon
1) show from sensor temperature located outside
2) show if car is parked
3) as soon as met.no integration is fixed also show icon of current weather
4) show small photos from webcameras, looking from window on both sides of house

.

z) Got approve from wife


