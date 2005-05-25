% $Id: oddeven.Rd,v 1.2 2005/04/01 23:00:50 warnes Exp $
%
\name{odd}
\alias{odd}
\alias{even}
\title{Detect odd/even integers }
\description{
 detect odd/even integers
}
\usage{
odd(x)
even(x)
}
\arguments{
  \item{x}{ vector of integers }
}
\value{
  Vector of TRUE/FALSE values.
}
\author{ Gregory R. Warnes \email{Gregory\_R\_Warnes@groton.pfizer.com}}
\seealso{ \code{\link[base]{round}} }
\examples{

odd(4)
even(4)

odd(1:10)
even(1:10)

}
\keyword{arith}
