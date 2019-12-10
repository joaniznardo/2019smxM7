#!/bin/bash
## reatauració (traspàs) d'un fitxer de la màquina física a un volum
## procés per etapes

## 
##NOM_VOLUM="volum-restore"
##NOM_CONTAINER="container-auxiliar"
##DIRECTORI_DE_CONTAINER="unnomqualsevol"
##DIRECTORI_TEMPORAL="tmp"
##FITXER_A_TRASSPASSAR="millor-un-tar.tgz"
##FITXER_A_EMPAQUETAR="un-nom-qualsevol.txt"

##source demo2.env
# idempotent: eliminem abans de crear
docker container rm container-auxiliar3
docker volume rm volum-restore3

# crear el volum
docker volume create volum-restore3

# crear un fitxer a la màquina física
echo "mmmmm. Que hi ha, mestre?" | tee un-nom-qualsevol3.txt

# crear un fitxer empaquetat (i comprimit)
tar -czvf flipa-en-colors.tgz un-nom-qualsevol3.txt 

# crear un container (amb nom) associant-li un volum a una carpeta (inexistent) i execució d'un intèrpret d'ordres (/bin/sh) en segon planol (-d) 
## nota: se podrem connectar a ell després amb un "docker container attach container-auxiliar3" i tornar a abandonar-lo amb ^+P+Q
docker container run -dit --name container-auxiliar3 -v volum-restore3:/unnomqualsevol3 ubuntu:trusty /bin/sh

# còpia entre màquina física i container
docker container cp flipa-en-colors.tgz container-auxiliar3:/tmp 

# desempaquetar al lloc on ens interessa
docker container exec container-auxiliar3 tar -xzvf /tmp/flipa-en-colors.tgz -C /unnomqualsevol3
