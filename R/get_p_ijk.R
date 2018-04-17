

#' Calculate 3D array of \eqn{p_{k|ij}} values
#'
#' @author Ty Stanford <tyman@lbtinnovations.com>
#' @description Calculate 3D array of \eqn{p_{k|ij}} values.
#' @param m_ijk a [resolver, index, imperfect] 3D array of \eqn{m_{ijk}} values
#' @return a [resolver, index, imperfect] 3D array of \eqn{p_{k|ij}}=P(resolver=k | index=i, imperfect=j).
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
#' get_p_ijk(get_m_ijk(ABC, "A", "B", "C"))


get_p_ijk <- function(m_ijk) {

  p_ijk <- apply(m_ijk, 3, two_dim_col_wise_prop)
  dim(p_ijk) <- dim(m_ijk)
  return(p_ijk)

}



