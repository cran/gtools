\name{assert}
\alias{assert}
\title{Generate an error if an expression is not true.}
\description{
  Generate an error if an expression is not true.
}
\usage{
assert(FLAG)
}
\arguments{
  \item{FLAG}{ Expression that should evaluate to a boolean vector}
}
\details{
  Assert generate an error if its aregument does not evaluate to 
  boolean (vector) containing only \code{TRUE} values.  This is useful
  for defensinve programming as it provides a mechanism for checking
  that certain facts, the 'assertions', do in fact hold.  Checking of 
  'assertions' is an important tool in the development of robust program
  code.
}
\value{
  None.  Evaluated only for its side effect.
}
\author{Gregory R. Warnes \email{gregory.r.warnes@pfizer.com} }
\seealso{ \code{\link[base]{stop}}, \code{\link[base]{warning}} }
\examples{

## Trivial example
posSqrt <- function(x)
  {
    assert(x>=0)
    sqrt(x)
  }

posSqrt(1:10) # works fine, no messages
\dontrun{
posSqrt(-5:5) # generates an error, since the asssertion is not met
}


}
\keyword{programming}
