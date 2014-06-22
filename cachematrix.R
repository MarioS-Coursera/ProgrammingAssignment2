## Functions for caching the inverse of a matrix. 
## With the function makeCacheMatrix a matrix object is created that can hold data of its inverse. 
## The cacheSolve function takes this matrix object and returns the cached inverse matrix data. 
## If the cache is invalid, due to a change of the matrix data, the inverse will be recomputed and stored in the cache.


## This function creates a matrix with a cachable inverse
## To use it, pass a invertible matrix to the function makeCacheMatrix 
makeCacheMatrix <- function(x = matrix()) {
    ## create object for storing the inverse matrix
    cachedInverse <- NULL
    
    ## function returns the data stored in the matrix object
    getMatrix <- function() x 
    
    ##function for updating the matrix data
    setMatrix <- function(xNew){ 
        ## store the new matrix values in th
        x <<- xNew 
        ## make cache invalid
        cachedInverse <<- NULL
    }
    
    ## returns the cached inverse. In case the inverse is invalid the function will return NULL
    getInverse <- function() cachedInverse
    
    ## function for updating the inverse data of the matrix
    setInverse <- function(newInverse) cachedInverse <<- newInverse
    
    
    ## returns an list object with functions for accessing the matrix and inverse matrix data   
    list(setMatrix=setMatrix, 
         getMatrix=getMatrix, 
         setInverse=setInverse, 
         getInverse=getInverse)
}


## This function returns the cached inverse of an matrix object. 
## If the matirx was altered the new inverse will be computed and the cache will be updated before returning the inverse matrix
cacheSolve <- function(x, ...) {
    ## get the inverse and check if the cached data is still valid
    inverse <- x$getInverse()
    if(!is.null(inverse)){
        print("Getting cached data")
        ## return the cached inverse matrix
        return(m)
    }
    ## in case the data is invalid recompute the inverse
    matrix <- x$getMatrix()
    inverse <- solve(matrix, ...)
    ## update the cache data ...
    x$setInverse(inverse)
    ## and return the resulting inverse matrix
    return(inverse)
    
}
