#!/bin/bash

# idempotent: eliminem abans de crear
docker container stop backup
docker container rm backup

docker container stop restore
docker container rm restore

# idempotent: eliminem abans de crear
docker volume rm demo_backup
docker volume rm demo_restore

docker volume create demo_backup
docker volume create demo_restore

echo "Hello World. I'll wait for you into the container" |  docker run -i --rm=true -v demo_backup:/xurro ubuntu:trusty tee /xurro/hello.txt

docker container run -i --name backup -v demo_backup:/xurro ubuntu:trusty tar -cvf -  -C /xurro  . | docker container run -i --rm=true  -v demo_restore:/xocolata ubuntu:trusty tar -xvf - -C /xocolata

# docker container run -it --name restore -v demo_restore:/xocolata ubuntu:trusty sh -c "ls -l /xocolata"
docker container run -it --name restore -v demo_restore:/xocolata ubuntu:trusty sh -c "cat /xocolata/hello.txt"

# -- si desconfies descomenta la següent línia
#docker container run -it --rm=true -v demo_restore:/xocolata ubuntu:trusty bash
