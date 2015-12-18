# - Cigarette Smokers -
This problem is about the synchronization among concurrent processes that are
trying to get a bunch of resources.

## Description

There are S Smokers and P Pushers (aka tobacconists) such as:
* Each Pusher can provide (N-1) out of N units of different resources, without
  give them directly to the Smokers since the Pusher does not know them;
* Each cigarette can be smoked if a Smoker has a unit of each of the N types of
  resources;
* Each Smoker initially owns an infinite amount of a resource type;
* Each Pusher has an infinite amount of each resource type;
* Each Smoker actually smoker a cigarette every time he is able to;
* Every time a cigarette is smoked, a Pusher can provide the next round of
  resources (otherwise he keeps waiting).

## Analysis

It's quite simple to determine the main entities of the problem:
* the S Smokers will be concurrent client tasks;
* the P Pushers will be concurrent server tasks;
* there will be a third entity, the table, where Pushers can put (N-1)
  resources on and Smokers can withdraw resources from.

The introduction of the table in the architecture allows us to decouple the
servers from the clients.
