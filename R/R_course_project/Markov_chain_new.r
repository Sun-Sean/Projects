steady_state <- function(a_matrix){
  ei <- eigen(a_matrix)
  val <- ei$values #eigen values
  P <- ei$vectors 
  P_inv <- solve(P) #inverse of matrix eigen vectors
  #create a diagonal matrix 
  l <- length(val)
  diagonal_mat <- matrix(0,l,l)
  for(i in 1:l){
    for(j in 1:l){
      if(i == j){
        diagonal_mat[i,j] <- val[i]
      }
    } 
  }
  #create func for matrix multiplication
  mat_mult_func <- function(times,b_matrix){
    ans <- b_matrix
    for(i in 1:times)
      ans <- ans %*% b_matrix
    return(ans)
  }
  count <- 1
  ans_mat <- P %*% diagonal_mat %*% P_inv
  next_mat <- P %*% mat_mult_func(count+1,diagonal_mat) %*% P_inv
  # find the steady state
  while(TRUE){
  if(all((ans_mat == next_mat))){
    break
  } else{
    ans_mat <- next_mat
    count = count + 1
  }
  }
  return(ans_mat[,1])
}
