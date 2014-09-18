## This function will aid in the process of matrix inversion
## by using the two funciton below to cache the matrix inversion
## It wll also later check if the inversion of a matrix has 
## already been cached when the operation is called and return
## the cached value instead of recalculating it.

## This function will take the passed vector and assign it to
## a global variable as well as creating the other functions
## necessary setting and retrieving the inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
## get function simply returns the matrix
  get <- function() x
## function takes the value passed and stores to global variable
  setsolve <- function(solve) m <<- solve
## function returns the value of the global variable used to 
## store the inverse
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## function checks if m has a value stored already. If not
## it will calculate the inverse and store that value in the 
## global variable using the functions created in 
## makeCacheMatrix.

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setsolve(m)
    
  ## Return a matrix that is the inverse of 'x'
  m
}
