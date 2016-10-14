#!/bin/bash
mongo_host=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' mongo)
redis_host=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' redis)
cassandra_host=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' cassandra)

sudo sed --in-place '/mongo/d' /etc/hosts
sudo sed --in-place '/redis/d' /etc/hosts
sudo sed --in-place '/cassandra/d' /etc/hosts

echo "$mongo_host mongo" | sudo tee -a /etc/hosts
echo "$redis_host redis" | sudo tee -a /etc/hosts
echo "$cassandra_host cassandra" | sudo tee -a /etc/hosts

echo "The new /etc/hosts file:"
cat /etc/hosts
