#!/usr/bin/env python3
import cgitb
import subprocess

cgitb.enable()

print("Content-Type: text/html;charset=utf-8")
print("Content-type:text/html\r\n")
print("<H1>leds are off</H1>")

subprocess.run(["sudo", "/opt/scripts/ledoff.py"],capture_output=False)


print("<a href=\"/cgi/ledon.py\">led on</a><br>")
print("<a href=\"/cgi/ledoff.py\">led off</a><br>")
print("<a href=\"http://192.168.1.201:8080/stream\">stream</a><br>")
print("<a href=\"http://192.168.1.201:8080/snapshot\">snapshot</a><br>")
print("<b><a href=/>Back</a></b>")
