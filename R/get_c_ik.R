
#' Add 2D arrays of [resolver, index] observed counts and [resolver, index] simulated counts
#'
#' @author Ty Stanford <tyman@lbtinnovations.com>
#' @description Add 2D arrays of [resolver, index] observed counts and [resolver, index] simulated counts
#' @param m_ik a [resolver, index] 2D array of counts. Elements are \eqn{\sum_{j=1}^K m_{ijk}} values.
#' @param m_st_ik a [resolver, index] 2D array of counts. Elements are \eqn{\sum_{j=1}^K m^*_{ijk}} values.
#' @return a [resolver, index] 2D array of counts. Elements are \eqn{c_{ik}} values.
#' @export
#' @examples
#' library(tibble)
#' set.seed(1234)
#' ABC <- data_frame(
#'   A=sample(1:3, 20, replace=TRUE),
#'   B=sample(1:3, 20, replace=TRUE),
#'   C=sample(c(NA, 1:3), 20, replace=TRUE)
#' )
#' m <- get_m_ik(get_m_ijk(ABC, "A", "B", "C"))
#' p <- get_p_ijk(get_m_ijk(ABC, "A", "B", "C"))
#' s_st <- get_s_st_ij(ABC, "A", "B", "C")
#' m_st <- get_m_st_ik(p, s_st)
#' get_c_ik(m, m_st)


get_c_ik <- function(m_ik, m_st_ik) {

  return(m_st_ik + m_ik)

}
