#!/bin/bash

## -- comprovar al fitxer "demo2.env" el valor de les variables d'entorn
### NOM_VOLUM=volum-restore
### NOM_CONTAINER=container-auxiliar
### DIRECTORI_DE_CONTAINER=unnomqualsevol
### DIRECTORI_TEMPORAL=tmp
### FITXER_A_TRASSPASSAR=millor-un-tar.tgz
### FITXER_A_EMPAQUETAR=un-nom-qualsevol.txt


# incorporem les variables d'entorn d'un fitxer: haurien de ser les que apareixen a dalt comentades
source .env

# idempotent: eliminem abans de crear
docker container rm $NOM_CONTAINER_FTP
docker volume rm $NOM_VOLUM

# creem volum
docker volume create $NOM_VOLUM



#docker run -d -p 21:21 -v $NOM_VOLUM:/home/vsftpd --name $NOM_CONTAINER_FTP fauria/vsftpd
docker run -d --env-file ./.env -p 21:21 -v $NOM_VOLUM:$DIRECTORI_DADES_FTP --name $NOM_CONTAINER_FTP fauria/vsftpd
##docker run -d --env-file ./.env -p 21:21 -v $NOM_VOLUM:$DIRECTORI_DADES_FTP --name $NOM_CONTAINER_FTP vsftpdjoan:v0.1

