freegeoip R function
====================

R package to geolocate IP addresses using http://freegeoip.net/ . The package only contains one functon `freegeoip`. The `freegeoip` function only takes `data.frames` (with a single IP column). And it returns a `data.frame` with the IP addresses geocoded to the maximum granularily available in the http://www.maxmind.com/ IPs database.

Installation
------------

You will need the `devtools` package to install the `freegeoip` package. 

```r 
  install.packages('devtools')
  library('devtools')
  install_github('freegeoip', 'luiscape')
```


Usage
-----

Input a `data.frame` with a single IP column. The result will be a `data.frame` with the geocoded addresses. 

```r 
  x <- data.frame('34.23.143.243')

  freegeoip(x) 
```

This is the `data.frame` in the output: 

```r 
             ip country_code  country_name region_code region_name    city zipcode latitude longitude metro_code area_code
1 34.23.143.243           US United States          TX       Texas Houston   77072  29.6997  -95.5858        618       281
```


Known Issues
------------

This package was written when trying to geocode IP addresses from MailChimp. MailChimp provides an export feature that allows you to download your list of subscribers in a CSV format. They collect IP addresses from subscribers by default. I needed a function that geocoded the IP column in the CSV file. That need was the main reason why I created this package. 

With that said, the package is really slow. It sends a single IP address at a time. As a result, if you have a large list of IP addresses, you end up making many -- *many* -- queries. I did it this way in order to properly catch errors -- I was geocoding a very international IP address list with lots of errors. Errors are catched and properly categorized as `NA`s.

