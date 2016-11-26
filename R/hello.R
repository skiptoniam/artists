install.packages('rvest')
library(rvest)
art_hues <- read_html('http://www.colorlisa.com/')
art_hues[1]

artist_pallets <- art_hues %>%
  html_nodes('.artist__name, .palette__color') %>%
  html_text()

painting_artist_names <- art_hues %>%
  html_nodes('.palette__author')%>%
  html_text()

colours <- matrix(artist_pallets,length(painting_artist_names),5,byrow=TRUE)

painting_names <- art_hues %>%
  html_nodes('.palette__author b\\')%>%
  html_text()

artist_names <- art_hues %>%
  html_nodes('.artist__name')%>%
  html_text()

artist_names<-gsub("\n      ","", artist_names)

urls <- art_hues %>%
  html_nodes('.palette__author a')%>%
  html_attr('href')

browseURL(urls[1], browser = getOption("browser"),
          encodeIfNeeded = FALSE)
