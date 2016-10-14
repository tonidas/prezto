#!/bin/bash
set -e

echo "Cleaning database containers"
docker rm -f cassandra
docker rm -f mongo
docker rm -f redis

echo "Starting database containers"

docker run -d --name cassandra inlocomedia/cassandra:2.1-light
docker run -d --name mongo     inlocomedia/mongo:2.6.12-light
docker run -d --name redis     inlocomedia/redis:2.8.23-light

echo "All done starting databases!"
