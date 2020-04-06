## I simply set the input x as a matrix
## and then set the solved value "v" as a null
## then I changed every reference to "mean" to "solve"
makeCacheMatrix <- function(x = matrix(rnorm(16),4,4)) {
  v <- NULL
  set <- function(y) {
    x <<- y
    v <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) v <<- solve
  getsolve <- function() v
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
##
## Same here, changed "mean" to "solve" and "m" to "v"
cacheSolve <- function(x, ...) {
  v <- x$getsolve()
  if(!is.null(v)) {
    message("getting inversed matrix")
    return(v)
  }
  data <- x$get()
  v <- solve(data, ...)
  x$setsolve(v)
  v
}


# ---------------Checking the program------------------------
## p <- matrix(rnorm(16),4,4)
## m1 <- makeCacheMatrix(p)
## cacheSolve(m1)

