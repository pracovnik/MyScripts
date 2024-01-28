docker stop jenkins
docker rm -f jenkins

docker pull jenkins/jenkins:jdk11

docker run \
    --name jenkins \
    --detach \
    --publish 17080:8080 \
    --publish 17000:17000 \
    --volume /ssd/docker/jenkins:/var/jenkins_home \
    jenkins/jenkins


docker start jenkins
