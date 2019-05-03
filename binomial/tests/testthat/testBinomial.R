library(testthat)

context("binomial")

test_that('bin_choose ok', {
  expect_equal(bin_choose(n = 5, k = 2), 10)
  expect_error(bin_choose(n = 2, k = 5), 'k cannot be greater than n')
  expect_length(bin_choose(5, 2), 1)
})

test_that('bin_probability ok', {
  expect_equal(bin_probability(success = 2, trials = 5, prob = .5), 0.3125)
  expect_equal(bin_probability(success = 55, trials = 100, prob = .45), 0.01075277)
  expect_length(bin_probability(success = 2, trials = 5, prob = .5), 1)
})

test_that('bin_distribution ok', {
  expect_equal(bin_distribution(5, 0.5)$probability, c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125))
  expect_equal(bin_distribution(5, 0.5)$success, c(0, 1, 2, 3, 4, 5))
  expect_is(bin_distribution(5, 0.5), 'bindis')
})

test_that('bin_cumulative ok', {
  expect_equal(bin_cumulative(5, 0.5)$cumulative, c(0.03125, 0.18750, 0.50000, 0.81250, 0.96875, 1.00000))
  expect_equal(bin_cumulative(5, 0.5)$probability, c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125))
  expect_equal(bin_cumulative(5, 0.5)$success, c(0, 1, 2, 3, 4, 5))
  expect_is(bin_cumulative(5, 0.5), 'bincum')
})
