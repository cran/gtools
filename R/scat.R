# $Id: scat.R,v 1.1 2005/04/07 00:28:57 warnes Exp $

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
