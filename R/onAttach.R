.onAttach <- function(libname, pkgname) {
  if (!interactive()) {
    return()
  }

  threads_env <- Sys.getenv("R_CRAZYFOREST_NUM_THREADS")
  threads_option1 <- getOption("crazyforest.num.threads")
  threads_option2 <- getOption("Ncpus")

  if (threads_env != "") {
    thread_string <- paste(threads_env, "threads as set by environment variable R_CRAZYFOREST_NUM_THREADS. Can be overwritten with num.threads.")
  } else if (!is.null(threads_option1)) {
    thread_string <- paste(threads_option1, "threads as set by options(crazyforest.num.threads = N). Can be overwritten with num.threads.")
  } else if (!is.null(threads_option2)) {
    thread_string <- paste(threads_option2, "threads as set by options(Ncpus = N). Can be overwritten with num.threads.")
  } else {
    thread_string <- "2 threads (default). Change with num.threads in crazyforest() and predict(), options(Ncpus = N), options(crazyforest.num.threads = N) or environment variable R_CRAZYFOREST_NUM_THREADS."
  }

  packageStartupMessage(paste("crazyforest", packageVersion("crazyforest"), "using", thread_string))
}
