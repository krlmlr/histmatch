#' @export
plot.histmatch <- function(data, overlay = NULL, ...) {
  if (!requireNamespace("ggplot2"))
    stop("ggplot2 is needed for plotting.", call. = FALSE)

  ggplot2::ggplot(data$target, ggplot2::aes(x = x, y = y)) +
    ggplot2::scale_x_continuous(breaks = seq_along(data$source$x)) +
    ggplot2::geom_point(size = 3) +
    ggplot2::geom_line() +
    ggplot2::geom_point(data = data$source, color = "red") +
    ggplot2::geom_segment(ggplot2::aes(x = 1, xend = x, y = y, yend = y), data = data$source, color = "red") +
    ggplot2::geom_label(ggplot2::aes(x = 1, label = seq_along(x)), data = data$source, color = "red", alpha = 0.7) +
    if (!is.null(overlay)) {
      ggplot2::geom_point(data = data.frame(x = data$source$x, y = overlay), color = "blue")
    }
}
