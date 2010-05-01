
strmacro <- function(..., expr, strexpr)
{
  if(!missing(expr))
    strexpr <- deparse(substitute(expr))
  
  a <- substitute(list(...))[-1]

  nn <- names(a)
  if (is.null(nn))
    nn <- rep("", length(a))
  for(i in 1:length(a))
    {
      if (nn[i] == "")
        {
          nn[i] <- paste(a[[i]])
          msg <- paste(a[[i]], "not supplied")
          a[[i]] <- substitute(stop(foo),
                               list(foo = msg))
        }
      else
        {
          a[[i]] <- a[[i]]
        }
      #if (nn[i] == "DOTS")
      #  {
      #    nn[i] <- "..."
      #    a[[i]] <- formals(function(...){})[[1]]
      #  }
    }
  names(a) <- nn
  a <- as.list(a)

  ## this is where the work is done
  ff <- 
    function(...)
      {
        ## build replacement list
        reptab <- a # copy defaults first
        reptab$"..." <- NULL
        #reptab$DOTS <- ""
        
        args <- match.call(expand.dots=TRUE)[-1]
        #print(args)
                          
        for(item in names(args))
          ##if(item %in% names(reptab))
          reptab[[item]] <- args[[item]]
        ##else
        ##  {
        ##    browser()
        ##    oldval <- reptab[["DOTS"]]
        ##    addval <- paste(item, "=", args[[item]])
        ##    if(oldval>"")
        ##      newval <- paste(c(oldval, addval), collapse=", ")
        ##    else
        ##      newval <- addval
        ##    reptab[["DOTS"]] <- newval
        ##  }
        
        #print(reptab)
        
        ## do the replacements
        body <- strexpr
        for(i in 1:length(reptab))
          {
            pattern <- paste("\\b",
                             names(reptab)[i],
                             "\\b",sep='')
            
            value <- reptab[[i]]
            if(missing(value))
              value <- ""
            
            body <- gsub(pattern,
                         value,
                         body)
          }

        #print(body)
        
        fun <- parse(text=body)
        eval(fun, parent.frame())

        
      }
  
  
  
  ## add the argument list
  formals(ff) <- a
  
  ## create a fake source attribute
  mm <- match.call()
  mm$expr <- NULL
  mm[[1]] <- as.name("macro")
  attr(ff, "source") <- c(deparse(mm), strexpr)
  
  ## return the 'macro'
  ff
}




