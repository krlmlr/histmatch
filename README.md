
<!-- README.md is generated from README.Rmd. Please edit that file -->
histmatch
=========

Provides a fast implementation for weighted [histogram matching](https://en.wikipedia.org/wiki/Histogram_matching).

``` r
library(histmatch)
```

Timing
------

For random vectors, which are generated using the following function:

``` r
r <- function(e) runif(10 ** e)
```

    #> Unit: milliseconds
    #>                         expr min  lq mean median  uq  max neval
    #>                         r(4) 0.5 0.5  0.5    0.5 0.5  0.8   100
    #>        histmatch(r(3), r(3)) 0.5 0.6  0.7    0.6 0.7  5.2   100
    #>  histmatch(r(3), r(3), r(3)) 0.6 0.6  0.8    0.6 0.8  4.3   100
    #>        histmatch(r(3), r(4)) 2.4 2.5  3.0    2.6 3.0  8.7   100
    #>  histmatch(r(3), r(4), r(4)) 3.0 3.1  4.2    3.2 3.4 58.0   100
    #>        histmatch(r(4), r(4)) 5.3 5.6  6.6    5.7 6.6 13.7   100
    #>  histmatch(r(4), r(4), r(4)) 5.4 5.6  6.5    5.8 6.5 11.9   100
    #>        histmatch(r(4), r(3)) 3.2 3.3  3.8    3.4 3.7 10.3   100
    #>  histmatch(r(4), r(3), r(3)) 2.8 2.9  3.3    3.0 3.3 10.4   100
