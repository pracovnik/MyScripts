docker stop openhab1
docker rm -f openhab1

docker run \
        --name openhab1 \
        --net=host \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/timezone:/etc/timezone:ro \
        -v /ssd/openhab1/conf:/openhab/conf \
        -v /ssd/openhab1/userdata:/openhab/userdata \
        -v /ssd/openhab1/addons:/openhab/addons \
        -d \
        -e USER_ID=998 \
        -e GROUP_ID=996 \
        -e CRYPTO_POLICY=unlimited \
        -p 8080:8081 \
        -p 8443:8444 \
        --restart=always \
        openhab/openhab:latest


docker start openhab1
