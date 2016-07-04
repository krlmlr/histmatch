#' @export
histmatch <- function(source, target, w = NULL) {
  x_source <- order(source, method = "radix")
  y_target_order <- order(target, method = "radix")
  x_target <- cumsum(w[y_target_order]) * length(source) / length(target)
  y_target <- target[y_target_order]

  #xy_source_new <- approx(x_target, y_target, x_source, ties = "ordered")
  #xy_source_new$y
  .Call(stats:::C_Approx, x_target, y_target, as.double(x_source), 1,
        -NA, NA, 0, PACKAGE = "stats")
}
