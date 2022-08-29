

# Plumber explorations

This is a work in progress, please come back later. :) 

## Connect API

Referring to the [Connect API documentation](https://docs.rstudio.com/connect/1.6.8/api/) for a clear example. 

Below are examples of invoking the “Get R Information” endpoint.

Highly recommended is this [short and sweet video](https://solutions.rstudio.com/misc/videos/?wchannelid=hd6k3y7nj5&wmediaid=5exbsw3wtf) showing how it is done.

cURL

```
curl -H "Authorization: Key XXXXXXXXXXX" \
     https://rstudioconnect.example.com/__api__/v1/server_settings/r
```

R

```r
library(httr)
apiKey <- "XXXXXXXXXXX"
result <- GET("https://rstudioconnect.example.com/__api__/v1/server_settings/r",
  add_headers(Authorization = paste("Key", apiKey))
```

or 

```r
library(httr)

connectApiUrl <- "https://connect.yourcompany.com/rest-api/route"
connectApiKey <- "YfB5XBRB7slkkBSEi5qr93mWJvbpXQQy"

resp <- GET(connectApiUrl,
            add_headers(Authorization = paste0("Key ", connectApiKey)))
result <- content(resp, "parsed")
print(result)
```

Python

```
import requests
r = requests.get(
  'https://rstudioconnect.example.com/__api__/v1/server_settings/r',
  headers = { 'Authorization': 'Key XXXXXXXXXXX' }
)
```


## Client Access for rest API's 

Referring to [Solutions Engineering examples](https://solutions.rstudio.com/r/rest-apis/clients/r/). 

The code examples assume that you are calling a published API in RStudio Connect that is:

 - Hosted on a secure server with TLS/SSL at an HTTPS endpoint
 - Using an API key to make an authorized call to an API
 - Making an HTTP GET request to the API

There is a really good overiew [here](https://rviews.rstudio.com/2018/07/23/rest-apis-and-plumber/). 

R

```r
connectApiKey <- Sys.getenv("CONNECT_API_KEY")

library(httr)

connectApiUrl <- "https://connect.yourcompany.com/rest-api/route"

resp <- GET(connectApiUrl,
            add_headers(Authorization = paste0("Key ", connectApiKey)))
result <- content(resp, "parsed")
print(result)
```

Python

```
import requests

connect_api_url = "https://connect.yourcompany.com/rest-api/route"
connect_api_key = "YfB5XBRB7slkkBSEi5qr93mWJvbpXQQy"

response = requests.get(connect_api_url,
                        headers={'Authorization': 'Key ' + connect_api_key})
print(response.text)
```

cURL

```
export CONNECT_API_URL=https://connect.yourcompany.com/rest-api-example/endpoint
export CONNECT_API_KEY=YfB5XBRB7slkkBSEi5qr93mWJvbpXQQy

curl -H "Authorization: Key ${CONNECT_API_KEY}" ${CONNECT_API_URL}
```

## Environment management

Not exposing the API key directly in code is strongly recommended. the [usethis](https://usethis.r-lib.org/reference/edit.html) package offers really easy to use support for opening the .Renviron file so that environment variables can be added there. 

```
usethis::edit_r_environ()
```

::: callout-note
Remember when adding secure information to the .Renviron file to also add that file to the .gitignore file so it isn't then exposed on upload to git! 
::: 

## References: 

https://www.rplumber.io/

https://github.com/sol-eng/plumberExamples

https://geology.com/articles/lightning-map.shtml

https://geology.com/articles/lightning-map.shtml

http://lightningsafety.com/nlsi_info/lightningmaps/US_FD_Lightning.pdf

https://rstudio.github.io/leaflet/

https://blog.martinez.fyi/post/plumber-shiny-docker/

https://www.jumpingrivers.com/blog/r-shiny-plumber-react-part-1/

https://www.jumpingrivers.com/blog/r-shiny-plumber-react-part-3/

https://www.researchgate.net/publication/346786826_Real_time_monitoring_and_reporting_surveys_using_Shiny_App_on_Survey_Solutions_Api_with_R

https://github.com/sol-eng/plumberExamples

https://www.datalorax.com/post/power-parameterized-reports-plumber/

https://josiahparry.com/post/2021-03-28-python-r/


