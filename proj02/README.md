# Hosting & co

## Data de presentació: dimecres 29/01/2020

Sou una empresa que proporciona serveis de hosting per a múltiples empreses clients. 

Teniu ja tres clients (empreses) que han contractat els vostres serveis.

La vostra missió és proporcionar-li un espai web en un contenidor (apache/ngnix) per poder publicar el contingut que cregui oportú. 

Creareu una web de tipus blog on se vaja contant el “make off” de la creació i publicació de la web d’un client (com a cas d’ús/exemple/demo del know how). 

En la vostra empresa haurà d’apareixer els vostres currículums en format web (i opcionalment descarregable com a pdf). 

**NO ENTRA!!! >> En l’ampliació se li proporcionarà com a prestació addicional un panell de control (cockpit/webmin/ajenti) per fer accessible l’administració de la web de manera gràfica. <<**
La qualitat del vostre servei se determina al 50% per la velocitat en la que sou capaços de lliurar l’accés a l’espai web (usuari+contrassenya+ip) i les prestacions que otorgueu. 

Volem que tant l’empresa client com nosaltres ser capaços de determinar quins són els accessos que s’efectuen als seus servidors. 

Volem estar en condicions de resoldre incidències que se generen en el servidor. 

Volem ser capaços de fer funcionar un gestor de bases de dades com ara el phpmyadmin.

**VALIDACIONS**
- crear un nou compte per al servei d'ftp (sftp) per poder fer accessible una nova web
- publicar (proporcionada per mi) una nova web amb el nou compte. (**NOTA** la nova web serà accessible també a través del proxy *traefik*)
- generar un nou certificat per a la nova web. 
- fer modificacions a una de les webs existents (nova entrada a un blog/ nou producte a  una botiga/ canvi de les dades de contacte...)
- comprovar des de quines ip s'ha accedit a les webs.
- existeixen els certificats per a dues de les quatre webs obligatòries

## Enllaços interessants

###  hosting
- [MUSTREAD! - hostinger: hosting](https://www.hostinger.es/tutoriales/que-es-un-hosting)
- [comparahosting: comparativa hosting](https://www.comparahosting.com/p/que-es-hosting/) 
- [claranet: hosting gestionat](https://www.claranet.es/hosting-gestionado) 
- [liquidweb: managed hosting](https://www.liquidweb.com/managed-hosting/) 
###  interessant
- [proxadmin: consells per aventurar-se en el món de l'allotjament web](https://www.proxadmin.es/blog/empezando-un-negocio-de-hosting/#more-15)

### certificats
- [Certificats i Autoritats de certificació](https://letsencrypt.org/es/getting-started/)
- [generador de certificats online](https://zerossl.com/)
- [crear certificats de desenvolupament](https://lukas.zapletalovi.com/2019/09/testing-tls-ca-server-and-client-certs.html) Un dels meus referents favorits
- [diapos demo letsencrypt](https://drive.google.com/file/d/1fb2rGGGEoh47QpQnhqJYN03OU-9nzWu3/view?usp=sharing) Demo de generació de certificat de Letsencrypt via zerossl.com
- [video demo letsencript - part 1](https://drive.google.com/file/d/1dWedbUqIs_n5F40v6ZPAKn-2kBrzxlo9/view?usp=sharing) Video (no audio); millor diapos (captures) ;)
- [video demo letsencript - part 2](https://drive.google.com/file/d/1qjTRBN_sdemaC4WGFjkGlSR-IwxsAXOq/view?usp=sharing) Part final.
### traefik
- [tutorial alternatiu traefik 2.0](https://containo.us/blog/traefik-2-0-docker-101-fc2893944b9d/)
- [codi de l'enllaç anterior](https://github.com/containous/blog-posts)
