SHELL:=/bin/bash -x
# https://unix.stackexchange.com/questions/235223/makefile-include-env-file

include .env
export $(shell sed 's/=.*//' .env)

.PHONY: 

dryrun: 
	env && envsubst < demo-restore-volume.sh | tee demo-restore-volume-amb-valors.sh

dryrun2: 
	env && envsubst < demo2-restore-volume.sh | tee demo2-restore-volume-amb-valors-substituits.sh

runrestore: 
	env && source demo2-restore-volume.sh

runbackup:
	env && source demo-backup-final.sh
