#' @title Funciones internas de crazyforest
#' @description Estas funciones realizan tareas auxiliares de procesamiento de datos,
#' cálculos estadísticos internos o conexión con el motor de C++.
#' No están destinadas a ser llamadas directamente por el usuario.
#'
#' @name crazyforest-internal
#' @keywords internal
NULL

#' @rdname crazyforest-internal
#' @export
as.data.frame.crazyforest.prediction <- function(x, ...) UseMethod("as.data.frame.crazyforest.prediction")

#' @rdname crazyforest-internal
#' @export
calibrateEB <- function() {}

#' @rdname crazyforest-internal
#' @export
convert.pre.xy <- function() {}

#' @rdname crazyforest-internal
#' @export
crazyforestCpp <- function() {}

#' @rdname crazyforest-internal
#' @export
gbayes <- function() {}

#' @rdname crazyforest-internal
#' @export
gfit <- function() {}

#' @rdname crazyforest-internal
#' @export
hshrink_prob <- function() {}

#' @rdname crazyforest-internal
#' @export
hshrink_regr <- function() {}

#' @rdname crazyforest-internal
#' @export
integer.to.factor <- function() {}

#' @rdname crazyforest-internal
#' @export
largest.quantile <- function() {}

#' @rdname crazyforest-internal
#' @export
numSmaller <- function() {}

#' @rdname crazyforest-internal
#' @export
pca.order <- function() {}

#' @rdname crazyforest-internal
#' @export
rInfJack <- function() {}

#' @rdname crazyforest-internal
#' @export
randomObsNode <- function() {}

#' @rdname crazyforest-internal
#' @export
replace_class_counts <- function() {}

#' @rdname crazyforest-internal
#' @export
save.sample <- function() {}

#' @rdname crazyforest-internal
#' @export
str.crazyforest <- function(object, ...) {}

#' @rdname crazyforest-internal
#' @export
str.crazyforest.forest <- function(object, ...) {}
