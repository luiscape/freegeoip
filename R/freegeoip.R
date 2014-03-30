## Geocode IP addresses using freegeoip.net (which allows for 10.000 queries per hour). 
## Freegeoip is reportedly slow compared to other sources. 
#  Inspiration from from Heuristic Andrew
#  
#  Author: Luis Capelo (capelo@un.org)

## Summary of Changes ##
# This function is heavily inspired by Heuristic Andrew's blog: 
# http://heuristically.wordpress.com/2013/05/20/geolocate-ip-addresses-in-r/. 
# His original version does not work well with data.frames and is designed to work with lists.
# Based on Andrew's code I created the following version to work with data.frames only. 
# I added an error handler and error rows are then filled with NAs, making analysis easier.
# 

#' Geocoding a data.frame with IP addresses
#'
#' freegeoip 
#' 
#' freegeoip takes a data.frame of IP addresses (with a single column) and geocodes each IP
#' address using the freegeoip.net service. Errors (IPs not identified by the system) are
#' encoded as NAs. The output is a data.frame.
#'
#' @param df data.frame (with a single column) with IP addresses. This is the column that will be
#' geocoded.
#' 
#' @keywords gis geocode mapping ip address
#' 
#' @export
#' 
#' @examples
#' # Geocoding a single IP address
#' # x <- data.frame('72.225.192.110')
#' # y <- freegeoip(x)
 
freegeoip <- function(df = NULL) { 

    if (is.data.frame(df) == FALSE) { 
      warning('This function only works with data.frames. Please provide a data.frame.') 
    }
  
    else {  
      final <- data.frame()
      for (i in 1:nrow(df)) {
          url <- paste("http://freegeoip.net/json/", c(as.character(df[i,])), sep="")
          line <- tryCatch( 
            data.frame(fromJSON(getURLContent(url))), 
            error = function(e) e
            )
          if(inherits(line, "error")) line <- c(NA)
          final <- rbind(final, line)
        }
      return(final)
    }
}