library(testthat)

context("summary")

test_that('aux_mean ok', {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(10, 0.5), 5)
  expect_length(aux_mean(10, 0.5), 1)
})

test_that('aux_variance ok', {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(10, 0.5), 2.5)
  expect_length(aux_variance(10, 0.5), 1)
})

test_that('aux_mode ok', {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(10, 0.5), 5)
  expect_length(aux_mode(10, 0.5), 1)
})

test_that('aux_skewness ok', {
  expect_equal(aux_skewness(2,0.5), 0)
  expect_equal(aux_skewness(10, 0.5), 0)
  expect_length(aux_skewness(10, 0.5), 1)
})


test_that('aux_kurtosis ok', {
  expect_equal(aux_kurtosis(2,0.5),-1)
  expect_equal(aux_kurtosis(10, 0.5), -0.2)
  expect_length(aux_kurtosis(10, 0.5), 1)
})
