#' freegeoip
#' 
#' The freegeoip function takes a data.frame with IP addresses, sends them to 
#' the freegeoip.net service as a query, and stores the resulting geocoded 
#' elements into a data.frame. Each IP address is sent using an individual
#' query. Hence, the function may take a long time to conclude (1+ hour for 
#' every 1 thousand IP addresses). The results are reportedly accurate. 
#'Errors are stored as NAs.
#' 
#'
#' @name freegeoip
#' @docType package
NULL
