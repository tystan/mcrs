

#' Calculate 2D array of [imperfect, index] counts where resolver is \code{NA}
#'
#' @author Ty Stanford <tyman@lbtinnovations.com>
#' @description Calculate 2D array of [imperfect, index] counts where resolver is \code{NA} from dataset
#' @param dat data frame that contains the index test, imperfect truth and resolver columns
#' @param index string of column name in \code{dat} corresponding to the index test
#' @param imperfect string of column name in \code{dat} corresponding to the imperfect truth
#' @param resolver string of column name in \code{dat} corresponding to the resolver
#' @return a [imperfect, index] 2D array of counts. Elements are \eqn{s^*_{ij}} values. Only rows where resolver are \code{NA} are used.
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

get_s_st_ij <- function(dat, index, imperfect, resolver) {

  dat_miss <- dat[is.na(dat[[resolver]]), ]
  return(table(
    dat_miss[[imperfect]], dat_miss[[index]]
  )) # s^*_ij, indices: [j, i]

}



