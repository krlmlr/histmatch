
<!-- README.md is generated from README.Rmd. Please edit that file -->
histmatch
=========

Provides a fast implementation for weighted [histogram matching](https://en.wikipedia.org/wiki/Histogram_matching).

Timing
------

For random vectors, which are generated using the following function:

``` r
r <- function(e) runif(10 ** e)
```

    #> # A tibble: 9 x 2
    #>                          expr median_ms
    #>                        <fctr>     <dbl>
    #> 1                        r(4)       0.5
    #> 2       histmatch(r(3), r(3))       0.6
    #> 3 histmatch(r(3), r(3), r(3))       0.6
    #> 4       histmatch(r(3), r(4))       2.6
    #> 5 histmatch(r(3), r(4), r(4))       3.4
    #> 6       histmatch(r(4), r(4))       5.8
    #> 7 histmatch(r(4), r(4), r(4))       5.8
    #> 8       histmatch(r(4), r(3))       3.4
    #> 9 histmatch(r(4), r(3), r(3))       3.0
