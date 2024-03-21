docker stop motion1
docker rm -f motion1
docker rmi -f motion1

rm -rf /ssd/motion1/build.log

docker build --no-cache /ssd/motion1/ -t motion1 -f /ssd/motion1/Dockerfile --progress=plain &> /ssd/motion1/build.log 

docker run -d --name=motion1 \
    -p 8180:8180 \
    -p 8181:8181 \
    -e TZ="Europe\Prague" \
    -v /ssd/motion1:/usr/local/etc/motion \
    -v /ssd/motion1/storage:/usr/motion/storage \
    --restart=always \
    motion1

ls -all /ssd/motion1

docker start motion1
