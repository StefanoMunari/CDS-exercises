# No broker objects between barber and clients

In this solution no broker objects are used, but customers interact directly
with the semaphores exposed by the barber.

1. **Counter semaphore**: used to manage waiting queue;
2. **Mutex**: binary semaphore, used for ensuring mutual exclusion (mutex) in
the following situations:
  * access to the resource *barber shop* by a customer;
  * simulate the barber who sleeps waiting for a new customer to serve.

In order to avoid __starvation__ the waiting processes are put in a *FIFO*
queue. *FIFO* ensures fairness since the first process in the queue will be the
first to be served and therefore the first one that will get out of the queue.
