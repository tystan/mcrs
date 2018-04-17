
#' Get 2D array of [resolver, index] counts from 3D array of [resolver, index, imperfect] counts
#'
#' @author Ty Stanford <tyman@lbtinnovations.com>
#' @description Get 2D array of [resolver, index] counts from 3D array of [resolver, index, imperfect] counts
#' @param m_ijk a [resolver, index, imperfect] 3D array of counts
#' @return a [resolver, index] 2D array of counts. Elements are \eqn{\sum_{j=1}^K m_{ijk}} values.
#' @export
#' @examples
#' library(tibble)
#' set.seed(1234)
#' ABC <- data_frame(
#'   A=sample(1:3, 20, replace=TRUE),
#'   B=sample(1:3, 20, replace=TRUE),
#'   C=sample(c(NA, 1:3), 20, replace=TRUE)
#' )
#' get_m_ik(get_m_ijk(ABC, "A", "B", "C"))

get_m_ik <- function(m_ijk) {

  m_ik <- apply(m_ijk, 1:2, sum)

  return(m_ik)

}


