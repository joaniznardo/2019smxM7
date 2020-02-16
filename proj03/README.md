# Projecte 3 - servidor de correu

## objectiu
- a partir del servidor de correu [poste](https://poste.io/) configurar el servidor i comptes de correu per al donimi que has creat en el projecte anterior de manera que se puga enviar missatges (emails) entre comptes de dos dominis.

## termini 
- dimecres 26 de febrer data de validació

## validació

- administració del servidor per la interficie gràfica i per a REST API mitjançant l'ordre **curl**
- configuració i administració d'un nou domini proporcionat el dia de la validació

# mini-demo
[captures-de-pantalla](./mail-files.zip)

# punt de partida
```
docker volume create volum_mail_server
docker run \
    --net=host \
    -v /etc/localtime:/etc/localtime:ro \
    -v volum_mail_server:/data \
    --name "mailserver" \
    -h "si_no_canvies_aquest_domini_suspens_el_projecte.tk" \
    -t analogic/poste.io
```

# demo REST API
[demo](./20200214-demo-rest-api-poste.io.txt) Resum de la classe del divendres 20200214
