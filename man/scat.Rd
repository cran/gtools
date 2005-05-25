% $Id: scat.Rd,v 1.1 2005/04/07 00:28:57 warnes Exp $

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
\author{Gregory R. Warnes \email{gregory\_r\_warnes@groton.pfizer.com}}
\seealso{ \code{\link[base]{cat}}}
\examples{
options(DEBUG=NULL) # makee sure DEBUG isn't set
scat("Not displayed")

options(DEBUG=TRUE)
scat("This will be displayed immediately (even in R BATCH output \n")
scat("files), provided options()$DEBUG is TRUE.")
}
\keyword{print}
