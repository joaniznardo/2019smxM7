#!/bin/bash
source ./dades_entorn.txt
docker volume create $LOCALPATH
docker network create --driver overlay frontend
docker stack deploy stack_pwdns --compose-file docker-compose.yml
docker stack services stack_pwdns
