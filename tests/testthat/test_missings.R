library(crazyforest)
library(survival)
context("crazyforest_unordered")

test_that("Third child for missings only there if missings in data", {
  rf1 <- crazyforest(Species ~ ., iris, num.trees = 5)
  expect_length(rf1$forest$child.nodeIDs[[1]], 2)
  
  dat <- iris
  dat[1, 1] <- NA
  rf2 <- crazyforest(Species ~ ., dat, num.trees = 5)
  expect_length(rf2$forest$child.nodeIDs[[1]], 3)
})

test_that("Training works with missing values in x but not in y", {
  dat <- iris
  dat[25, 1] <- NA
  expect_silent(crazyforest(Species ~ ., dat, num.trees = 5))
  expect_silent(crazyforest(Petal.Width ~ ., dat, num.trees = 5))
  expect_error(crazyforest(Sepal.Length ~ ., dat, num.trees = 5), "Missing data in dependent variable.")
  
  dat <- iris
  dat[4, 5] <- NA
  expect_error(crazyforest(Species ~ ., dat, num.trees = 5), "Missing data in dependent variable.")
})

test_that("No error if missing value in irrelevant column, training", {
  dat <- iris
  dat[1, "Sepal.Width"] <- NA
  expect_silent(crazyforest(Species ~ Sepal.Length, dat, num.trees = 5))
})

test_that("No error if missing value in irrelevant column, prediction", {
  rf <- crazyforest(Species ~ Sepal.Length, iris, num.trees = 5)
  dat <- iris
  dat[1, "Sepal.Width"] <- NA
  expect_silent(predict(rf, dat))
})

test_that("Prediction works with missing values, classification", {
  rf <- crazyforest(Species ~ ., iris, num.trees = 5, write.forest = TRUE)
  
  dat <- iris
  dat[4, 4] <- NA
  dat[25, 1] <- NA
  expect_silent(predict(rf, dat))
})

test_that("Prediction works with missing values, regression", {
  rf <- crazyforest(Sepal.Width ~ ., iris, num.trees = 5, write.forest = TRUE)
  
  dat <- iris
  dat[4, 4] <- NA
  dat[25, 1] <- NA
  expect_silent(predict(rf, dat))
})

test_that("Order splitting working with missing values for classification", {
  n <- 20
  dt <- data.frame(x = sample(c("A", "B", "C", "D", NA), n, replace = TRUE), 
                   y = factor(rbinom(n, 1, 0.5)),
                   stringsAsFactors = FALSE)
  
  rf <- crazyforest(y ~ ., data = dt, num.trees = 5, min.node.size = n/2, respect.unordered.factors = 'order')
  expect_true(all(rf$forest$is.ordered))
})

test_that("Order splitting working with missing values for multiclass classification", {
  n <- 20
  dt <- data.frame(x = sample(c("A", "B", "C", "D", NA), n, replace = TRUE), 
                   y = factor(sample(c("A", "B", "C", "D"), n, replace = TRUE)),
                   stringsAsFactors = FALSE)
  
  rf <- crazyforest(y ~ ., data = dt, num.trees = 5, min.node.size = n/2, respect.unordered.factors = 'order')
  expect_true(all(rf$forest$is.ordered))
})

test_that("Missing values for survival not yet working", {
  dat <- veteran
  dat[1, 1] <- NA
  
  expect_error(crazyforest(Surv(time, status) ~ ., dat, num.trees = 5), "Error: Missing value handling not yet implemented for survival forests\\.")
})

test_that("na.omit leads to same result as manual removal, classification", {
  dat <- iris
  dat[1, 1] <- NA
  rf1 <- crazyforest(Species ~ ., dat, num.trees = 5, seed = 10, na.action = "na.omit")
  
  dat2 <- na.omit(dat)
  rf2 <- crazyforest(Species ~ ., dat2, num.trees = 5, seed = 10)
  
  expect_equal(rf1$predictions, rf2$predictions)
})

test_that("na.omit leads to same result as manual removal, probability", {
  dat <- iris
  dat[1, 1] <- NA
  rf1 <- crazyforest(Species ~ ., dat, num.trees = 5, probability = TRUE, seed = 10, na.action = "na.omit")
  
  dat2 <- na.omit(dat)
  rf2 <- crazyforest(Species ~ ., dat2, num.trees = 5, probability = TRUE, seed = 10)
  
  expect_equal(rf1$predictions, rf2$predictions)
})

test_that("na.omit leads to same result as manual removal, regression", {
  dat <- iris
  dat[1, 1] <- NA
  rf1 <- crazyforest(Sepal.Width ~ ., dat, num.trees = 5, seed = 10, na.action = "na.omit")
  
  dat2 <- na.omit(dat)
  rf2 <- crazyforest(Sepal.Width ~ ., dat2, num.trees = 5, seed = 10)
  
  expect_equal(rf1$predictions, rf2$predictions)
})

test_that("na.omit leads to same result as manual removal, survival", {
  dat <- veteran
  dat[1, 1] <- NA
  rf1 <- crazyforest(Surv(time, status) ~ ., dat, num.trees = 5, seed = 10, na.action = "na.omit")
  
  dat2 <- na.omit(dat)
  rf2 <- crazyforest(Surv(time, status) ~ ., dat2, num.trees = 5, seed = 10)
  
  expect_equal(rf1$chf, rf2$chf)
})

test_that("na.omit not working if no observations left", {
  dat <- iris
  dat[1:150, 1] <- NA
  expect_error(crazyforest(Species ~ ., dat, num.trees = 5, na.action = "na.omit"), "Error: No observations left after removing missing values\\.")
})

test_that("No negative importance values with na.learn", {
  dat <- iris
  dat[sample(nrow(dat), 50), 1:4] <- NA 
  rf <- crazyforest(Species ~ ., dat, importance = "impurity", na.action = "na.learn", num.trees = 5)
  lapply(rf$variable.importance, expect_gte, 0)
})
