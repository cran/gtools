#' Define a macro
#'
#' \code{defmacro} define a macro that uses R expression replacement
#'
#' \code{strmacro} define a macro that uses string replacement
#'
#'
#' \code{defmacro} and \code{strmacro} create a macro from the expression given
#' in \code{expr}, with formal arguments given by the other elements of the
#' argument list.
#'
#' A macro is similar to a function definition except for handling of formal
#' arguments.  In a function, formal arguments are simply variables that
#' contains the result of evaluating the expressions provided to the function
#' call.  In contrast, macros actually modify the macro body by
#' \emph{replacing} each formal argument by the expression (\code{defmacro}) or
#' string (\code{strmacro}) provided to the macro call.
#'
#' For \code{defmacro}, the special argument name \code{DOTS} will be replaced
#' by \code{...} in the formal argument list of the macro so that \code{...} in
#' the body of the expression can be used to obtain any additional arguments
#' passed to the macro. For \code{strmacro} you can mimic this behavior
#' providing a \code{DOTS=""} argument.  This is illustrated by the last
#' example below.
#'
#' Macros are often useful for creating new functions during code execution.
#'
#' @aliases defmacro strmacro
#' @param \dots macro argument list
#' @param expr R expression defining the macro body
#' @param strexpr character string defining the macro body
#' @return A macro function.
#'
#' @note Note that because [the defmacro code] works on the parsed expression,
#' not on a text string, defmacro avoids some of the problems of traditional
#' string substitution macros such as \code{strmacro} and the C preprocessor
#' macros. For example, in \preformatted{ mul <- defmacro(a, b, expr={a*b}) } a
#' C programmer might expect \code{mul(i, j + k)} to expand (incorrectly) to
#' \code{i*j + k}. In fact it expands correctly, to the equivalent of
#' \code{i*(j + k)}.
#'
#' For a discussion of the differences between functions and macros, please
#' Thomas Lumley's R-News article (reference below).
#' @author Thomas Lumley wrote \code{defmacro}.  Gregory R. Warnes
#' \email{greg@@warnes.net} enhanced it and created \code{strmacro}.
#' @seealso \code{\link[base]{function}} \code{\link[base]{substitute}},
#' \code{\link[base]{eval}}, \code{\link[base]{parse}},
#' \code{\link[base]{source}}, \code{\link[base]{parse}},
#' @references The original \code{defmacro} code was directly taken from:
#'
#' Lumley T. "Programmer's Niche: Macros in R", R News, 2001, Vol 1, No. 3, pp
#' 11--13, \url{https://cran.r-project.org/doc/Rnews/}
#' @keywords programming
#' ## Code from
#' @examples
#'
#' ####
#' # macro for replacing a specified missing value indicator with NA
#' # within a dataframe
#' ###
#' setNA <- defmacro(df, var, values,
#'   expr = {
#'     df$var[df$var %in% values] <- NA
#'   }
#' )
#'
#' # create example data using 999 as a missing value indicator
#' d <- data.frame(
#'   Grp = c("Trt", "Ctl", "Ctl", "Trt", "Ctl", "Ctl", "Trt", "Ctl", "Trt", "Ctl"),
#'   V1 = c(1, 2, 3, 4, 5, 6, 999, 8, 9, 10),
#'   V2 = c(1, 1, 1, 1, 1, 2, 999, 2, 999, 999),
#'   stringsAsFactors = TRUE
#' )
#' d
#'
#' # Try it out
#' setNA(d, V1, 999)
#' setNA(d, V2, 999)
#' d
#'
#'
#' ###
#' # Expression macro
#' ###
#' plot.d <- defmacro(df, var, DOTS,
#'   col = "red", title = "", expr =
#'     plot(df$var ~ df$Grp, type = "b", col = col, main = title, ...)
#' )
#'
#' plot.d(d, V1)
#' plot.d(d, V1, col = "blue")
#' plot.d(d, V1, lwd = 4) # use optional 'DOTS' argument
#'
#' ###
#' # String macro (note the quoted text in the calls below)
#' #
#' # This style of macro can be useful when you are reading
#' # function arguments from a text file
#' ###
#' plot.s <- strmacro(DF, VAR,
#'   COL = "'red'", TITLE = "''", DOTS = "", expr =
#'     plot(DF$VAR ~ DF$Grp, type = "b", col = COL, main = TITLE, DOTS)
#' )
#'
#' plot.s("d", "V1")
#' plot.s(DF = "d", VAR = "V1", COL = '"blue"')
#' plot.s("d", "V1", DOTS = "lwd=4") # use optional 'DOTS' argument
#'
#'
#'
#' #######
#' # Create a macro that defines new functions
#' ######
#' plot.sf <- defmacro(
#'   type = "b", col = "black",
#'   title = deparse(substitute(x)), DOTS, expr =
#'     function(x, y) plot(x, y, type = type, col = col, main = title, ...)
#' )
#'
#' plot.red <- plot.sf(col = "red", title = "Red is more Fun!")
#' plot.blue <- plot.sf(col = "blue", title = "Blue is Best!", lty = 2)
#'
#' plot.red(1:100, rnorm(100))
#' plot.blue(1:100, rnorm(100))
#' @export
defmacro <- function(..., expr) # , DOTS=FALSE)
{
  expr <- substitute(expr)
  a <- substitute(list(...))[-1]

  ## process the argument list
  nn <- names(a)
  if (is.null(nn)) {
    nn <- rep("", length(a))
  }
  for (i in 1:length(a))
  {
    if (nn[i] == "") {
      nn[i] <- paste(a[[i]])
      msg <- paste(a[[i]], "not supplied")
      a[[i]] <- substitute(
        stop(foo),
        list(foo = msg)
      )
    }
    if (nn[i] == "DOTS") {
      nn[i] <- "..."
      a[[i]] <- formals(function(...) {})[[1]]
    }
  }
  names(a) <- nn
  a <- as.list(a)

  ## this is where the work is done
  ff <- eval(substitute(
    function() {
      tmp <- substitute(body)
      eval(tmp, parent.frame())
    },
    list(body = expr)
  ))

  ## add the argument list
  formals(ff) <- a

  ## create a fake source attribute
  mm <- match.call()
  mm$expr <- NULL
  mm[[1]] <- as.name("macro")
  attr(ff, "source") <- c(
    deparse(mm),
    deparse(expr)
  )

  ## return the 'macro'
  ff
}
