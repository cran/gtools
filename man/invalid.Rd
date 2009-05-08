% $Id: invalid.Rd 1325 2009-05-09 03:13:19Z warnes $
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
\author{Gregory R. Warnes \email{greg@random-technologies-llc.com} }
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
