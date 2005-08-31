# $Id: scat.R,v 1.2 2005/06/09 14:20:29 nj7w Exp $

# cat to stdout and immediately flush
scat <- function(...)
  {
    DEBUG <- options()$DEBUG
    if( !is.null(DEBUG) && DEBUG)
      {
        cat("### ", file=stderr())
        cat(..., file=stderr())
        cat(" ###\n", file=stderr())
        flush(stderr())
      }
    invisible(NULL)
  }
