# Problemi progettuali di concorrenza  
# - Il crivello di Eratostene -  

Il crivello di Eratostene è un procedimento utilizzato
per verificare se un dato numero x è primo.    
Viene proposto un algoritmo che implementa il crivello
di Eratostene. L'implementazione dell'algoritmo è composta
da una parte concorrente che risolve il problema della sincronizzazione
su un buffer condiviso da parte degli n processi in esecuzione.  

## Componenti  

**Odd**: seleziona tutti i numeri dispari in un intervallo prefissato.  

**Sieve**: rileva, tra i numeri dispari ricevuti, quelli non divisibili per un numero primo noto.  
Sieve passa tutti i numeri non divisibili per il numero primo ricevuto al prossimo Sieve t.c. quest'ultimo utilizzi il primo passato come nuovo primo.  

Ogni processo Sieve opera come filtro per un numero primo noto < x
