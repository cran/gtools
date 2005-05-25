# $Id: logit.R,v 1.1 2003/05/23 18:14:12 warnes Exp $

logit <- function(x, min=0, max=1)
  {
    p <- (x-min)/(max-min)
    log(p/(1-p))
  }

inv.logit <- function(x, min=0, max=1)
  {
    p <- exp(x)/(1+exp(x))
    p <- ifelse( is.na(p) & !is.na(x), 1, p ) # fix problems with +Inf
    p * (max-min) + min
  }
                 
