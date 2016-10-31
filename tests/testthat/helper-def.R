histmatch_def <- function(src,tgt){
  ecdf.src <- ecdf(src)
  x.s <- ecdf.src(src)
  quantile(tgt, x.s, names = FALSE)
}

set.seed(20161031)
