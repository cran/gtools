\name{gtools-defunct}
\alias{gtools-defunct}
\alias{assert}
\alias{addLast}
\title{Deprecated Functions in the gtools package}
\description{
  These functions are no longer available in gtools.
}
\usage{
assert(FLAG)
addLast(fun)
}
\arguments{
  \item{FLAG}{ Expression that should evaluate to a boolean vector}
  \item{fun}{Function to be called.}
}
\details{
  \itemize{
    \item{ \code{assert} is a defunct synonym for
      \code{\link[base]{stopifnot}}. }
    \item{ \code{addLast} has been replaced by \code{lastAdd}, which has
      the same purpose but appled using different syntax. }
  }
}
\seealso{
  \code{\link[base]{Defunct}}
  \code{\link[base]{stopifnot}}
  \code{\link[gtools]{lastAdd}}
}
\keyword{misc}
