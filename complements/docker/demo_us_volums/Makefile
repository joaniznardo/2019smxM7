SHELL:=/bin/bash -x


dryrun: loadenv
	envsubst < demo-restore-volume.sh | tee demo-restore-volume-amb-valors.sh

dryrun2: loadenv
	envsubst < demo2-restore-volume.sh | tee demo2-restore-volume-amb-valors-substituits.sh

run: 
	source demo2.restore-volume.sh

loadenv:
	source demo2.env
