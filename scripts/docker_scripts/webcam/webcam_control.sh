#!/bin/bash
# Start / stop streamer daemon
# In octorpint run with
#start to start webcamera
#stop to stop webcamera

case "$1" in
    start)
        docker start webcam1
        docker start webcam2
        docker start webcam3
        ;;
    stop)
        docker stop webcam1 --time 2
        docker stop webcam2 --time 2
        docker stop webcam3 --time 2
        ;;
    *)
        echo "Usage: $0 {start|stop}" >&2
        ;;
esac


