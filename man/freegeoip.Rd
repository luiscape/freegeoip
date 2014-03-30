\docType{package}
\name{freegeoip}
\alias{freegeoip}
\alias{freegeoip-package}
\title{freegeoip}
\usage{
freegeoip(df = NULL)
}
\arguments{
  \item{df}{data.frame (with a single column) with IP
  addresses. This is the column that will be geocoded.}
}
\description{
The freegeoip function takes a data.frame with IP
addresses, sends them to the freegeoip.net service as a
query, and stores the resulting geocoded elements into a
data.frame. Each IP address is sent using an individual
query. Hence, the function may take a long time to conclude
(1+ hour for every 1 thousand IP addresses). The results
are reportedly accurate. Errors are stored as NAs.

freegeoip
}
\details{
freegeoip takes a data.frame of IP addresses (with a single
column) and geocodes each IP address using the
freegeoip.net service. Errors (IPs not identified by the
system) are encoded as NAs. The output is a data.frame.
}
\examples{
# Geocoding a single IP address
# x <- data.frame('72.225.192.110')
# y <- freegeoip(x)
}
\keyword{address}
\keyword{geocode}
\keyword{gis}
\keyword{ip}
\keyword{mapping}

