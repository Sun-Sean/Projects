#function 1
statevector <- function(vector, matrix, state){
  new_state <- vector   
  for (times in 1:state) {
    new_state <- matrix%*%new_state
  }
  return(new_state)
}

#function 2
steadystate <- function(vector, matrix){
  i <- 0  
  testtruth <- TRUE 
  while (testtruth) {
    booleanvector <- (statevector(vector, matrix, i) == statevector(vector, matrix, i+1))
    testtruth <- !(all(booleanvector))
    i <- i+1
  }
  return(statevector(vector, matrix, i))
}
