makeCacheMatrix = function(mat) {
  inverse.mat = solve(mat)
  x = list(matrix = mat,
           matrix.inverse = inverse.mat)
  class(x) = "cache.inverse.matrix"
  x
}


cacheSolve = function(obj){
  if(class(obj) == "cache.inverse.matrix")
    return(obj$matrix.inverse)
  else {
    x = makeCacheMatrix(obj)
    return(x$matrix.inverse)
  }
}
