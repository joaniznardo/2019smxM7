# POWERDNS

En aquest directori hi ha els scripts per engegar i aturar els containers que donen servei a powerdns.

Per engegar-los feu:
```bash
sh start_powerdns.sh
```

Per aturar-los:
```bash
sh stop_powerdns.sh
```

NOTA: a l'script d'aturada cal comprovar que el volum s'ha eliminat. En cas que el temporitzador (9 segons) no siga suficient, tornar a executar l'script.
[video demo](https://drive.google.com/file/d/1W5nC5FFYyi5ZIwsd6KkpePXvXMdHjyd4/view?usp=sharing)
