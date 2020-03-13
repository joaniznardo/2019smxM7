#!/bin/bash
source ./dades_entorn.txt
docker stack rm stack_pwdns
docker network rm frontend
echo "esperem 9 segons a que no queden serveis que fecen servir el volum"
sleep 9
docker volume rm $LOCALPATH

