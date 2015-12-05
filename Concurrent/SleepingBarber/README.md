# - Sleeping Barber -
The authorship of the problem is attributed to Dutch computer scientist
[Edsger Wybe Dijkstra](https://it.wikipedia.org/wiki/Edsger_Dijkstra), is
discussed from
[Andrew Tanenbaum](https://it.wikipedia.org/wiki/Andrew_Stuart_Tanenbaum) in
the book **Modern Operating Systems**.

The problem regards communication and synchronization between processes.

## Description
A barber owns a shop with *a single barber chair* and *N chairs* on which
customers can wait. If there are no clients in the shop, the barber sleeps on
his barber chair.

When the first client arrives the barber wakes up and begins to serve him.
If other customers arrive when the barber is at work, they sit on the free
seats.
If all seats are taken then the customer leaves the shop unserved.

![alt text](../../img/barber.png "Rappresentazione del barbiere sonnolento")

## Problem analysis
From the problem description an intuition arise about which entities we need to
model the whole system:
+ **Barber**: server task, offers a service (haircut) to clients;
+ **Customer**: client task.

Other elements that are present in the system are:
+ **N waiting chairs**: the maximum number of clients that can be queued;
+ **Barber chair**: could be a protected resource.

In the problem we have M processes (customers) that compete to have access to
the service offered from the barber, so we should ensure that every process
gets served in a finite amount of time (i.e. avoid starvation).
