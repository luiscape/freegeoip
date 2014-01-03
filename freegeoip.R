## Geocode IP addresses using freegeoip.net (which allows for 10.000 queries per hour). 
## Freegeoip is reportedly slow compared to other sources. 
#  Original code from Heuristic Andrew
#  Additions by Luis Capelo @luiscape: designed to work with data.frames and add error handler. 
# 

## Summary of Changes ##
# The first version of this function is available on Heuristic Andrew's blog 
# here: http://heuristically.wordpress.com/2013/05/20/geolocate-ip-addresses-in-r/. 
# However, that version does not work well with data.frames and is designed to work with lists.
# Based on Andrew's code I created the following version to work with data.frames only. 
# Besides that, I added the 'tryCatch' feature to handle errors -- the functions ignores
# the error and continues to process the remaining IPs in the data.frame. Error rows
# are then filled with NAs.


# Freegeoip 
freegeoip <- function(data = NULL) { 
  require(rjson) # for reading the resulting JSON file.
    if (is.data.frame(data) == FALSE) { 
      print('This function only works with data.frames. Please provide a data.frame.') }
  
    else {  
      final <- data.frame()
      for (i in 1:nrow(data)) {
          url <- paste("http://freegeoip.net/json/", c(as.character(data[i,])), sep="")
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

