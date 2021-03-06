% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oddeven.R
\name{oddeven}
\alias{oddeven}
\alias{odd}
\alias{even}
\title{Detect odd/even integers}
\usage{
odd(x)

even(x)
}
\arguments{
\item{x}{vector of integers}
}
\value{
Vector of TRUE/FALSE values.
}
\description{
detect odd/even integers
}
\examples{


odd(4)
even(4)

odd(1:10)
even(1:10)
}
\seealso{
\code{\link[base]{round}}
}
\author{
Gregory R. Warnes \email{greg@warnes.net}
}
\keyword{arith}
