# -------------------------------------------------------------------------------
#   This file is part of CrazyForest.
#
# CrazyForest is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# CrazyForest is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with CrazyForest. If not, see <http://www.gnu.org/licenses/>.
#
# Written by:
#
#   Javier Pérez-Rodríguez
# Universidad de CÃ³rdoba
# Spain


# Germany
#
# javier.perez@uco.es
# -------------------------------------------------------------------------------

##' @export
predictions <- function(x, ...)  UseMethod("predictions")

##' Extract predictions of CrazyForest prediction object.
##'
##'
##' @title CrazyForest predictions
##' @param x CrazyForest prediction object.
##' @param ... Further arguments passed to or from other methods.
##' @return Predictions: Classes for Classification forests, Numerical values for Regressions forests and the estimated survival functions for all individuals for Survival forests.
##' @seealso \code{\link{crazyforest}}
##' @author Javier Pérez-Rodríguez
##' @aliases predictions
##' @export
predictions.crazyforest.prediction <- function(x, ...) {
  if (!inherits(x, "crazyforest.prediction")) {
    stop("Object ist no crazyforest.prediction object.")
  }
  if (x$treetype == "Classification" || x$treetype == "Regression" || x$treetype == "Probability estimation") {
    if (is.null(x$predictions)) {
      stop("No predictions found.")
    } else {
      return(x$predictions)
    }
  } else if (x$treetype == "Survival") {
    if (is.null(x$survival)) {
      stop("No predictions found.")
    } else {
      return(x$survival)
    }
  } else {
    stop("Unknown tree type.")
  }
}

##' Extract training data predictions of CrazyForest object.
##'
##'
##' @title CrazyForest predictions
##' @param x CrazyForest object.
##' @param ... Further arguments passed to or from other methods.
##' @return Predictions: Classes for Classification forests, Numerical values for Regressions forests and the estimated survival functions for all individuals for Survival forests.
##' @seealso \code{\link{crazyforest}}
##' @author Javier Pérez-Rodríguez
##' @export
predictions.crazyforest <- function(x, ...) {
  if (!inherits(x, "crazyforest")) {
    stop("Object ist no crazyforest object.")
  }
  if (x$treetype == "Classification" || x$treetype == "Regression" || x$treetype == "Probability estimation") {
    if (is.null(x$predictions)) {
      stop("No predictions found.")
    } else {
      return(x$predictions)
    }
  } else if (x$treetype == "Survival") {
    if (is.null(x$survival)) {
      stop("No predictions found.")
    } else {
      return(x$survival)
    }
  } else {
    stop("Unknown tree type.")
  }
}

##' @export
as.data.frame.crazyforest.prediction <- function(x, ...) {
  if (x$treetype == "Survival") {
    df <- data.frame(x$survival)
    colnames(df) <- paste0("time=", x$unique.death.times)
  } else if (x$treetype == "Probability estimation") {
    df <- data.frame(x$predictions)
  } else {
    df <- data.frame(prediction = x$predictions)
  }
  
  if (!is.null(x$se)) {
    df$se <- x$se
  }
  
  df
} 

