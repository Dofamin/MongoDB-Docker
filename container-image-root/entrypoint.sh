#!/bin/bash
set -x

if [ ! -d /srv/MongoDB/ ]; then
    mkdir -p /srv/MongoDB/
fi

if [ ! -d /srv/MongoDB/conf/ ]; then
    mkdir -p /srv/MongoDB/conf/
fi

if [ ! -f /srv/MongoDB/conf/mongod.conf ]; then
    cp /etc/mongod.conf /srv/MongoDB/conf/mongod.conf
fi

service ntp start
service cron start
/usr/bin/mongod \
--config /srv/MongoDB/conf/mongod.conf 