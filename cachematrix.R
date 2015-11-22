## Put comments here that give an overall description of what your
## functions do
## 	create global matrix object (makeCacheMatrix)
##	compute inverse matrix for given argument (matrix created by makeCacheMatrix function)
##		if the matrix object is "new" -- calculation is performed
##		if the matrix was already calculated -- data loaded from cache and this information is printed
##
## not sure why this function is not able to overload itself
##	in the example if you associate same vector to makeCache... function
##	cachemean is able to identify this function and not calculate the mean
##	however in matrix it is unable to calculate this function


## just naming changes vs. example provided on project page

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## just small change to example provided on project page
##   - change in naming
##   - change in function Solve vs. mean

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
