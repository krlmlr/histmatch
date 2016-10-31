#' @export
histmatch <- function(source, target, w = NULL, open_left = FALSE) {
  data <- histmatch_data(source, target, w, open_left)
  data$source$y
}

#' @export
histmatch_data <- function(source, target, w = NULL, open_left = FALSE) {
  source <- as.numeric(source)
  target <- as.numeric(target)
  if (!is.null(w)) {
    w <- as.numeric(w)
    stopifnot(length(w) == length(target))
  }

  y_target_order <- order(target, method = "radix")

  if (is.null(w)) {
    x_target <- seq_along(target)
  } else {
    x_target <- cumsum(w[y_target_order])
  }

  x_source <- order(source, method = "radix")
  x_source <- order(x_source, method = "radix")

  x_target_start <- if (open_left) 0 else 1

  x_target <- rescale(x_target, x_target_start, length(x_source))
  y_target <- target[y_target_order]

  y_source <- interpolate(x_target, y_target, x_source)
  structure(
    list(
      target = data.frame(x = x_target, y = y_target),
      source = data.frame(x = x_source, y = y_source)
    ),
    class = "histmatch")
}

approx_call <-
  ~.Call(
    stats:::C_Approx, x_target, y_target, as.double(x_source),
    1, # 1 = linear, 2 = constant
    NA, NA, 0, PACKAGE = "stats")

interpolate <- function(x_target, y_target, x_source) {
  #xy_source_new <- approx(x_target, y_target, x_source, ties = "ordered")
  #xy_source_new$y
  eval(approx_call[[2]])
}

rescale <- function(x, min, max) {
  range_x <- range(x)
  (x - range_x[[1L]]) / diff(range_x) * (max - min) + min
}
