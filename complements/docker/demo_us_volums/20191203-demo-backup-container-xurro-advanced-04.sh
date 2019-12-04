#!/bin/bash

# referències
# https://riptutorial.com/docker/example/24586/backup-a-named-volume-content


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

docker container run -i --name backup -v demo_backup:/xurro ubuntu:trusty tar -czvf -  -C /xurro  . | cat > backup2.tar.gz
# -- si vols veure caracters extranys per pantalla...
# docker container run -i --name backup -v demo_backup:/xurro ubuntu:trusty tar -czvf -  -C /xurro  . | tee backup2.tar.gz

# -- visualitzem el contingut
tar tvzf backup2.tar.gz
