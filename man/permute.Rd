% $Id: permute.Rd,v 1.2 2005/04/01 23:00:50 warnes Exp $
%
\name{permute}
\alias{permute}
\title{Randomly Permute the Elements of a Vector}
\description{
  Randomly Permute the elements of a vector
}
\usage{
permute(x)
}
\arguments{
  \item{x}{ Vector of items to be permuted }
}
\details{
  This is simply a wrapper function for \code{\link{sample}}.
}
\value{
  Vector with the original items reordered.
}
\author{ Gregory R. Warnes \email{gregory\_r\_warnes@groton.pfizer.com} }
\seealso{ \code{\link{sample}} }

\examples{
  x <- 1:10
  permute(x)
}
\keyword{distribution}
