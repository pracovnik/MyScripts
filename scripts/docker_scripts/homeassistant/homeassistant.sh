docker stop homeassistant
docker rm -f homeassistant


docker run -d \
  --name homeassistant \
  --privileged \
  --restart=unless-stopped \
  -p 8123:8123 \
  -e TZ="Europe/Prague" \
  -v /ssd/docker/homeassistant:/config \
  --restart unless-stopped \
  --network=host \
  ghcr.io/home-assistant/home-assistant:stable


docker start homeassistant
