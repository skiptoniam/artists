install.packages('rvest')
library(rvest)
art_hues <- read_html('http://www.colorlisa.com/')
art_hues[1]

artist_pallets <- art_hues %>%
  html_nodes('.artist__name, .palette__color , .sumome-share-client-small') %>%
  html_text()

paintings <- art_hues %>%
  html_nodes('.palette__author a')%>%
  html_text()

artist_names <- art_hues %>%
  html_nodes('.artist__name')%>%
  html_text()

urls <- art_hues %>%
  html_nodes('.palette__author a')%>%
  html_attr('href')

browseURL(urls[1], browser = getOption("browser"),
          encodeIfNeeded = FALSE)
