library(testthat)

context("checkers")

test_that('check_prob ok', {
  expect_true(check_prob(0.6))
  expect_length(check_prob(0.6), 1)
  expect_error(check_prob(-1), 'invalid prob value')
})

test_that('check_trials ok', {
  expect_true(check_trials(10))
  expect_length(check_trials(10), 1)
  expect_error(check_trials(-5),'invalid trials value')
  expect_error(check_trials(2.5), 'invalid trials value')
})

test_that('check_success ok', {
  expect_true(check_success(3,7))
  expect_true(check_success(c(3,4,5), 5))
  expect_error(check_success(7,3), 'invalid success value')
})
