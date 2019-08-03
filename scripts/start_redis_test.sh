#!/bin/bash
export REDIS_GEOQUERY_PATH='/Users/airton/workspace/others/redis-geoquery'

echo 'Killing current redises..'
ps aux | grep redis-server | grep -v 'grep' | awk '{print $2}' | xargs kill -9
ps aux | grep redis-sentinel | grep -v 'grep' | awk '{print $2}' | xargs kill -9

echo 'Starting redis and redis sentinel..'
# Remember to set protected-mode no on /usr/local/etc/redis.conf for testing environment
redis-server /usr/local/etc/redis.conf --protected-mode no --loadmodule "$REDIS_GEOQUERY_PATH/build/libredisgeoquery.dylib" &
redis-sentinel /usr/local/etc/redis-sentinel.conf &

echo 'Done'
