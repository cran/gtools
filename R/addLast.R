addLast <- function( fun )
  {
    if (!is.function(fun)) stop("fun must be a function")
    if(!exists(".Last", envir=.GlobalEnv))
      assign(".Last", fun, envir=.GlobalEnv)
    else
      {
        Last <- get(".Last", envir=.GlobalEnv)
        newfun <- function(...)
          {
            fun()
            Last()
          }
        assign(".Last", newfun, envir=.GlobalEnv)
      }
  }
