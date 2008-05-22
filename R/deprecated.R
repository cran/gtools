## useful function, raises an error if the FLAG expression is FALSE
assert <- function( FLAG )
  {
    .Deprecated(new="stopifnot", package="base")
    stopifnot(FLAG)
  }
