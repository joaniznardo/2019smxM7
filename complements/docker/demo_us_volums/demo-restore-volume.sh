#!/bin/bash
## reatauració (traspàs) d'un fitxer de la màquina física a un volum
## procés per etapes

## 
export NOM_VOLUM=volum-restore
export NOM_CONTAINER=container-auxiliar
export NIRECTORI_DE_CONTAINER=unnomqualsevol
export NIRECTORI_TEMPORAL=tmp
export NITXER_A_TRASSPASSAR=millor-un-tar.tgz
export NITXER_A_EMPAQUETAR=un-nom-qualsevol.txt

# idempotent: eliminem abans de crear
docker container rm $NOM_CONTAINER
docker volume rm $NOM_VOLUM

# crear el volum
docker volume create $NOM_VOLUM

# crear un fitxer a la màquina física
echo "mmmmm. Que hi ha, mestre?" | tee $FITXER_A_EMPAQUETAR

# crear un fitxer empaquetat (i comprimit)
tar -czvf $FITXER_A_TRASSPASSAR $FITXER_A_EMPAQUETAR 

# crear un container (amb nom) associant-li un volum a una carpeta (inexistent) i execució d'un intèrpret d'ordres (/bin/sh) en segon planol (-d) 
## nota: se podrem connectar a ell després amb un "docker container attach $NOM_CONTAINER" i tornar a abandonar-lo amb ^+P+Q
docker container run -dit --name $NOM_CONTAINER -v $NOM_VOLUM:/$DIRECTORI_DE_CONTAINER ubuntu:trusty /bin/sh

# còpia entre màquina física i container
docker container cp $FITXER_A_TRASSPASSAR $NOM_CONTAINER:/$DIRECTORI_TEMPORAL 

# desempaquetar al lloc on ens interessa
docker container exec $NOM_CONTAINER tar -xzvf /$DIRECTORI_TEMPORAL/$FITXER_A_TRASSPASSAR -C /$DIRECTORI_DE_CONTAINER
