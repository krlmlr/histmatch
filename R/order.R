make_fast_order_ <- function() {
  if (getRversion() >= "3.3.0")
    function(x) order(x, method = "radix")
  else {
    warning_once("Use R >= 3.3.0 for better performance of histmatch")
    function(x) order(x)
  }
}

make_fast_order <- memoise::memoise(make_fast_order_)
