SHELL:=/bin/bash -x
dryrun:
	envsubst < demo-restore-volume.sh | tee demo-restore-volume-amb-valors.sh
dryrun2:
	source demo2.env
	envsubst < demo2-restore-volume.sh | tee demo2-restore-volume-amb-valors-substituits.sh
run: 
	source demo2.restore-volume.sh
