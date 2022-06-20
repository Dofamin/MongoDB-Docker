# ![Logo](docs/leaf.svg) MongoDB README

Welcome to MongoDB!

## Components

  - `mongod` - The database server.
  - `mongos` - Sharding router.
  - `mongo`  - The database shell (uses interactive javascript).

## Utilities

  `install_compass` - Installs MongoDB Compass for your platform.

## Bulding

```shell
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

```

Or just pull from GitHub

```shell
docker pull ghcr.io/dofamin/mongodb-docker:main

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

```

## Installing Compass

  You can install compass using the `install_compass` script packaged with MongoDB:

  ```bash
    $ ./install_compass
  ```

  This will download the appropriate MongoDB Compass package for your platform
  and install it.

## Drivers

  Client drivers for most programming languages are available at
  https://docs.mongodb.com/manual/applications/drivers/. Use the shell
  (`mongo`) for administrative tasks.

## Bug Reports

  See https://github.com/mongodb/mongo/wiki/Submit-Bug-Reports.


## Documentation

  https://docs.mongodb.com/manual/

## Forums

  - https://community.mongodb.com

      Technical questions about using MongoDB.

  - https://community.mongodb.com/c/server-dev

      Technical questions about building and developing MongoDB.

## Learn MongoDB

  https://university.mongodb.com/

## LICENSE

  MongoDB is free and the source is available. Versions released prior to
  October 16, 2018 are published under the AGPL. All versions released after
  October 16, 2018, including patch fixes for prior versions, are published
  under the [Server Side Public License (SSPL) v1](LICENSE-Community.txt).
  See individual files for details.


#### [Official MongoDB GitHub Repository](https://github.com/mongodb/mongo)
