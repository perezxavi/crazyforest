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

##' Print contents of CrazyForest object.
##'
##'
##' @title Print CrazyForest
##' @param x Object of class 'crazyforest'.
##' @param ... Further arguments passed to or from other methods.
##' @seealso \code{\link{crazyforest}}
##' @author Javier Pérez-Rodríguez
##' @export
print.crazyforest <- function(x, ...) {
  cat("CrazyForest result\n\n")
  cat("Call:\n", deparse(x$call), "\n\n")
  cat("Type:                            ", x$treetype, "\n")
  cat("Number of trees:                 ", x$num.trees, "\n")
  cat("Sample size:                     ", x$num.samples, "\n")
  cat("Number of independent variables: ", x$num.independent.variables, "\n")
  cat("Mtry:                            ", x$mtry, "\n")
  cat("Target node size:                ", x$min.node.size, "\n")
  cat("Variable importance mode:        ", x$importance.mode, "\n")
  cat("Splitrule:                       ", x$splitrule, "\n")
  if (x$treetype == "Survival") {
    cat("Number of unique death times:    ", length(x$unique.death.times), "\n")
  }
  if (!is.null(x$splitrule) && x$splitrule == "extratrees" && !is.null(x$num.random.splits)) {
    cat("Number of random splits:         ", x$num.random.splits, "\n")
  }
  if (x$treetype == "Classification") {
    cat("OOB prediction error:            ", sprintf("%1.2f %%", 100*x$prediction.error), "\n")
  } else if (x$treetype == "Regression") {
    cat("OOB prediction error (MSE):      ", x$prediction.error, "\n")
  } else if (x$treetype == "Survival") {
    cat("OOB prediction error (1-C):      ", x$prediction.error, "\n")
  } else if (x$treetype == "Probability estimation") {
    cat("OOB prediction error (Brier s.): ", x$prediction.error, "\n")
  } else {
    cat("OOB prediction error:            ", x$prediction.error, "\n")
  }
  if (x$treetype == "Regression") {
    cat("R squared (OOB):                 ", x$r.squared, "\n")
  }
}

##' Print contents of CrazyForest forest object.
##'
##'
##' @title Print CrazyForest forest
##' @param x Object of class 'crazyforest.forest'.
##' @param ... further arguments passed to or from other methods.
##' @author Javier Pérez-Rodríguez
##' @export
print.crazyforest.forest <- function(x, ...) {
  cat("CrazyForest forest object\n\n")
  cat("Type:                         ", x$treetype, "\n")
  cat("Number of trees:              ", x$num.trees, "\n")
  if (x$treetype == "Survival") {
    cat("Number of unique death times: ", length(x$unique.death.times), "\n")
  }
}

##' Print contents of CrazyForest prediction object.
##'
##'
##' @title Print CrazyForest prediction
##' @param x Object of class 'crazyforest.prediction'.
##' @param ... further arguments passed to or from other methods.
##' @author Javier Pérez-Rodríguez
##' @export
print.crazyforest.prediction <- function(x, ...) {
  cat("CrazyForest prediction\n\n")
  cat("Type:                            ", x$treetype, "\n")
  cat("Sample size:                     ", x$num.samples, "\n")
  cat("Number of independent variables: ", x$num.independent.variables, "\n")
  if (x$treetype == "Survival") {
    cat("Number of unique death times:    ", length(x$unique.death.times), "\n")
  }
}

##' @export
str.crazyforest.forest <- function(object, max.level = 2, ...) {
  class(object) <- "list"
  str(object, max.level = max.level, ...)
}

##' @export
str.crazyforest <- function(object, max.level = 2, ...) {
  class(object) <- "list"
  str(object, max.level = max.level, ...)
}

