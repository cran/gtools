% $Id: oddeven.Rd 1325 2009-05-09 03:13:19Z warnes $
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
\author{ Gregory R. Warnes \email{greg@random-technologies-llc.com}}
\seealso{ \code{\link[base]{round}} }
\examples{

odd(4)
even(4)

odd(1:10)
even(1:10)

}
\keyword{arith}
