## Put comments here that give an overall description of what your
## functions do

## The function below returns a set of functions that does the following 
## setMat <- sets value of matrix
## getMat <- gets value of matrix
## getInv <- gets inverse of matrix (cached value if available) 
## cacheInv <- Caches the inverse 


makeCacheMatrix <- function(x = matrix()) {
	cache <- NULL
	setMat <- function(newVal) {
		x <<- newVal
		cache <<- NULL
	}
	getMat <- function() {
                x
        }
	cacheInv <- function(solve) {
             cache <<- solve
        }
        
      getInv <- function() {
                cache
        }
	list(setMat = setMat, getMat = getMat, cacheInv = cacheInv, getInv = getInv)
}


## This caculates and returns the inverse of the matrix  

cacheSolve <- function(x, ...) {
	inverse <- x$getInv()
	if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
  	  data <- x$getMat()
        inverse <- solve(data)
        x$cacheInv(inverse)

	 inverse	
 
}
