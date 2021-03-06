#' Histogram matching
#'
#' TBD.
#'
#' @param source `[numeric]`\cr Source distribution
#' @param target `[numeric]`\cr Target distribution
#' @param w `[numeric]`\cr Optional, a weight vector of the same length as
#'   `target`
#' @param open_left `[logical(1)]`\cr Match against an interval open to the left,
#'   or closed at both ends (default)?
#' @return
#'   - For `histmatch()`: A vector of the same length as `source`
#'
#' @export
histmatch <- function(source, target, w = NULL, open_left = FALSE) {
  data <- histmatch_data(source, target, w, open_left)
  data$source$y
}

#' @details
#'   A [plot()] method is defined for objects returned by `histmatch_data()`.
#' @rdname histmatch
#' @return
#'   - For `histmatch_data()`: A named list with two components, `"source"`
#'     and `"target"`, each containing a data frame
#'
#' @export
histmatch_data <- function(source, target, w = NULL, open_left = FALSE) {
  source <- as.numeric(source)
  target <- as.numeric(target)
  if (!is.null(w)) {
    w <- as.numeric(w)
    stopifnot(length(w) == length(target))
  }

  order <- make_fast_order()

  y_target_order <- order(target)

  if (is.null(w)) {
    x_target <- seq_along(target)
  } else {
    x_target <- cumsum(w[y_target_order])
  }

  # Same as rank() without ties
  x_source <- order(order(source))

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

rescale <- function(x, min, max) {
  range_x <- range(x)
  (x - range_x[[1L]]) / diff(range_x) * (max - min) + min
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
