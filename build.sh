#!/bin/bash
VERSION=$(date +%H-%M-%S)
docker build -t sreeharshav/testingbuild:${VERSION} .
docker push sreeharshav/testingbuild:${VERSION}
docker -H tcp://172-31-38-105:2375 stop nginx
docker -H tcp://172-31-38-105:2375 run --rm -dit -p 8000:80 --name nginx --hostname nginx rajeshragam/jenkinsjob:${VERSION}
echo "---------------------"
