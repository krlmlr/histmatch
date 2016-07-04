
<!-- README.md is generated from README.Rmd. Please edit that file -->
histmatch
=========

Provides a fast implementation for weighted [histogram matching](https://en.wikipedia.org/wiki/Histogram_matching).

``` r
library(histmatch)
```

Timing
------

``` r
set.seed(123)
r <- function(e) runif(10 ** e)
```

    #> Unit: milliseconds
    #>                         expr    min     lq   mean median     uq    max neval
    #>                         r(3) 0.0522 0.0569 0.0643 0.0597 0.0692  0.122   100
    #>                         r(4) 0.4675 0.4747 0.5094 0.4980 0.5124  0.738   100
    #>        histmatch(r(3), r(3)) 0.5361 0.5541 0.6143 0.5817 0.6166  1.031   100
    #>  histmatch(r(3), r(3), r(3)) 0.5790 0.5975 0.7359 0.6211 0.6515  5.161   100
    #>        histmatch(r(3), r(4)) 2.4502 2.5436 2.9968 2.6005 2.6920  7.269   100
    #>  histmatch(r(3), r(4), r(4)) 2.9999 3.1061 3.7687 3.1859 3.3351 11.850   100
    #>        histmatch(r(4), r(4)) 5.3779 5.5192 6.2407 5.6668 6.2013 13.292   100
    #>  histmatch(r(4), r(4), r(4)) 5.3985 5.5620 6.8534 5.7113 6.5151 58.233   100
    #>        histmatch(r(4), r(3)) 3.1705 3.2848 3.4917 3.3420 3.4696  7.733   100
    #>  histmatch(r(4), r(3), r(3)) 2.8073 2.8886 3.2513 2.9616 3.0827  9.399   100
