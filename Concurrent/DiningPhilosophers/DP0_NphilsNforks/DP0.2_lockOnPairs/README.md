# Lock on pairs of forks

This solution has a monitor (called `TableMonitor`) in a way that allows to execute ⌊n/2⌋ parallel processes avoiding starvation, deadlock and busy wait.

This can be achieved taking the lock only on the pairs of forks, since every philosopher worries about locking only the forks he needs.
