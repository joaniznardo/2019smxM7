#!/bin/bash

## -- comprovar al fitxer "demo2.env" el valor de les variables d'entorn
### NOM_VOLUM=volum-restore
### NOM_CONTAINER=container-auxiliar
### DIRECTORI_DE_CONTAINER=unnomqualsevol
### DIRECTORI_TEMPORAL=tmp
### FITXER_A_TRASSPASSAR=millor-un-tar.tgz
### FITXER_A_EMPAQUETAR=un-nom-qualsevol.txt


# incorporem les variables d'entorn d'un fitxer: haurien de ser les que apareixen a dalt comentades
source demo2.env

# idempotent: eliminem abans de crear
docker container rm container-auxiliar
docker volume rm volum-restore

# creem volum
docker volume create volum-restore

# creem un fitxer
echo "mmmmm. Que hi ha, mestre?" | tee un-nom-qualsevol.txt

# empaquetem un fitxer en un altre
tar -czvf millor-un-tar.tgz un-nom-qualsevol.txt 

# executem directament l'ordre de descomprimir en el container en un directori concret, agafant el ".tgz" de l'entrada estàndar ( -f - ), gràcies a la redirecció a procés ( "|")
# aquí la "màgia és que la sortida d'un procés de la màquina física (cat), s'aprofita en un procés del container (tar)
cat millor-un-tar.tgz | docker container run -i --env-file ./demo2.env  --name container-auxiliar -v volum-restore:/unnomqualsevol alpine:latest tar -xvzf - -C /unnomqualsevol
