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

##' This function is deprecated. 
##' Please use predict() with \code{type = "terminalNodes"} instead.
##' This function calls predict() now. 
##'
##' @title Get terminal node IDs (deprecated)
##' @param rf \code{crazyforest} object.
##' @param dat New dataset. Terminal node IDs for this dataset are obtained. 
##'
##' @return Matrix with terminal nodeIDs for all observations in dataset and trees.
##'
##' @examples
##' rf <- crazyforest(Species ~ ., data = iris, num.trees = 5, write.forest = TRUE)
##' getTerminalNodeIDs(rf, iris)
##' @export
getTerminalNodeIDs <- function(rf, dat) {
  warning("Function getTerminalNodeIDs() deprecated, calling predict().")
  predict(rf, dat, type = "terminalNodes")$predictions
}


