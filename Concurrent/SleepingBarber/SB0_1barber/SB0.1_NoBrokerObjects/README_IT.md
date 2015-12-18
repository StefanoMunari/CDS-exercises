# Nessun intermediario tra barbiere e clienti

Nella soluzione implementata sono stati utilizzate 2 tipologie differenti
di semafori:

1. **Semaforo contatore**: è stato utilizzato per gestire la coda di clienti in
attesa;
2. **Mutex**: è un semaforo binario, è stato utilizzato per garantire mutua
esclusione (mutex) nei seguenti casi:
  * accesso alla risorsa *negozio del barbiere* da parte del cliente;
  * per simulare il barbiere che dorme attendendo su un mutex *cliente*.

Al fine di evitare *starvation* è stata applicata una politica *FIFO* ai
processi in coda per il servizio del barbiere. *FIFO* garantisce
fairness in quanto il primo processo in coda sarà anche il primo ad essere
servito e quindi ad uscire dalla coda.