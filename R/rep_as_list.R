

#' Create a list of an object repeated \code{x} times
#'
#' @author Ty Stanford <tyman@lbtinnovations.com>
#' @description Create a list with length \code{n} with the object \code{x} in each elelment of the list
#' @param x an object
#' @param n number of repeated elements
#' @return a list with length \code{n} with the object \code{x} in each elelment of the list
#' @export
#' @examples
#' A <- matrix(c(1,2,1,0,0,0,6,3,3), nrow=3)
#' rep_as_list(A, 3)

rep_as_list <- function(x, n) {
  return(list(x)[rep(1,n)])
}
