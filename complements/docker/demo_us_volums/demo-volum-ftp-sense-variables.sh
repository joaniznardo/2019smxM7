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
docker container rm container-auxiliar3
docker volume rm volum-restore3

# creem volum
docker volume create volum-restore3



#docker run -d -p 21:21 -v volum-restore3:/home/vsftpd --name vsftpd01 fauria/vsftpd
docker run -d --env-file ./.env -p 21:21 -v volum-restore3:/home/vsftp --name vsftpd01 fauria/vsftpd

