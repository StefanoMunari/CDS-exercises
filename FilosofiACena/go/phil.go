package main

import (
  "fmt"
)

/**
  * Simple version of the philosopher.
  * Since he is right-handed, the first fork that it takes is the right one.
  *
  * He communicates when it wants to eat, when he is actually eating and when
  * he finishes to eat (and releases the two forks).
  */
func Phil (id int, left *Fork, right *Fork) {
  for {
    fmt.Println("Requesting forks... -", id)
    right.Take <- true
    left.Take <- true
    fmt.Println("Eating... -", id)
    right.Release <- true
    left.Release <- true
    fmt.Println("Finished... -", id)
  }
}
