
<!-- README.md is generated from README.Rmd. Please edit that file -->
histmatch
=========

Provides a fast implementation for weighted [histogram matching](https://en.wikipedia.org/wiki/Histogram_matching).

``` r
library(histmatch)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

Timing
------

For random vectors, which are generated using the following function:

``` r
r <- function(e) runif(10 ** e)
```

    #> # A tibble: 9 x 2
    #>                          expr median_ms
    #>                        <fctr>     <dbl>
    #> 1                        r(4)      0.50
    #> 2       histmatch(r(3), r(3))      0.59
    #> 3 histmatch(r(3), r(3), r(3))      0.64
    #> 4       histmatch(r(3), r(4))      2.69
    #> 5 histmatch(r(3), r(4), r(4))      3.23
    #> 6       histmatch(r(4), r(4))      5.78
    #> 7 histmatch(r(4), r(4), r(4))      5.78
    #> 8       histmatch(r(4), r(3))      3.42
    #> 9 histmatch(r(4), r(3), r(3))      3.02
