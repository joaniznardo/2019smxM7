SHELL:=/bin/bash -x
# https://unix.stackexchange.com/questions/235223/makefile-include-env-file

include .env
export $(shell sed 's/=.*//' .env)

.PHONY: 

dryrun: 
	env && envsubst < demo-restore-volume.sh | tee demo-restore-volume-amb-valors.sh

dryrun2: 
	env && envsubst < demo2-restore-volume.sh | tee demo2-restore-volume-amb-valors-substituits.sh

dryrun3: 
	env && envsubst < demo-volum-ftp.sh | tee demo-volum-ftp-sense-variables.sh

runrestore: 
	env && source demo2-restore-volume.sh

runbackup:
	env && source demo-backup-final.sh

runftp:
	env && source demo-volum-ftp.sh
runftp2:
	env && source tmp-demo-volum-ftp.sh
runstack:
	docker network create --driver overlay frontend
	docker stack deploy  --compose-file docker-compose-proj02.yml stack001
delstack:
	docker stack rm stack001
	docker network rm frontend
runstack2:
	xhost + local:docker
	docker network create --driver overlay frontend2
	docker stack deploy  --compose-file docker-compose-proj02b.yml stack002
delstack2:
	docker stack rm stack002
	docker network rm frontend2
	xhost - local:docker
