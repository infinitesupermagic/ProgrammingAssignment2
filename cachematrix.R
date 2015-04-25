## These two functions work together to create a cache of a matrix.
## One function is a list of functions that manipulate the matrix
## The other function grabs the cache or creates a cache 

## This function is a list of functions that receives a matrix as in an put
## It can perform a set, get, setsolve and getsolve function 

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## This function takes a makeCacheMatrix function as input
## checks and grabs the cached Matrix, otherwise, creates a cached Matrix

cachesolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
