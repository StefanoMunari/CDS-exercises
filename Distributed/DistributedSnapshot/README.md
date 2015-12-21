# - Distributed Snapshot -

This algorithm was designed by
[K. Mani Chandy](https://en.wikipedia.org/wiki/K._Mani_Chandy) and
[Leslie Lamport](https://en.wikipedia.org/wiki/Leslie_Lamport) to record a
consistent global state of a distributed system.

## Description

The system which the snapshot is took over works by message passing and not by
memory sharing. Therefore, a global state is composed of the state of the
single processes and the messages that are being sent over the network.

A Distributed Snapshot is took over a *consistent* state of a system. The word
consistent stands for a state that is possible to happen, i.e. no messages are
received before they are sent.

## Problem analysis

The snapshot that is took is very similar to a photography of a [birds flock](http://www.citemaster.net/get/e079492a-7aea-11e4-8773-00163e009cc7/10.1.1.119.7694.pdf). It's not important to freeze the system --
several images can be joined to shape the overall picture.

Thus, a marker of beginning is sent over the network and every process that
receives it stops itself and record its internal state. Before receiving the
end marker, every received message is recorded and not forwarded/read.

After the end marker gets received, the process can continue its work, as if
nothing had happened.
