addLast <- function( fun )
  {
    if (!is.function(fun)) stop("fun must be a function")
    if(!exists(".Last", env=.GlobalEnv))
      assign(".Last", fun, env=.GlobalEnv)
    else
      {
        Last <- get(".Last", env=.GlobalEnv)
        newfun <- function(...)
          {
            fun()
            Last()
          }
        assign(".Last", newfun, env=.GlobalEnv)
      }
  }
