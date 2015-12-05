package main

import "fmt"

/**
  * Sieve agents receive a prime number and then passes to the next Sieve the
  * remaining numbers which are not divisible for the received prime.
  **/
func Sieve(get chan int, ack chan bool) {
  prime := <- get
  fmt.Println("Found prime number", prime)
  n := <- get
  var passDown = make(chan int)
  var ackUnder = make(chan bool)
  if n != sentinel {
    go Sieve(passDown, ackUnder)
  } else {
    ack <- true
  }
  for ; n != sentinel; n = <- get {
    if (n % prime) != 0 {
      passDown <- n
    }
  }
  passDown <- sentinel
  <- ackUnder
  ack <- true
}
