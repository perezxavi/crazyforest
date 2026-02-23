## Tests for predictions

library(crazyforest)
library(survival)
context("crazyforest_pred")

## Tests
test_that("predict returns good prediction", {
  rf <- crazyforest(Species ~ ., iris, write.forest = TRUE)
  pred <- predict(rf, iris)
  expect_gt(mean(iris$Species == predictions(pred)), 0.9)
})

test_that("case weights work", {
  expect_silent(crazyforest(Species ~ ., iris, num.trees = 5, case.weights = rep(1, nrow(iris))))
  ## Should only predict setosa now
  weights <- c(rep(1, 50), rep(0, 100))
  rf <- crazyforest(Species ~ ., iris, num.trees = 5, case.weights = weights, write.forest = TRUE)
  pred <- predict(rf, iris)$predictions
  expect_true(all(pred == "setosa"))
})

test_that("Prediction works correctly if dependent variable is not first or last", {
  dat <- iris[, c(1:2, 5, 3:4)]
  rf <- crazyforest(Species ~ ., dat, num.trees = 5, write.forest = TRUE)
  expect_gte(mean(predictions(predict(rf, dat)) == dat$Species), 0.9)
  
  ## No response column
  expect_gte(mean(predictions(predict(rf, dat[, -3])) == dat$Species), 0.9)
})

test_that("Prediction works correctly if dependent variable is not first or last, alternative interface", {
  dat <- iris[, c(1:2, 5, 3:4)]
  rf <- crazyforest(dependent.variable.name = "Species", data = dat, num.trees = 5, write.forest = TRUE)
  expect_gte(mean(predictions(predict(rf, dat)) == dat$Species), 0.9)
  
  ## No response column
  expect_gte(mean(predictions(predict(rf, dat[, -3])) == dat$Species), 0.9)
})

test_that("If num.trees set, these number is used for predictions", {
  rf <- crazyforest(Species ~ ., iris, num.trees = 5, write.forest = TRUE)
  pred <- predict(rf, iris, predict.all = TRUE, num.trees = 3)
  expect_equal(pred$num.trees, 3)
  expect_equal(dim(pred$predictions), c(nrow(iris), 3))
})

test_that("If num.trees not set, all trees are used for prediction", {
  rf <- crazyforest(Species ~ ., iris, num.trees = 5, write.forest = TRUE)
  pred <- predict(rf, iris, predict.all = TRUE)
  expect_equal(pred$num.trees, 5)
  expect_equal(dim(pred$predictions), c(nrow(iris), 5))
})

test_that("Error if unknown value for type", {
  rf <- crazyforest(Species ~ ., iris, num.trees = 5, write.forest = TRUE)
  expect_error(predict(rf, iris, type = "class"))
})

test_that("Terminal nodes returned by predict are node ids, classification", {
  rf <- crazyforest(Species ~ ., iris, num.trees = 5, write.forest = TRUE)
  pred <- predict(rf, iris, type = "terminalNodes")
  
  expect_equal(dim(pred$predictions), c(nrow(iris), rf$num.trees))
  expect_true(all(pred$predictions > 0))
  expect_true(all(pred$predictions < max(sapply(rf$forest$split.varIDs, length))))
})


test_that("Terminal nodes returned by predict are node ids, probability", {
  rf <- crazyforest(Species ~ ., iris, num.trees = 5, write.forest = TRUE, probability = TRUE)
  pred <- predict(rf, iris, type = "terminalNodes")
  
  expect_equal(dim(pred$predictions), c(nrow(iris), rf$num.trees))
  expect_true(all(pred$predictions > 0))
  expect_true(all(pred$predictions < max(sapply(rf$forest$split.varIDs, length))))
})

test_that("Terminal nodes returned by predict are node ids, regression", {
  rf <- crazyforest(Sepal.Length ~ ., iris, num.trees = 5, write.forest = TRUE)
  pred <- predict(rf, iris, type = "terminalNodes")
  
  expect_equal(dim(pred$predictions), c(nrow(iris), rf$num.trees))
  expect_true(all(pred$predictions > 0))
  expect_true(all(pred$predictions < max(sapply(rf$forest$split.varIDs, length))))
})

test_that("Terminal nodes returned by predict are node ids, survival", {
  rf <- crazyforest(Surv(time, status) ~ ., veteran, num.trees = 5, write.forest = TRUE)
  pred <- predict(rf, veteran, type = "terminalNodes")
  
  expect_equal(dim(pred$predictions), c(nrow(veteran), rf$num.trees))
  expect_true(all(pred$predictions > 0))
  expect_true(all(pred$predictions < max(sapply(rf$forest$split.varIDs, length))))
})

test_that("Same result with warning if getTerminalNodeIDs() used", {
  rf <- crazyforest(Species ~ ., iris, num.trees = 5)
  pred <- predict(rf, iris, type = "terminalNodes")
  expect_warning(expect_equal(getTerminalNodeIDs(rf, iris), pred$predictions))
})

test_that("predict.all works for single observation", {
  rf <- crazyforest(Species ~ ., iris, num.trees = 5, write.forest = TRUE)
  pred <- predict(rf, iris[1, ], predict.all = TRUE)
  
  expect_equal(dim(pred$predictions), c(1, rf$num.trees))
})

test_that("predict.all factor probabilities in correct order", {
  rf <- crazyforest(Species ~ ., iris[c(51:100, 101:150, 1:50), ], probability = TRUE, num.trees = 5)
  pred_all <- rowMeans(predict(rf, iris, predict.all = TRUE)$predictions[139,,])
  pred_mean <- predict(rf, iris, predict.all = FALSE)$predictions[139,]
  
  expect_equal(pred_all, pred_mean, tolerance = .001)
})

test_that("Warning if predicting with corrected impurity importance", {
  rf <- crazyforest(Species ~ ., iris, num.trees = 5, importance = "impurity_corrected")
  expect_warning(predict(rf, iris))
})
