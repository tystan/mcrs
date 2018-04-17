
#' Calculate column-wise proportions of counts of a matrix
#'
#' @author Ty Stanford <tyman@lbtinnovations.com>
#' @description Calculate column-wise proportions of counts of a matrix (2D array)
#' @param x a square matrix (or object of class "table")
#' @return an object of the same dim as \code{x}.
#' The elements are the original elements divided by the column sum.
#' However, if the column sum is 0, the column is replaced by the corresponding column in the equivalent size identity matrix.
#' @export
#' @examples
#' A <- matrix(c(1,2,1,0,0,0,6,3,3), nrow=3)
#' two_dim_col_wise_prop(A)


two_dim_col_wise_prop <- function(x) {
  denom <- colSums(x)
  K <- length(denom)
  no_denom <- which(denom == 0)
  if (length(no_denom) > 0) {
    x[, no_denom] <- diag(K)[, no_denom]
    denom[no_denom] <- 1
  }
  return(x / rep(denom, each=K))
}





