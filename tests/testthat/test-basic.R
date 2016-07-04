context("basic")

test_that("identity", {
  expect_equal(histmatch(1:10, 1:10), 1:10)
  expect_equal(histmatch(1:2, 1:2), 1:2)
})

test_that("linear shift", {
  expect_equal(histmatch(1:10, 2:11), 2:11)
})

test_that("shifting and squeezing", {
  expect_equal(histmatch(1:10, 5:6), seq(from = 5, to = 6, length.out = 10))
})

test_that("shifting and stretching", {
  expect_equal(histmatch(1:10, 500:600), seq(from = 500, to = 600, length.out = 10))
})

test_that("shifting and stretching", {
  expect_equal(histmatch(1:10, 500:600), seq(from = 500, to = 600, length.out = 10))
})

test_that("nonuniform target distribution", {
  expect_equal(histmatch(1:11, c(2, 4, 5)),
               c(2, 2.4, 2.8, 3.2, 3.6, 4, 4.2, 4.4, 4.6, 4.8, 5))
})