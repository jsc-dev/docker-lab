### docker-dev - local dev env with docker container

## containers:
- nginx (reverseproxy)
- apache with php7.1
- mysql 5.7
- solr

# specific docker commands:
- open a shell @ nginx container: $ docker-compose run nginx bash
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

# tips / troubleshooting:
- chown -R 8983:8983 ./db/solr/data
- solr admin gui http://ip:9001/solr/ (credentials: admin:DctQ-kz1CoCDnZkVX6!z8l)
- on linux: chown -R 999:999 ./db/mysql57/data
- for mysql host use: db
