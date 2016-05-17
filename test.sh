#!/bin/bash
set -e

echo
echo
echo "-- Building Memcahed image"
docker build -t memcahed-test .
docker network create mem_net

echo
echo "-- Testing memcached is running"

docker run --name base_1 -d --net mem_net memcahed-test; sleep 10
docker run --name base_2 -d --net mem_net memcahed-test; sleep 10
docker exec -it base_2 bash -c 'apt-get update >/dev/null && apt-get install -y telnet >/dev/null'; sleep 5
docker exec -it base_2 bash -c '( echo "version";  sleep 1;  echo "quit" ) | telnet base_1 11211' | grep -wc "VERSION"

echo
echo "-- Clear"
docker rm -f -v base_1 base_2; sleep 5
docker network rm mem_net
docker rmi -f memcahed-test