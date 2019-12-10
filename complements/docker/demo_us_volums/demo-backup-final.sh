#!/bin/bash

# referències
# https://riptutorial.com/docker/example/24586/backup-a-named-volume-content


# idempotent: eliminem abans de crear
docker container stop $NOM_CONTAINER_BKP
docker container rm $NOM_CONTAINER_BKP

docker container stop $NOM_CONTAINER_REST
docker container rm $NOM_CONTAINER_REST



# idempotent: eliminem abans de crear
docker volume rm $NOM_VOLUM_BKP
docker volume rm $NOM_VOLUM_REST

docker volume create $NOM_VOLUM_BKP
docker volume create $NOM_VOLUM_REST


echo "Hello World. I'll wait for you into the container" |  docker run -i --rm=true -v $NOM_VOLUM_BKP:/$DIRECTORI_DE_CONTAINER ubuntu:trusty tee /$DIRECTORI_DE_CONTAINER/$FITXER_A_EMPAQUETAR

docker container run -i --name $NOM_CONTAINER_BKP -v $NOM_VOLUM_BKP:/$DIRECTORI_DE_CONTAINER ubuntu:trusty tar -czvf -  -C /$DIRECTORI_DE_CONTAINER  . | cat > $FITXER_A_TRASSPASSAR
# -- si vols veure caracters extranys per pantalla...
# docker container run -i --name backup -v demo_backup:/xurro ubuntu:trusty tar -czvf -  -C /xurro  . | tee backup2.tar.gz

# -- visualitzem el contingut
tar tvzf $FITXER_A_TRASSPASSAR
