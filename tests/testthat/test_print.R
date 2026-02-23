## Tests for print function

library(crazyforest)
context("crazyforest_print")

## Initialize the random forest
rf <- crazyforest(Species ~ ., iris, num.trees = 5, write.forest = TRUE)

## Test print crazyforest function
expect_that(print(rf), prints_text("CrazyForest result"))

## Test print forest function
expect_that(print(rf$forest), prints_text("CrazyForest forest object"))

## Test print prediction function
expect_that(print(predict(rf, iris)), prints_text("CrazyForest prediction"))

## Test str crazyforest function
expect_that(str(rf), prints_text("List of 16"))

## Test str forest function
expect_that(str(rf$forest), prints_text("List of 9"))
