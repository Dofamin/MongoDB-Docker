#!/bin/bash
git clone https://github.com/Dofamin/MongoDB-Docker.git /srv/MongoDB/

docker build . --tag mongodb

docker rm -f MongoDB

docker create \
  --name=MongoDB \
  -v /srv/MongoDB/logs/:/var/log/mongodb \
  -v /srv/MongoDB/data/:/data/db \
  -v /srv/MongoDB/conf/:/srv/MongoDB/conf \
  -p 27017:27017 \
  --restart unless-stopped \
  --memory="100m" \
  mongodb:latest
  
docker start MongoDB