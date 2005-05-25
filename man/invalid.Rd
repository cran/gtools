% $Id: invalid.Rd,v 1.2 2005/04/01 23:00:50 warnes Exp $
%
\name{invalid}
\alias{invalid}
\title{Test if a value is missing, empty, or contains only NA or NULL values}
\description{ 
  Test if a value is missing, empty, or contains only NA or NULL values.
}
\usage{
invalid(x)
}
\arguments{
  \item{x}{value to be tested}
}
%\details{
%}
\value{
  Logical value.
}
\author{Gregory R. Warnes \email{Gregory\_R\_Warnes@groton.pfizer.com} }
\seealso{ \code{\link[base]{missing}}, \code{\link[base]{is.na}},
  \code{\link[base]{is.null}} }
\examples{

invalid(NA)
invalid()
invalid(c(NA,NA,NULL,NA))

invalid(list(a=1,b=NULL))

# example use in a function
myplot <- function(x,y) {
                if(invalid(y)) {
                        y <- x
                        x <- 1:length(y)
                }
                plot(x,y)
        }
myplot(1:10)
myplot(1:10,NA)
}
\keyword{programming}
