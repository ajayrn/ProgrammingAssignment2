## Put comments here that give an overall description of what your
## functions do

## The function below returns a set of functions that does the following 
## setMat <- sets value of matrix
## getMat <- gets value of matrix
## getInv <- gets inverse of matrix (cached value if available) 
## cacheInv <- Caches the inverse 


makeCacheMatrix <- function(x = matrix()) {

        # initial value of cache and also it should be NULL when nothing is cached
	cache <- NULL
	
	# set up the matrix 
	setMat <- function(newVal) {
		x <<- newVal
		cache <<- NULL  #as matrix is assigned a new value, cache should be null 
	}
	
	#return the matrix 
	getMat <- function() {
                x
        }
        
        #Cache whatever is passed to this function 
	cacheInv <- function(solve) {
             cache <<- solve
        }
        
        #Obtain from cache  
      getInv <- function() {
                cache
        }
        #this function returns a list of functions, give each element a name
	list(setMat = setMat, getMat = getMat, cacheInv = cacheInv, getInv = getInv)
}


## This caculates and returns the inverse of the matrix  

cacheSolve <- function(x, ...) {
	#first try to get the inverse from cache 
	inverse <- x$getInv()
	
	#if exists, return it 
	if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        #if value is not in cache, calculate the inverse and cache it for future 
  	data <- x$getMat()
        inverse <- solve(data)
        x$cacheInv(inverse)
        
        #finally return the inverse - only applicable if cache doesn't exist 
        inverse	
 
}
