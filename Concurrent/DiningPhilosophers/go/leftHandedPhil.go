package main

import (
  "fmt"
)

/**
  * Variant of the canonical philosopher agent.
  * Since he is left-handed, the first fork that it takes is the left one.
  *
  * He communicates when it wants to eat, when he is actually eating and when
  * he finishes to eat (and releases the two forks).
  */
func LeftHandedPhil (id int, left *Fork, right *Fork) {
  for {
    fmt.Println("Requesting forks... -", id)
    left.Take <- true
    right.Take <- true
    fmt.Println("Eating... -", id)
    right.Release <- true
    left.Release <- true
    fmt.Println("Finished... -", id)
  }
}
