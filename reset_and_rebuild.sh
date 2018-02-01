#!/bin/bash


chown -R 8983:8983 db/solr/data
chown -R 999:docker db/mysql57/data

docker-compose stop
docker ps -q -a | xargs docker rm -f
docker rmi $(docker images -q)

docker-compose build
#docker-compose up -d
