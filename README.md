### Introduction

This second programming assignment will require you to write an R
function that is able to cache potentially time-consuming computations.
For example, taking the mean of a numeric vector is typically a fast
operation. However, for a very long vector, it may take too long to
compute the mean, especially if it has to be computed repeatedly (e.g.
in a loop). If the contents of a vector are not changing, it may make
sense to cache the value of the mean so that when we need it again, it
can be looked up in the cache rather than recomputed. In this
Programming Assignment you will take advantage of the scoping rules of
the R language and how they can be manipulated to preserve state inside
of an R object.

### Example: Caching the Mean of a Vector

In this example we introduce the `<<-` operator which can be used to
assign a value to an object in an environment that is different from the
current environment. Below are two functions that are used to create a
special object that stores a numeric vector and caches its mean.

The first function, `makeVector` creates a special "vector", which is
really a list containing a function to

1.  set the value of the vector - so instantiate matrix
2.  get the value of the vector - so get value of matrix, the return?
3.  set the value of the mean - so calculate invert
4.  get the value of the mean - return invert.

<!-- -->

    makeVector <- function(x = numeric()) {
            m <- NULL
            
            set <- function(y) {                    - the define mat
                    x <<- y
                    m <<- NULL
            }
            get <- function() x                     - the return mat
            setmean <- function(mean) m <<- mean    - the define invert
            getmean <- function() m                 - the return invert
            
            
            list(set = set, get = get,      - this is returned
                 setmean = setmean,
                 getmean = getmean)
    }
    
    I think it's important to note that both the gets have x and m
    I think this is about the function definition, the syntax of return
    I write these functions for the matrices, I can probably figure out
    how to calc the inverse of a matrix
    It will be a matrix passed, n'cest pas?
    Yeah, so dimensions a biggy. Invert no problem
    Not sure how this will be difficult, just a little playing
    The dependency of functions is a little strange
    Why not use getmean all the time, and just have it internally
    set a mean within the first object? 
    Maybe this is an actual downside of lexical scoping?
    The above is a matrix creator, so a call on that

The following function calculates the mean of the special "vector"
created with the above function. However, it first checks to see if the
mean has already been calculated. If so, it `get`s the mean from the
cache and skips the computation. Otherwise, it calculates the mean of
the data and sets the value of the mean in the cache via the `setmean`
function.
        
     Oh, the second one is the bossy mom
     It calls, and it initially sees nothing
     It TELLS the first function to set its mean
     Next time, it won't receive a null on request
     
     I imagine this could mildly save some computational time
     If the object is never called, it would be a waste to precalc it
     Like first object creates all these values ahead of time
     100 objects, could be 1000 calcs per to prebake all means
     If only calls three of them, knows afterward, quite efficient.
     Cool, this is cool.

    cachemean <- function(x, ...) {
            m <- x$getmean() - this is either nothing or stored
            if(!is.null(m)) { - if there is a cached data return
                    message("getting cached data") - it already knows
                    return(m)
            }
            data <- x$get()
            m <- mean(data, ...)
            x$setmean(m)            - 
            m                       - this is the eventual passed invert []
    }

### Assignment: Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly (there are also alternatives to matrix inversion that we will
not discuss here). Your assignment is to write a pair of functions that
cache the inverse of a matrix.

Write the following functions:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

Computing the inverse of a square matrix can be done with the `solve`
function in R. For example, if `X` is a square invertible matrix, then
`solve(X)` returns its inverse.

For this assignment, assume that the matrix supplied is always
invertible.

In order to complete this assignment, you must do the following:

1.  Fork the GitHub repository containing the stub R files at
    [https://github.com/rdpeng/ProgrammingAssignment2](https://github.com/rdpeng/ProgrammingAssignment2)
    to create a copy under your own account.
2.  Clone your forked GitHub repository to your computer so that you can
    edit the files locally on your own machine.
3.  Edit the R file contained in the git repository and place your
    solution in that file (please do not rename the file).
4.  Commit your completed R file into YOUR git repository and push your
    git branch to the GitHub repository under your account.
5.  Submit to Coursera the URL to your GitHub repository that contains
    the completed R code for the assignment.

### Grading

This assignment will be graded via peer assessment.
