docker stop webcam2
docker rm -f webcam2


docker run \
    --detach \
    --name webcam2 \
    --device "/dev/v4l/by-id/usb-Microsoft_Microsoft®_LifeCam_Cinema_TM_-video-index0:/dev/video0" \
    --entrypoint mjpg_streamer \
    -p 18082:8080 \
    kvaps/mjpg-streamer \
    -i "/usr/lib64/input_uvc.so -y -d /dev/video0 -r 1280x960 -f 30 " \
    -o "/usr/lib64/output_http.so -p 8080 -w /usr/share/mjpeg-streamer/www/ -c admin:admin"


# get uniqu ID of the device as /dev/videoX changes
# ls -all /dev/v4l/by-id/


docker start webcam2
