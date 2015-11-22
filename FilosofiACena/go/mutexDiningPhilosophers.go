package main

/**
  * Number of dining philosophers.
  *
  * Modify this parameter to add more philosophers to the table.
  */
const philNumber = 5

/**
  * Struct that implements a Dijkstra's mutual exclusion semaphore.
  */
type Mutex struct {
  P chan bool
  V chan bool
}

/**
  * Mutex semaphore implementation: the resource can only be accessed by one
  * agent at a time.
  */
func (self *Mutex) Run() {
  var free = true

  for {
    if free {
      <- self.P
      free = false
    } else {
      <- self.V
      free = true
    }
  }
}

/**
  * Mutex implementation of the dining philosophers problem, which fixes the
  * deadlock problem.
  *
  * Every philosopher is given access to a shared Dijkstra's semaphore to
  * prevent multiple access to the table while grabbing the forks.
  *
  * Even this is a deadlock-free solution, it isn't very efficient since a
  * philosopher blocks the whole table instead of his adjacent neighbours.
  */
func main() {
  var giantLock = Mutex{ make(chan bool), make(chan bool) }
  go giantLock.Run()

  var forks [philNumber]Fork
  for i := 0; i < philNumber; i++ {
    forks[i] = createFork()
    go forks[i].Run()
  }
  for i := 1; i < philNumber; i++ {
    go MutexPhil(i, &forks[i], &forks[(i+1)%philNumber], &giantLock)
  }
  MutexPhil(0, &forks[0], &forks[1], &giantLock)
}
