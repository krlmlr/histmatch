
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
    #>                         expr  min   lq mean median   uq  max neval
    #>                         r(3) 0.05 0.06 0.07   0.06 0.07  0.1   100
    #>                         r(4) 0.47 0.48 0.53   0.50 0.53  0.8   100
    #>        histmatch(r(3), r(3)) 0.54 0.56 0.63   0.59 0.64  1.1   100
    #>  histmatch(r(3), r(3), r(3)) 0.58 0.61 0.80   0.65 0.75  6.7   100
    #>        histmatch(r(3), r(4)) 2.48 2.55 3.10   2.62 2.78 10.1   100
    #>  histmatch(r(3), r(4), r(4)) 3.01 3.14 3.88   3.28 3.97  9.5   100
    #>        histmatch(r(4), r(4)) 5.37 5.55 6.29   5.71 6.16 11.6   100
    #>  histmatch(r(4), r(4), r(4)) 5.40 5.59 6.97   5.78 6.63 61.4   100
    #>        histmatch(r(4), r(3)) 3.20 3.28 3.69   3.38 3.64 10.3   100
    #>  histmatch(r(4), r(3), r(3)) 2.77 2.92 3.45   3.00 3.58 12.5   100
