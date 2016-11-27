This is a direct replication of the code from [Karthik Ram's `wesanderson` palette](https://github.com/karthik/wesanderson) and [David Miller's `beyonce` palette](https://github.com/dill/beyonce)

But, I generated Colour Palettes using the wonderful and inspirational palettes from [colourlisa.com](http://www.colourlisa.com/)

Installation
------------

``` r
devtools::install_github("skiptoniam/artists")
```

Usage
-----

``` r
library(artists)
```

``` r
par(mfrow=c(26,5))
for(i in 1:128) print(artist_palette(i))
```

![](readme_files/figure-markdown_github/all_palettes-1.png)

My only slight tweek is an abilitiy to view the art work your colour palette is based on. This can be achieved by setting `see_painting = TRUE`

This is one of my favorites

``` r
par(mfrow=c(2,1))
artist_palette(1,see_painting = TRUE)
library(jpeg)
```

    ## Warning: package 'jpeg' was built under R version 3.2.3

``` r
jj <- readJPEG('./a.jpg',native=TRUE)
plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
rasterImage(jj,0,0,1,1)
```

![](readme_files/figure-markdown_github/luminous_day_josef_albers-1.png)
