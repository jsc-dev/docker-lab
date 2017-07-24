### docker dev environment

## dont use in live environment!

## containers:
- nginx (reverseproxy)
- apache with php5.6
- apache with php7.1
- mysql 5.7
- mariadb
- solr
- redis
- mongodb

# specific docker commands:
- open a shell @ nginx container: $ docker-compose run nginx bash
- open a shell @ apache-php56 container: $ docker-compose run apache-php56 bash
- open a shell @ apache-php7 container: $ docker-compose run apache-php7 bash
- run a command in a container: $ docker exec -ti mysql57 bash

# misc docker commands:
- build containers: $ docker-compose build
- start containers: $ docker-compose up -d
- list all containers: $ docker ps -a
- list all images: $ docker images
- stop all containers: $ docker ps -q -a | xargs docker stop
- kill all containers: $ docker ps -q -a | xargs docker rm
- delete all docker images: $ docker rmi $(docker images -q)
- delete a single docker image: $ docker rmi name-of-the-image

