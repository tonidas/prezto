#!/bin/bash
#set -e

echo "Cleaning database containers"
docker rm -f cassandra
docker rm -f mongo
docker rm -f redis

echo "Starting database containers"

docker run -d -p 9042:9042   --name cassandra cassandra:2.2.9
docker run -d -p 27017:27017 --name mongo     mongo:2.6.12
docker run -d -p 6379:6379   --name redis     inlocomedia/redis:2.8.23-light

echo "All done starting databases!"
