##
## Function to do rbind of data frames quickly, even if the columns don't match
##

smartbind <- function(...)
  {
    verbose <- FALSE
    
    
    data <- list(...)
    if(is.null(names(data)))
      names(data) <- as.character(1:length(data))
    data <- lapply(data,
                   function(x)
                   if(is.matrix(x) || is.data.frame(x))
                     x
                   else
                     data.frame(as.list(x))
                   )

    #retval <- new.env()
    retval <- list()
    rowLens <- unlist(lapply(data, nrow))
    nrows <- sum(rowLens)
    
    rowNameList <- unlist(lapply( names(data),
                                 function(x) 
                                   if(rowLens[x]<=1) x
                                   else paste(x, seq(1,rowLens[x]),sep='.'))
                          )

       
    start <- 1
    for(block in data)
      {
        if(verbose) print(block)
        end <- start+nrow(block)-1
        for(col in colnames(block))
          {
            if( !(col %in% names(retval)))
              {
                if(verbose) cat("Start:", start,
                                "  End:", end,
                                "  Column:", col,
                                "\n", sep="")
                if(class(block[,col])=="factor")
                  newclass <- "character"
                else
                  newclass <- class(block[,col])
                retval[[col]] <- as.vector(rep(NA,nrows), mode=newclass)
              }
            
            retval[[col]][start:end] <- as.vector(block[,col],
                                                  mode=class(retval[[col]]))
          }
        start <- end+1
      }

    #retval <- as.list(retval)
    attr(retval,"row.names") <- rowNameList
    class(retval) <- "data.frame"
    return(retval)
  }

