#!/bin/sh

# cd /root/dongfeng/spec

docker-compose down
docker-compose up -d --remove-orphans
