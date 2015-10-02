#!/bin/bash
set -e

echo ""
echo ""
echo "-- Building Memcahed image"
docker build -t memcahed-test .

echo ""
echo "-- Testing memcached is running"

docker run --name base_1 -d memcahed-test; sleep 10
docker run --name base_2 -d --link base_1:base_1 memcahed-test; sleep 10
docker exec -it base_2 bash -c 'apt-get update >/dev/null && apt-get install -y telnet >/dev/null'; sleep 5
docker exec -it base_2 bash -c '( echo "version";  sleep 1;  echo "quit" ) | telnet base_1 11211' | grep -wc "VERSION"

echo ""
echo "-- Clear"
docker rm -f -v $(sudo docker ps -aq); sleep 5
docker rmi -f memcahed-test