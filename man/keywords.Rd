\name{keywords}
\alias{keywords}
\title{List valid keywords for R man pages}
\description{
  List valid keywords for R man pages
}
\usage{
keywords(...)
}
\arguments{
  \item{\dots}{Optional argumenst to pass to show.file()}
}
\details{
  This function simply determines the path \$RHOME/doc/KEYWORDS and calls
  show.file() to display it.
}
\value{
  Nothing of interest.
}
\author{Gregory R. Warnes \email{greg@random-technologies-llc.com}}
\seealso{ \code{\link[utils]{help}} }
\examples{
keywords()
}
\keyword{documentation}
