## https://stackoverflow.com/questions/73491296/is-there-an-alternative-to-reshape2melt-for-multidimensional-arrays-in-base-r/76388312?noredirect=1#comment134733759_76388312

#' @param x a multidimensional array
#' @examples
#' a <- array(1:27, dim = c(3,3,3),
#'      dimnames = list(dim1 = letters[1:3], dim2 = LETTERS[1:3],
#'                      dim3 = c("i", "ii", "iii")))
#' melt_array(a)
melt_array <- function(x) {
    data.frame(arrayInd(seq_along(x), dim(x)), value = as.vector(x))
    ## list2DF(lapply(as.data.frame.table(x), unclass))
    ## list2DF(c(Map(
    ##     \(i, j, n) rep(rep(1:i, each = j), length.out = n),
    ##     dim(x),
    ##     c(1, cumprod(dim(x)[-length(dim(x))])),
    ##     length(x)
    ## ), Value = list(as.vector(x))))
}
