# $Id: permute.R,v 1.2 2004/09/03 17:27:45 warneg Exp $

permute <- function(x) sample( x, size=length(x), replace=FALSE )
