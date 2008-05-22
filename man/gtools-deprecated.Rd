\name{gtools-deprecated}
\alias{gtools-deprecated}
\alias{assert}
\title{Deprecated Functions in the gtools package}
\description{
  These functions are provided for compatibility with older versions of
  gtools, and may be defunct as soon as the next release.
}
\usage{
assert(FLAG)
}
\arguments{
  \item{FLAG}{ Expression that should evaluate to a boolean vector}
}
\details{
  The original help page for these functions is often
  available at \code{help("oldName-deprecated")} (note the quotes).

  \code{assert} is a deprecated synonym for \code{\link[base]{stopifnot}}.
}
\seealso{
  \code{\link{Deprecated}} }
}
\keyword{misc}
