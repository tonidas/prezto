#!/bin/bash
#mongo_host=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' mongo)
#redis_host=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' redis)
#cassandra_host=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' cassandra)
# On mac everything goes to localhost
mongo_host=127.0.0.1
redis_host=127.0.0.1
cassandra_host=127.0.0.1


sudo sed -i.bak '/mongo/d' /etc/hosts
sudo sed -i.bak '/redis/d' /etc/hosts
sudo sed -i.bak '/cassandra/d' /etc/hosts

echo "$mongo_host mongo" | sudo tee -a /etc/hosts
echo "$redis_host redis" | sudo tee -a /etc/hosts
echo "$cassandra_host cassandra" | sudo tee -a /etc/hosts

echo "The new /etc/hosts file:"
cat /etc/hosts
