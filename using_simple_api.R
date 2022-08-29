
#You can visit this URL using a browser or a terminal to run your R function and 
#get the results. For instance http://localhost:8000/plot will show you a histogram, 
#and http://localhost:8000/echo?msg=hello will echo back the ‘hello’ message you 
#provided.

library(httr)
library(png)

connectApiKey <- Sys.getenv("CONNECT_API_KEY")

## Echo message 
connectApiUrl <- "https://colorado.rstudio.com/rsc/lisa_api_plumber/echo?msg=hello"
resp <- GET(connectApiUrl,
            add_headers(Authorization = paste0("Key ", connectApiKey)))
result <- content(resp, "parsed")
print(result)

## Display png 
connectApiUrl <- "https://colorado.rstudio.com/rsc/lisa_api_plumber/plot?serializer=png"
resp <- GET(connectApiUrl,
            add_headers(Authorization = paste0("Key ", connectApiKey)))
result <- content(resp, "parsed")
grid::grid.raster(result)

## Archived
# connectApiUrl <- "https://colorado.rstudio.com/rsc/lisa_api_plumber/plot"
# resp <- GET(connectApiUrl,
#             add_headers(Authorization = paste0("Key ", connectApiKey)))
# result <- content(resp, "parsed")
# print(result)
# 
# connectApiUrl <- "https://colorado.rstudio.com/rsc/lisa_api_plumber/echo"
# resp <- GET(connectApiUrl,
#             add_headers(Authorization = paste0("Key ", connectApiKey)))
# result <- content(resp, "parsed")
# print(result)
# 
# connectApiUrl <- "https://colorado.rstudio.com/rsc/lisa_api_plumber/sum"
# resp <- GET(connectApiUrl,
#             add_headers(Authorization = paste0("Key ", connectApiKey)))
# result <- content(resp, "parsed")
# print(result)
