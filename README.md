
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rgeopat2

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/rgeopat2)](https://cran.r-project.org/package=rgeopat2)

The goal of `rgeopat2` is to enhance the functionality of [geoPAT
2](https://github.com/Nowosad/geopat2).

## Installation

Get the released version from CRAN:

``` r
install.packages("rgeopat2")
```

Get the development version from github:

``` r
# install.packages("devtools")
devtools::install_github("Nowosad/rgeopat2")
```

## Example

This is a basic example which shows you how to create a grid polygon
based on the geoPAT 2 header file:

``` r
library(rgeopat2)
header_filepath = system.file("rawdata/Augusta2011_grid100.hdr", package = "rgeopat2")
my_grid = gpat_create_grid(header_filepath)
plot(my_grid)
```

![](man/figures/README-example-1.png)<!-- -->

More examples can be found in [GeoPAT 2
manual](https://rawgit.com/Nowosad/geopat2_manual/master/output/GeoPAT2_Manual.pdf).
