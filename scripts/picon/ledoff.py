#!/usr/bin/env python3
import time
import board
import neopixel

pixel_pin = board.D18
num_pixels = 16
ORDER = neopixel.GRBW
pixels = neopixel.NeoPixel(  pixel_pin, num_pixels, brightness=0.6, auto_write=False, pixel_order=ORDER)
pixels.fill((0,0,0,0))
pixels.show()
