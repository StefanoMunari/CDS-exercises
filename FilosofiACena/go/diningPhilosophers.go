package main

/**
  * Number of dining philosophers.
  *
  * Modify this parameter to add more philosophers to the table.
  */
const philNumber = 5

/**
  * Naive implementation of the dining philosophers problem that can lead to
  * a deadlock.
  *
  * This situation occurs when all the instantiated philosophers take the
  * right fork before that one of them is able to grab the left one.
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
  Phil(0, &forks[0], &forks[1])
}
