I have a VPS hosted in a data center. This script is run on a RaspberryPI located at various places (parent, my home, cottage ...)
Client devices conneto to my VPS via ssh and configuration of ssh also created a RemoteForward tunnel.
Via this ssh tunnel I can connect from VPS to the RaspberryPI to do some activities there. This crontab script is set to recover, if the ssh route is not working, which helps when disturbed.
