package main

/**
  * Number of dining philosophers.
  *
  * Modify this parameter to add more philosophers to the table.
  */
const philNumber = 5

/**
  * Implementation of the dining philosophers problem that fixes the deadlock
  * problem with an algorithmic approach.
  *
  * Instead of having only right-handed philosophers, we introduce a
  * left-handed philosopher that wait for the left fork before of taking the
  * right one.
  */
func main() {
  var forks [philNumber]Fork
  for i := 0; i < philNumber; i++ {
    forks[i] = createFork()
    go forks[i].Run()
  }
  for i := 1; i < philNumber; i++ {
    go Phil(i, &forks[i], &forks[(i+1)%philNumber])
  }
  LeftHandedPhil(0, &forks[0], &forks[1])
}
