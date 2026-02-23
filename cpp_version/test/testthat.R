
library(crazyforest)
library(data.table)
library(testthat)
library(survival)

# Function to call C++ version from R
crazyforest_cpp <- function(data, ...) {
  if (is.data.frame(data) && any(sapply(data, is.numeric))) {
    idx_numeric <- sapply(data, is.numeric)
    data[, !idx_numeric] <- lapply(data[, !idx_numeric, drop = FALSE], as.numeric)
  }
  fwrite(data, "temp_data.csv")
  ret <- system2("../../build/crazyforest", 
                 args = c("--verbose", "--file temp_data.csv", paste0("--", names(list(...)), " ", list(...))), 
                 stdout = TRUE, stderr = TRUE)
  if (length(ret) == 1 &&  nchar(ret) >= 5 && substr(ret, 1, 5) == "Error") {
    stop(ret)
  }
  unlink("temp_data.csv")
  ret
}

test_dir("testthat")




