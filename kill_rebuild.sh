#!/bin/bash

docker ps -q -a | xargs docker stop
docker ps -q -a | xargs docker rm
docker rmi $(docker images)

docker-compose build
docker-compose up -d

#docker-compose run web bash
#docker-compose run apache bash 
