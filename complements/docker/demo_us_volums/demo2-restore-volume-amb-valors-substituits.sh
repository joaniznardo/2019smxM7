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
docker container rm container-auxiliar3
docker volume rm volum-restore3

# creem volum
docker volume create volum-restore3

# creem un fitxer
echo "mmmmm. Que hi ha, mestre?" | tee un-nom-qualsevol3.txt

# empaquetem un fitxer en un altre
tar -czvf flipa-en-colors.tgz un-nom-qualsevol3.txt 

# executem directament l'ordre de descomprimir en el container en un directori concret, agafant el ".tgz" de l'entrada estàndar ( -f - ), gràcies a la redirecció a procés ( "|")
# aquí la "màgia és que la sortida d'un procés de la màquina física (cat), s'aprofita en un procés del container (tar)
cat flipa-en-colors.tgz | docker container run -i --env-file ./demo2.env  --name container-auxiliar3 -v volum-restore3:/unnomqualsevol3 alpine:latest tar -xvzf - -C /unnomqualsevol3
