# - Dining Philosophers -

The problem was defined by the famous Dutch computer scientist
[Edsger Wybe Dijkstra](https://it.wikipedia.org/wiki/Edsger_Dijkstra),
winner of the 1972's Turing Award.
The problem is about managing concurrency, specifically when dealing with
concurrent processes which wants access the same resources at the same time.

## Description

* N philosophers are sat around a round table
* Each philosopher has a fork on his right and a plate in front of him
* Each philosopher continues to think, eat and then repeat the routine
* Each philosopher needs 2 forks to eat

![alt text](../../img/filosofi.jpg "Figure with dining philosophers")


## Problem analysis

Every philosopher can be represented as a process (or an agent) that must
satisfy some constraints (get each one of the forks) to accomplish a given task
(eating).
After a brief analysis, it turns out that with five dining philosophers only
two of them can eat at the same time.
Taking a further step, we can say that if we have __n__ philosophers/processes,
with n>=4, then the solution can be done with ⌊n/2⌋ agents that eat/execute at
the same time.
A good parallel solution needs to take in account some concurrency risks. A
good concurrent solution has to avoid:
* deadlocks (there must be at least one process that can proceed with its job);
* starvation (every process should be able to do its job);
* polling or busy waiting (processes must not occupy the CPU for a long time
  without carrying out their job).

## A first (almost) good solution -- Peterson's algorithm

A possible solution to get rid of the problem is to apply the
dell'[Peterson's algorithm](https://it.wikipedia.org/wiki/Algoritmo_di_Peterson).
Peterson's algorithm is also known as *Filter Algorithm*.

## Discussing Peterson's algorithm application

This solution comply with the first two requirements of a good solution, i.e.
absence of deadlocks and absence of starvation.
However there is busy wait because every process occupies the CPU even where
there is no need of.
