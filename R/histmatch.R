#' @export
histmatch <- function(source, target, w = NULL) {
  source <- as.numeric(source)
  target <- as.numeric(target)
  if (!is.null(w)) {
    w <- as.numeric(w)
    stopifnot(length(w) == length(target))
  }

  x_source <- order(source, method = "radix")
  y_target_order <- order(target, method = "radix")

  if (is.null(w)) {
    x_target <- seq_along(target)
  } else {
    x_target <- cumsum(w[y_target_order])
  }

  x_target <- rescale(x_target, 1, length(x_source))
  y_target <- target[y_target_order]

  interpolate(x_target, y_target, x_source)
}

interpolate <- function(x_target, y_target, x_source) {
  #xy_source_new <- approx(x_target, y_target, x_source, ties = "ordered")
  #xy_source_new$y
  .Call(stats:::C_Approx, x_target, y_target, as.double(x_source),
        1, # 1 = linear, 2 = constant
        NA, NA, 0, PACKAGE = "stats")
}

rescale <- function(x, min, max) {
  range_x <- range(x)
  (x - range_x[[1L]]) / diff(range_x) * (max - min) + min
}
