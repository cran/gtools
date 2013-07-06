addLast <- function( fun )
  {
    .Deprecated(new=paste(".Last <- lastAdd(", deparse(substitute(fun)), ")", sep=''),
                package='gtools'
                )
    
    if (!is.function(fun)) stop("fun must be a function")
    if (!exists(".Last", envir = .GlobalEnv)) 
      assign(".Last", fun, envir = .GlobalEnv)
    else
      {
        Last <- get(".Last", envir = .GlobalEnv)
        newfun <- function(...) {
            fun()
            Last()
        }
        assign(".Last", newfun, envir = .GlobalEnv)
      }
  }

lastAdd <- function( fun )
  {
    if (!is.function(fun)) stop("fun must be a function")
    if(!exists(".Last", envir=.GlobalEnv))
      {
        return(fun)
      }
    else
      {
        Last <- get(".Last", envir=.GlobalEnv)
        newfun <- function(...)
          {
            fun()
            Last()
          }
        return(newfun)
      }
  }

