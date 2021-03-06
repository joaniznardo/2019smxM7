#!/bin/bash

# idempotent: eliminem abans de crear
## 
## docker volume rm demo_bakcup
docker volume create demo_backup
echo "Hello World. I'll wait for you into the container" |  docker run -i --rm=true -v demo_backup:/data ubuntu:trusty tee /data/hello.txt

# idempotent: eliminem abans de crear
## docker container stop backup
## docker container rm backup


docker container run -d --name backup -v demo_backup:/data ubuntu:trusty tar -czvf /tmp/data.tgz /data
docker container cp backup:/tmp/data.tgz ./data_from_container.tgz

## 
docker container rm -fv backup

# extracció
tar -xzvf data_from_container.tgz
cat data/hello.txt

