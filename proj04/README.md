# DNS i DHCP

## Repte 1 

- Genera un contenidor de docker que faci de servidor DNS per a les diferents màquines físiques de l'institut. 
- El nom del domini cal que acabi en .edu, el nom de domini de 2on nivell el que decidisca l'equip, i el nom de domini de 3er nivell cadascuna de les aules de smx2 (ac2, aula14 i aula25). Per al nom de les màquines, pot ser un seqüencial (pc01,pc02...), noms d'un personatges de cómics (bugsbunny, daffyduck, tasmaniandevil....), noms de grups/cantants musicals (ledzeppelin, theblackcrowes, sopadecabra, elsobrinodeldiablo...).

- En qualsevol cas, els noms caldrà que siguen respectuosos (aptes per menors).

- Idealment, el servidor de dns disposarà d'un servidor de recolzament (fail over) per assegurar la continuitat del servei en cas de no disponibilitat del primer. (No cal dir, que la configuració del servidor de recolzament (o secundari) se genera de manera automàtica (a partir de la info del principal o primari).



### Validació: 
Consistirà en configurar clients per a que facin ús dels vostres servidors i poder efectuar pings a les màquines per nom (també estaria bé dispposar d'algun servei addicional ("alguien dijo servidor de correo?") en alguna màquina :)


### Termini: divendres 20 de març de 2020


