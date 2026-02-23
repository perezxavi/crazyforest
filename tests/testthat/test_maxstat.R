library(crazyforest)
library(survival)
context("crazyforest_maxstat")

test_that("maxstat splitting works for survival", {
  rf <- crazyforest(Surv(time, status) ~ ., veteran, splitrule = "maxstat")
  expect_is(rf, "crazyforest")
  expect_lt(rf$prediction.error, 0.4)
})

test_that("maxstat splitting works for regression", {
  rf <- crazyforest(Sepal.Length ~ ., iris, splitrule = "maxstat")
  expect_is(rf, "crazyforest")
  expect_gt(rf$r.squared, 0.5)
})

test_that("maxstat splitting, alpha or minprop out of range throws error", {
  expect_error(crazyforest(Surv(time, status) ~ ., veteran, splitrule = "maxstat", alpha = -1))
  expect_error(crazyforest(Surv(time, status) ~ ., veteran, splitrule = "maxstat", alpha = 2))
  expect_error(crazyforest(Surv(time, status) ~ ., veteran, splitrule = "maxstat", minprop = -1))
  expect_error(crazyforest(Surv(time, status) ~ ., veteran, splitrule = "maxstat", minprop = 1))
})

test_that("maxstat splitting not working for classification", {
  expect_error(crazyforest(Species ~ ., iris, splitrule = "maxstat"))
})

test_that("maxstat impurity importance is positive", {
  rf <- crazyforest(Surv(time, status) ~ ., veteran, num.trees = 5, 
               splitrule = "maxstat", importance = "impurity")
  expect_gt(mean(rf$variable.importance), 0)
  
  rf <- crazyforest(Sepal.Length ~ ., iris, num.trees = 5, 
               splitrule = "maxstat", importance = "impurity")
  expect_gt(mean(rf$variable.importance), 0)
})

test_that("maxstat corrected impurity importance is positive (on average)", {
  rf <- crazyforest(Surv(time, status) ~ ., veteran, num.trees = 50, 
               splitrule = "maxstat", importance = "impurity_corrected")
  expect_gt(mean(rf$variable.importance), 0)
  
  rf <- crazyforest(Sepal.Length ~ ., iris, num.trees = 5, 
               splitrule = "maxstat", importance = "impurity_corrected")
  expect_gt(mean(rf$variable.importance), 0)
})
