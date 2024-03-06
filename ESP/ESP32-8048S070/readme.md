Got: https://www.aliexpress.com/item/1005004952726089.html?spm=a2g0o.productlist.main.3.340e607aBiYZTX&algo_pvid=d4fbeba8-a6a3-4adb-ba08-1ed71e8c63a6&algo_exp_id=d4fbeba8-a6a3-4adb-ba08-1ed71e8c63a6-1&pdp_npi=4%40dis%21EUR%2125.43%2123.9%21%21%21194.53%21%21%402103237317047488282558872ea149%2112000031135431788%21sea%21SK%210%21AB&curPageLogUid=XUsBR8GVo6tJ&utparam-url=scene%3Asearch%7Cquery_from%3A

Followed for openhasp: firmware and flashing:
https://www.openhasp.com/0.7.0/hardware/sunton/esp32-8048s0xx/

UI modification:
https://www.openhasp.com/0.7.0/integrations/home-assistant/sampl_conf/#dynamically-set-ui-element-dimensions

3rd party: zip of pictures (from page above) for weather icons

Did:
a) Downloaded openhasp for my LCD

b) Downloaded the link on aliexpress

c) Unziped(from b) the flashing files flash_download_tool

d) Flashed the LCD

e) Changed the wifi

f) Assigned a static IP via ISP router

g) (optional) installed a mqtt server + config in HA

h) Setup for LCD: mqtt configuration , credentials for http, time settings, set 0 for idle in display

i) In HA set met.no integration (called home) for my location, note there are hourly and dayly

j) In HA added openhasp integration and LCD detected as device

k) Added to HA's configuration.yaml the path to openhasp.yaml

l) Created the openhasp.yaml config for HA (page+ID reflects to pages.jsonl)

k) Update the LCD's pages.jsonl configuration

j) Setup antiburn scheduler for the LCD, not not burn pixels (see UI modifications)
.
will be added soon
1) show from sensor temperature located outside
2) show if car is parked
3) as soon as met.no integration is fixed also show icon of current weather
4) show small photos from webcameras, looking from window on both sides of house

.
z) Got approve from wife


