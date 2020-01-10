# Ús de Volums a docker 

## objectiu: 
### proporcionar "estat" als containers: cal conservar les dades!!
Per fer proves emmagatzemarem fitxers a un volum de manera directa: enviant i recuperant fitxers al/del volum.
La millor manera de conservar/recuperar dades des d'un container és: [volums](https://docs.docker.com/storage/volumes/).


La següent llista d'scripts ens permeten agafar soltura en l'ús dels volums

- [20191203-demo-backup-container.sh](./20191203-demo-backup-container.sh)
- [20191203-demo-backup-container-xurro-advanced-02.sh](./20191203-demo-backup-container-xurro-advanced-02.sh)
- [20191203-demo-backup-container-xurro-advanced-03.sh](./20191203-demo-backup-container-xurro-advanced-03.sh)
- [20191203-demo-backup-container-xurro-advanced-04.sh](./20191203-demo-backup-container-xurro-advanced-04.sh)
- [20191203-demo-backup-container-xurro.sh](./20191203-demo-backup-container-xurro.sh)
- [demo2-restore-volume-amb-valors-substituits.sh](./demo2-restore-volume-amb-valors-substituits.sh)
- [demo2-restore-volume.sh](./demo2-restore-volume.sh)
- [demo-restore-volume-amb-valors.sh](./demo-restore-volume-amb-valors.sh)
- [demo-restore-volume.sh](./demo-restore-volume.sh)
- [.env](./.env)
Fitxer que conté les variables d'entorn i els valors associats per als containers i els volums. Ens permet fer múltiples execucions, amb tan sols canviar els valors assignats a les variables. 
- [Makefile](./Makefile)
Fitxer que conté les intruccions per executar els diferents scripts. Cada bloc comença amb una paraula seguida de dos punts: és una secció. Per invocar una secció cal invocarla amb l'ordre **"make <nom_seccio>"** .

- [demo de l'ús de traefik](https://github.com/boxboat/traefik-tls) Fer un git clone i seguir els passes del README. :)
