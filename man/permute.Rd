% $Id: permute.Rd 1325 2009-05-09 03:13:19Z warnes $
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
\author{ Gregory R. Warnes \email{greg@random-technologies-llc.com} }
\seealso{ \code{\link{sample}} }

\examples{
  x <- 1:10
  permute(x)
}
\keyword{distribution}
