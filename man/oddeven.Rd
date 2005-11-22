% $Id: oddeven.Rd,v 1.4 2005/12/01 16:50:14 nj7w Exp $
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
\author{ Gregory R. Warnes \email{gregory.r.warnes@pfizer.com}}
\seealso{ \code{\link[base]{round}} }
\examples{

odd(4)
even(4)

odd(1:10)
even(1:10)

}
\keyword{arith}
