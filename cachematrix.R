## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix builds a set of functions and returns the 
##functions within a list to the parent environment.

makeCacheMatrix <- function(x = matrix()) {
     m=NULL
     set<-function(y){
       x<<-y
       m<<-NULL
     }
     get<-function() x
     setinv<-function(inv) m<<-inv
     getinv<-function() m
     list(set=set,get=get,setinv=setinv,getinv=getinv)
}


## cacheSolve retrieves the inverse of the matrix or performs the calculation

cacheSolve <- function(x, ...) {
m<-x$getinv()
if (!is.null(m)) {
message("getting cached data")
return(m)
}
data <- x$get()
m <- solve(data, ...)
 x$setinv(m)
 m
        ## Return a matrix that is the inverse of 'x'
}
