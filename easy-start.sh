#!/bin/bash
git clone https://github.com/Dofamin/MongoDB-Docker.git /srv/MongoDB/

docker build . --tag mongodb

docker rm -f MongoDB

docker create \
  --name=MongoDB\
  --restart unless-stopped \
  --memory="100m" \
  mongodb:latest
  
docker start MongoDB