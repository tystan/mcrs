context("col_check() checks")

library(tibble)

adf <- data_frame(A = 1:2, B = 3:4, `C=1` = LETTERS[1:2])

test_that("col_check() correctly returns TRUE when all cols found", {

  expect_equal(col_check(adf, LETTERS[1:2]), TRUE)
  expect_equal(col_check(adf, c("A", "B", "C=1")), TRUE)

})


test_that("col_check() correctly throws errors with bad inputs", {

  expect_error(col_check(adf, LETTERS[1:4]), ".*not found in input data.frame")
  expect_error(col_check(list(), NULL), "df input is not a data.frame object")
  expect_error(col_check(adf, NULL), "col input is not a atomic character vector")
  expect_error(col_check(adf, 1:2), "col input is not a atomic character vector")

})







