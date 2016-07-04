
<!-- README.md is generated from README.Rmd. Please edit that file -->
histmatch
=========

Provides a fast implementation for weighted [histogram matching](https://en.wikipedia.org/wiki/Histogram_matching).

``` r
histmatch(1:10, 1:10)
#>  [1]  1  2  3  4  5  6  7  8  9 10
histmatch(1:10, 2:11)
#>  [1]  2  3  4  5  6  7  8  9 10 11
histmatch(1:11, 5:6)
#>  [1] 5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 6.0
histmatch(1:11, c(2, 4, 5))
#>  [1] 2.0 2.4 2.8 3.2 3.6 4.0 4.2 4.4 4.6 4.8 5.0
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
    #> 2       histmatch(r(3), r(3))      0.65
    #> 3 histmatch(r(3), r(3), r(3))      0.75
    #> 4       histmatch(r(3), r(4))      2.86
    #> 5 histmatch(r(3), r(4), r(4))      3.43
    #> 6       histmatch(r(4), r(4))      5.98
    #> 7 histmatch(r(4), r(4), r(4))      6.68
    #> 8       histmatch(r(4), r(3))      3.48
    #> 9 histmatch(r(4), r(3), r(3))      3.56

Installation
------------

``` r
devtools::install_github("krlmlr/histmatch")
```
