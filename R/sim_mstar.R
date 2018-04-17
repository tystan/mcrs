




#' Calculate a simulated [resolver, index, imperfect] 3D array
#'
#' @author Ty Stanford <tyman@lbtinnovations.com>
#' @description Calculate a simulated [resolver, index, imperfect] 3D array
#' @param p_ijk a [resolver, index, imperfect] 3D array of probabilities. Elements are \eqn{p_{k|ij}=P(resolver | index, imperfect)}.
#' @param s_st_ij a [index, imperfect] 2D array counts requiring a simulated resolver value.
#' @return a [resolver, index, imperfect] 3D array of counts. Elements are \eqn{m^*_{k|ij}} values.
#' @export
#' @examples
#' library(tibble)
#' set.seed(1234)
#' AB <- data_frame(A=sample(1:3, 20, replace=TRUE), B=sample(1:3, 20, replace=TRUE))
#' get_sens_spec(with(AB,table(A,B)), pos = 2:3)


sim_mstar <- function(p_ijk, s_st_ij) {

  m_st_ijk <- p_ijk # array(0, dim = dim(m_ijk))
  K <- dim(p_ijk)[1]

  for (i in 1:K) for (j in 1:K)
    m_st_ijk[, i, j] <- rmultinom(n = 1, size = s_st_ij[j, i], prob = p_ijk[, i, j])

  return(m_st_ijk)
}







