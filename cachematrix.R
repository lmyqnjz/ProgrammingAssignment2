## This function creates a special "matrix" object that can cache its inverse
## Creates an environment for the matrix 
## solves the matrix or chaches the solution (if it was solved previously)

makeCacheMatrix = function(mat) {
  inverse.mat = solve(mat)
  x = list(matrix = mat,
           matrix.inverse = inverse.mat)
  class(x) = "cache.inverse.matrix"
  x
}

## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.
## Otherwise, it calculates the inverse of the data
## and sets the value of the inverse in the cache via the setmean function.

cacheSolve = function(obj){
  if(class(obj) == "cache.inverse.matrix")
    return(obj$matrix.inverse)
  else {
    x = makeCacheMatrix(obj)
    return(x$matrix.inverse)
  }
}
