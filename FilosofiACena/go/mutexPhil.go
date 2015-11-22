package main

import (
  "fmt"
)

/**
  * Right-handed version of the philosopher in which he must be the only one
  * capable of taking forks from the table.
  *
  * He communicates when it wants to eat, when he is actually eating and when
  * he finishes to eat (and releases the two forks).
  */
func MutexPhil (id int, left *Fork, right *Fork, mutex *Mutex) {
  for {
    fmt.Println("Requesting forks... -", id)
    mutex.P <- true
    right.Take <- true
    left.Take <- true
    mutex.V <- true
    fmt.Println("Eating... -", id)
    right.Release <- true
    left.Release <- true
    fmt.Println("Finished... -", id)
  }
}
