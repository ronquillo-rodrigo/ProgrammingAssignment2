## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL #This initializes to null the value of the inverse. The value can only be changed using the setMatrix() function.
        set <- function(y) {
                x <<- y 
                i <<- NULL #This restarts the value of the null. As it is in the parent directory, it is necessary to use <<-
        }
        get <- function() x #This is a one-line function that just returns the matrix that was originally used as a parameter
        setinverse <- function(inverse) i <<- inverse #This allows to set a value for the matrix
        getinverse <- function() i #This returns NULL if the inverse hasn't been stored in the object.
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse) #This returns the functions, what allows to get the objects x and i

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        i<-x$getinverse() #This retrieves the value of the getinverse() function of the argument x, which is makeCacheMatrix. 
        if(!is.null(i)){ #Checks if i was ever stored in the function.
                print("getting cached value") 
                return(x$getinverse()) #If it was, it returns the cached value without calculating the inverse
        }
        solve(x$get()) #If the inverse wasn't store, it calculates it and returns the result
}
