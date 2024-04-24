I have a VPS hosted in a data center. This script is run on a raspberryPI located at my parent's home. It is connecting to my VPN(static IP) using ssh. Configuration of ssh also created a RemoteForward tunnel.
Via this tunnel I can connect from VPS to the raspberryPI to do some activities there. Script is set to recover if the ssh route is not working.
