% $Id: scat.Rd,v 1.3 2005/09/12 15:44:14 nj7w Exp $

\name{scat}
\alias{scat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Display debugging text}
\description{
  If \code{getOption('DEBUG')==TRUE}, write text to STDOUT and flush so
  that the text is immediatly displayed. Otherwise, do nothing.
}

\usage{
scat(...)
}
\arguments{
  \item{\dots}{Arguments passed to \code{cat}}
}
\value{
  NULL (invisibly)
}
\author{Gregory R. Warnes \email{gregory.r.warnes@pfizer.com}}
\seealso{ \code{\link[base]{cat}}}
\examples{
options(DEBUG=NULL) # makee sure DEBUG isn't set
scat("Not displayed")

options(DEBUG=TRUE)
scat("This will be displayed immediately (even in R BATCH output \n")
scat("files), provided options()$DEBUG is TRUE.")
}
\keyword{print}
