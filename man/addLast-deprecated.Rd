\name{addLast-deprecated}
\alias{addLast-deprecated}
\title{Add a function to be executed when R exits.}
\description{
  Add a function to be executed when R exits.
}
\usage{
addLast(fun)
}
\arguments{
  \item{fun}{Function to be called.}
}
\details{
  \code{addLast} defines the \code{.Last} function in the global
  environment (if not already present) or redifines it so that the
  function \code{fun} will be called when R exits.  The latter is
  accomplished by saving the current definition of \code{.Last} and
  creating a new \code{.Last} function that calls \code{fun} and then
  the original \code{.Last} function.
}
\value{
  None.
}
\note{This function has been deprecated in favor of \code{lastAdd}
  because it creates/modifies the definition of '.Last' in the
  global environment, which is expressly disallowed by the CRAN
  policies. }
\author{Gregory R. Warnes \email{greg@warnes.net}}
\seealso{
  \code{\link[base]{.Last}},
  \code{\link[gtools]{lastAdd}}
}
\examples{

## Print a couple of cute messages when R exits.
helloWorld <- function() cat("\nHello World!\n")
byeWorld <- function() cat("\nGoodbye World!\n")

addLast(byeWorld)
addLast(helloWorld)

\dontrun{
q("no")

## Should yield:
##
##   Save workspace image? [y/n/c]: n
##
##   Hello World!
##
##   Goodbye World!
##
##   Process R finished at Tue Nov 22 10:28:55 2005
}

## Unix-flavour example: send Rplots.ps to printer on exit.
myLast <- function()
{
  cat("Now sending PostScript graphics to the printer:\n")
  system("lpr Rplots.ps")
  cat("bye bye...\n")
}
addLast(myLast)
\dontrun{
quit("yes")

## Should yield:
##
##  Now sending PostScript graphics to the printer:
##  lpr: job 1341 queued
##  bye bye...
##
##   Process R finished at Tue Nov 22 10:28:55 2005
}

}
\keyword{programming}

