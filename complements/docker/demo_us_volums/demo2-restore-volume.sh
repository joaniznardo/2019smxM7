#!/bin/bash

## -- comprovar al fitxer "demo2.env" el valor de les variables d'entorn
### NOM_VOLUM=volum-restore
### NOM_CONTAINER=container-auxiliar
### DIRECTORI_DE_CONTAINER=unnomqualsevol
### DIRECTORI_TEMPORAL=tmp
### FITXER_A_TRASSPASSAR=millor-un-tar.tgz
### FITXER_A_EMPAQUETAR=un-nom-qualsevol.txt


# incorporem les variables d'entorn d'un fitxer: haurien de ser les que apareixen a dalt comentades
##source demo2.env

# idempotent: eliminem abans de crear
docker container rm $NOM_CONTAINER
docker volume rm $NOM_VOLUM

# creem volum
docker volume create $NOM_VOLUM

# creem un fitxer
echo "mmmmm. Que hi ha, mestre?" | tee $FITXER_A_EMPAQUETAR

# empaquetem un fitxer en un altre
tar -czvf $FITXER_A_TRASSPASSAR $FITXER_A_EMPAQUETAR 

# executem directament l'ordre de descomprimir en el container en un directori concret, agafant el ".tgz" de l'entrada estàndar ( -f - ), gràcies a la redirecció a procés ( "|")
# aquí la "màgia és que la sortida d'un procés de la màquina física (cat), s'aprofita en un procés del container (tar)
cat $FITXER_A_TRASSPASSAR | docker container run -i --env-file ./.env  --name $NOM_CONTAINER -v $NOM_VOLUM:/$DIRECTORI_DE_CONTAINER alpine:latest tar -xvzf - -C /$DIRECTORI_DE_CONTAINER
