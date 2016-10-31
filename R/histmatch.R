#' @export
histmatch <- function(source, target, w = NULL) {
  data <- histmatch_data(source, target, w)
  data$source$y
}

#' @export
histmatch_data <- function(source, target, w = NULL) {
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

  x_target <- rescale(x_target, 1, length(x_source))
  y_target <- target[y_target_order]

  y_source <- interpolate(x_target, y_target, x_source)
  structure(
    list(
      target = data.frame(x = x_target, y = y_target),
      source = data.frame(x = x_source, y = y_source)
    ),
    class = "histmatch")
}

#' @export
plot.histmatch <- function(data, ...) {
  if (!requireNamespace("ggplot2"))
    stop("ggplot2 is needed for plotting.", call. = FALSE)

  ggplot2::ggplot(data$target, ggplot2::aes(x = x, y = y)) +
    ggplot2::scale_x_continuous(breaks = seq_along(data$source$x)) +
    ggplot2::geom_point(size = 3) +
    ggplot2::geom_line() +
    ggplot2::geom_point(data = data$source, color = "red") +
    ggplot2::geom_segment(ggplot2::aes(x = 1, xend = x, y = y, yend = y), data = data$source, color = "red") +
    ggplot2::geom_label(ggplot2::aes(x = 1, label = seq_along(x)), data = data$source, color = "red", alpha = 0.7)
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
