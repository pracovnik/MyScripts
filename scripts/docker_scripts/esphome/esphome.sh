docker stop esphome
docker rm -f esphome

docker run -d \
  --name=esphome \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e ESPHOME_DASHBOARD_USE_PING=true\
  -p 6052:6052 \
  -p 5353:5353 \
  -v /ssd/docker/esphome:/config \
  --restart unless-stopped \
  ghcr.io/esphome/esphome:latest


# https://github.com/imagegenius/docker-esphome

docker start esphome
