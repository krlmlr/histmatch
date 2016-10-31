context("def")

test_that("equal to definition for a very simple case", {
  x_target <- 1:3
  y_target <- 2:5
  expect_equal(histmatch(x_target, y_target, open_left = TRUE), histmatch_def(x_target, y_target))
})

test_that("equal to definition for random values of same length", {
  x_target <- runif(10)
  y_target <- rnorm(10)
  expect_equal(histmatch(x_target, y_target, open_left = TRUE), histmatch_def(x_target, y_target))
})

test_that("equal to definition for random values", {
  x_target <- runif(10)
  y_target <- rnorm(100)
  expect_equal(histmatch(x_target, y_target, open_left = TRUE), histmatch_def(x_target, y_target))
})
