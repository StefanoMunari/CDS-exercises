# - Sieve of Erathostenes -

The Sieve of Eratosthenes is method that is used to find the prime numbers
that are lower then a given number x.

## Componenti

There are several agents which executes concurrently to carry out the task.

+ **Odd**: passes all odd numbers lower than x to the first sieve;

+ **Sieve**: receives firstly a prime number p and then filters each number
  that can be divided for p, letting pass only the possible prime numbers to
  the next sieve.
