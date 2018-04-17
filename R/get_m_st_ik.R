


#' Simulate 2D array of [imperfect, index] counts
#'
#' @author Ty Stanford <tyman@lbtinnovations.com>
#' @description Simulate 2D array of [imperfect, index] counts
#' @param p_ijk a [resolver, index, imperfect] 3D array of \eqn{p_{k|ij}}=P(resolver=k | index=i, imperfect=j)
#' @param s_st_ij a [imperfect, index] 2D array of counts where resolver value aren't observed (\code{NA}s).
#' @return a [resolver, index] 2D array of simulated counts. Elements are \eqn{\sum_{j=1}^K m^*_{ijk}} values.
#' @export
#' @examples
#' library(tibble)
#' set.seed(1234)
#' ABC <- data_frame(
#'   A=sample(1:3, 20, replace=TRUE),
#'   B=sample(1:3, 20, replace=TRUE),
#'   C=sample(c(NA, 1:3), 20, replace=TRUE)
#' )
#' get_s_st_ij(ABC, "A", "B", "C")
#' get_p_ijk(get_m_ijk(ABC, "A", "B", "C"))
#' get_m_st_ik(get_p_ijk(get_m_ijk(ABC, "A", "B", "C")), get_s_st_ij(ABC, "A", "B", "C"))


get_m_st_ik <- function(p_ijk, s_st_ij) {

  m_st_ijk <- sim_mstar(p_ijk, s_st_ij)

  m_st_ik <- apply(m_st_ijk, 1:2, sum)

  return(m_st_ik)

}







