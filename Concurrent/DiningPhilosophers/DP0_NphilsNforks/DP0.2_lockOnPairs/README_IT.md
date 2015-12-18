# Lock a coppie

La soluzione implementata implementa un monitor (TableMonitor) in una modalità
che permette di parallelizzare l'esecuzione per ⌊n/2⌋ processi evitando
starvation, deadlock ed attesa attiva.
Questo si ottiene prendendo il lock sulle coppie di forchette, in pratica
ogni filosofo prende i lock SOLO sulle forchette che gli interessano. Non
esiste quindi un lock "globale" sul tavolo.
