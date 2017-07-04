docker ps -q -a | xargs docker stop
docker-compose build  
docker-compose up -d

