# $Id: oddeven.R,v 1.2 2004/09/03 17:27:45 warneg Exp $

# detect odd/even integers
odd <- function(x) x!=as.integer(x/2)*2
even <- function(x) x==as.integer(x/2)*2
