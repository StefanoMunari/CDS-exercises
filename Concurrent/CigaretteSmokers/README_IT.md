# Problemi progettuali di concorrenza
# - Fumatori di sigarette -
Problema riguardante la sincronizzazione
tra processi concorrenti nell'acquisizione di
una risorsa.

## Descrizione

### Versione base
Ci sono 3 fumatori ed 1 tabaccaio.  
* Ogni fumatore possiede una risorsa diversa
da quella che possiede ogni altro fumatore
esistente (i.e. fumatore1 possiede tabacco,
  fumatore2 possiede cartine, etc.);
* Ogni fumatore vuole preparare la sigaretta e fumare, per farlo necessita di avere cartine, tabacco e fiammiferi;  
* Esiste un tabaccaio che possiede una quantità infinita di cartine, tabacco e fiammiferi;
* Ad ogni intervallo di tempo il tabaccaio
rende disponibili 2 dei 3 tipi di risorse che possiede (senza però assegnarli ai fumatori, poichè il tabaccaio non li conosce);
* Quando un fumatore riesce ad ottenere tutti
e 3 gli ingredienti si prepara la sigaretta e fuma, nel frattempo il tabaccaio resta in attesa.

## Analisi del problema
È abbastanza immediato individuare le entità principali del problema:
* i 3 fumatori verrano modellati come dei processi concorrenti;  
* il tabaccaio sarà un processo server;  
* sarà presente una terza entità dove il tabaccaio depositerà
le coppie di risorse e i fumatori preleveranno quest'ultime.

Utilizzando una terza entità si riesce a disaccoppiare il server dai client.

## Possibile soluzione
