## useful function, raises an error if the FLAG expression is FALSE
assert <- function( FLAG )
  {
    if(!all(FLAG))
      stop("Failed Assertion") 
  }
