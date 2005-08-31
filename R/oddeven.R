# $Id: oddeven.R,v 1.3 2005/06/09 14:20:29 nj7w Exp $

# detect odd/even integers
odd <- function(x) x!=as.integer(x/2)*2
even <- function(x) x==as.integer(x/2)*2
