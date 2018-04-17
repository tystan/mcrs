





#' Calculate 3D array of [resolver, index, imperfect] counts
#'
#' @author Ty Stanford <tyman@lbtinnovations.com>
#' @description Calculate 3D array of [resolver, index, imperfect] counts from a dataset
#' @param dat data frame that contains the index test, imperfect truth and resolver columns
#' @param index string of column name in \code{dat} corresponding to the index test
#' @param imperfect string of column name in \code{dat} corresponding to the imperfect truth
#' @param resolver string of column name in \code{dat} corresponding to the resolver
#' @return a [resolver, index, imperfect] 3D array of counts. Elements are \eqn{m_{ijk}} values. Rows where resolver are \code{NA} are removed.
#' @export
#' @examples
#' library(tibble)
#' set.seed(1234)
#' ABC <- data_frame(
#'   A=sample(1:3, 20, replace=TRUE),
#'   B=sample(1:3, 20, replace=TRUE),
#'   C=sample(c(NA, 1:3), 20, replace=TRUE)
#' )
#' get_m_ijk(ABC, "A", "B", "C")

get_m_ijk <- function(dat, index, imperfect, resolver) {

  return(table(
    dat[[resolver]], dat[[index]], dat[[imperfect]],
    useNA='no'
  )) # indices: [k, i, j]

}







