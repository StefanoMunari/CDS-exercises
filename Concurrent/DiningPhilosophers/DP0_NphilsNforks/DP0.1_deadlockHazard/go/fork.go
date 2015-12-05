package main

/**
  * A philosopher uses forks to eat.
  * Forks can be taken (by a philosopher at a time) and then released to be
  * taken again from one philosopher.
  */
type Fork struct {
  Take    chan bool
  Release chan bool
}

/**
  * A fork will be accessed by the two channels that exposes, Take and Release.
  * A fork that isn't taken can't be released and viceversa.
  */
func (self *Fork) Run() {
  var taken = false

  for {
    if taken {
      <- self.Release
      taken = false
    } else {
      <- self.Take
      taken = true
    }
  }
}

/**
  * Factory method for forks.
  */
func createFork() Fork {
  return Fork { make(chan bool), make(chan bool)}
}
