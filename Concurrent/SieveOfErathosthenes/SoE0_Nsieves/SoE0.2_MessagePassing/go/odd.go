package main

import "fmt"

/**
  * Odd agent pushes odd numbers till limit (constant).
  **/
func Odd() {
  var pushToSieve = make(chan int)
  var ack = make(chan bool)
  go Sieve(pushToSieve, ack)
  for i := 3; i < limit; i = i + 2 {
    fmt.Println("Odd pushes", i)
    pushToSieve <- i
  }
  pushToSieve <- sentinel
  <- ack
}
