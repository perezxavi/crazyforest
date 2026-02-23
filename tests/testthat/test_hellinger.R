library(crazyforest)
library(survival)
context("crazyforest_hellinger")

test_that("Hellinger splitting works for classification", {
  rf <- crazyforest(Species ~ ., droplevels(iris[1:100, ]), splitrule = "hellinger", num.trees = 5)
  expect_is(rf, "crazyforest")
  expect_lt(rf$prediction.error, 0.3)
})

test_that("Hellinger splitting works for classification with non-factor response", {
  dat <- iris[1:100, ]
  dat$Species <- as.numeric(dat$Species)
  rf <- crazyforest(Species ~ ., dat, num.trees = 5, classification = TRUE, splitrule = "hellinger")
  expect_is(rf, "crazyforest")
  expect_lt(rf$prediction.error, 0.3)
})

test_that("Hellinger splitting works for probability estimation", {
  rf <- crazyforest(Species ~ ., droplevels(iris[1:100, ]), splitrule = "hellinger", 
               num.trees = 5, probability = TRUE)
  expect_is(rf, "crazyforest")
  expect_lt(rf$prediction.error, 0.3)
})

test_that("Hellinger splitting not working for multiclass", {
  expect_error(crazyforest(Species ~ ., iris, splitrule = "hellinger"), 
               "Error: Hellinger splitrule only implemented for binary classification\\.")
})

test_that("Hellinger splitting not working for regression", {
  expect_error(crazyforest(Sepal.Length ~ ., iris, splitrule = "hellinger"), 
               "Error: Hellinger splitrule only implemented for binary classification\\.")
})
