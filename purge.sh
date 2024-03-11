#!/bin/bash

docker stop $(docker ps -a -q)
rm -f created
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
