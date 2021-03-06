#' Test if a value is missing, empty, contains only NA or NULL values, or is a try-error.
#'
#' Test if a value is missing, empty, contains only NA or NULL values, or is a try-error.
#'
#'
#' @param x value to be tested
#' @return Logical value.
#' @author Gregory R. Warnes \email{greg@@warnes.net}
#' @seealso \code{\link[base]{missing}}, \code{\link[base]{is.na}},
#' \code{\link[base]{is.null}}
#' @keywords programming
#' @examples
#'
#'
#' invalid(NA)
#' invalid()
#' invalid(c(NA, NA, NULL, NA))
#'
#' invalid(list(a = 1, b = NULL))
#'
#' x <- try(log("A"))
#' invalid(x)
#'
#' # example use in a function
#' myplot <- function(x, y) {
#'   if (invalid(y)) {
#'     y <- x
#'     x <- 1:length(y)
#'   }
#'   plot(x, y)
#' }
#' myplot(1:10)
#' myplot(1:10, NA)
#' @importFrom methods is
#'
#' @export
invalid <- function(x) {
  if (missing(x) || is.null(x) || length(x) == 0 || is(x, "try-error")) {
    return(TRUE)
  }
  if (is.list(x)) {
    return(all(sapply(x, invalid)))
  } else if (is.vector(x)) {
    return(all(is.na(x)))
  } else {
    return(FALSE)
  }
}
