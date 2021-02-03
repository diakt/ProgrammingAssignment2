# https://www.youtube.com/watch?v=FKyVNcEu94o&ab_channel=Ryan1085

# I mean, I have a pretty vanilla setup. I renamed a couple variables
# for personal pleasure solely, but the mechanics are pretty simple.
# Initially didn't realize that the workhorse method for the calculation
# is the cacheSolve method, which makes a lot of sense. Wouldn't want to 
# solve for 100 matrices off the bat if you only requested three.

makeCacheMatrix <- function(x = matrix()) {
        #call me cachey B
        storedInvert <- NULL
        
        #non cache methods.
        get <- function() {
                x
        }
        set <- function(y) {
                x <<- y
                storedInvert <<-
                        NULL              #resets w/new instantiation of var
        }
        
        #cache functions, lexical
        getInvert <- function() {
                storedInvert
        }
        
        setInvert <- function(passedInvert) {
                storedInvert <<- passedInvert
        }
        
        list(                                   #passes the "matrix" (list)
                get = get,
                set = set,
                getInvert = getInvert,
                setInvert = setInvert
        )
}

cacheSolve <- function(x, ...) {
        
        inverseMatrix <- x$getInvert() # this is either nothing or stored
        
        if (!is.null(inverseMatrix)) {      #it's already there, best case
                message("Getting the cached matrix") 
                return(inverseMatrix)           
        }
        data <- x$get()                 #if not found, does it itself
        
        inverseMatrix <- solve(data)    #thank goodness solve exists
                                        #thought I had to write it myself
        x$setInvert(inverseMatrix)          
        
        inverseMatrix                   # passes the inverse
        
        
        
        
        
        
        
        
        
        
}
