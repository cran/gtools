# $Id: permute.R,v 1.3 2005/06/09 14:20:29 nj7w Exp $

permute <- function(x) sample( x, size=length(x), replace=FALSE )
