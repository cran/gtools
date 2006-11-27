# $Id: oddeven.R 625 2005-06-09 14:20:30Z nj7w $

# detect odd/even integers
odd <- function(x) x!=as.integer(x/2)*2
even <- function(x) x==as.integer(x/2)*2
