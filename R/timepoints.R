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
timepoints <- function(x, ...)  UseMethod("timepoints")

##' Extract unique death times of CrazyForest Survival prediction object.
##'
##'
##' @title CrazyForest timepoints
##' @param x CrazyForest Survival prediction object.
##' @param ... Further arguments passed to or from other methods.
##' @return Unique death times
##' @seealso \code{\link{crazyforest}}
##' @author Javier Pérez-Rodríguez
##' @export
timepoints.crazyforest.prediction <- function(x, ...) {
  if (!inherits(x, "crazyforest.prediction")) {
    stop("Object ist no crazyforest.prediction object.")
  }
  if (x$treetype != "Survival") {
    stop("No timepoints found. Object is no Survival prediction object.")
  }
  if (is.null(x$unique.death.times)) {
    stop("No timepoints found.")
  }
  return(x$unique.death.times)
}

##' Extract unique death times of CrazyForest Survival forest
##'
##'
##' @title CrazyForest timepoints
##' @param x CrazyForest Survival forest object.
##' @param ... Further arguments passed to or from other methods.
##' @return Unique death times
##' @seealso \code{\link{crazyforest}}
##' @author Javier Pérez-Rodríguez
##' @aliases timepoints
##' @export
timepoints.crazyforest <- function(x, ...) {
  if (!inherits(x, "crazyforest")) {
    stop("Object ist no crazyforest object.")
  }
  if (x$treetype != "Survival") {
    stop("No timepoints found. Object is no Survival forest.")
  }
  if (is.null(x$unique.death.times)) {
    stop("No timepoints found.")
  }
  return(x$unique.death.times)
}

