#' Check a vector of column names are all contained in a suppled data frame
#'
#' @author Ty Stanford <tyman@lbtinnovations.com>
#' @description Check a vector of column names are all contained in a suppled data frame
#' @param df data frame
#' @param cols character vector of column names to be checked whether they exist in \code{df}
#' @return \code{TRUE} if all \code{cols} exist in \code{df}
#' @export
#' @examples
#' library(tibble)
#' adf <- data_frame(A = 1:2, B = 3:4, `C=1` = LETTERS[1:2])
#' col_check(adf, LETTERS[1:2])
#' col_check(adf, c("A", "B", "C=1"))

col_check <- function(df, cols) {

  cns <- colnames(df)
  cols_found <- cols %in% cns
  if (!all(cols_found)) {
    stop(paste0(cols[!cols_found], collapse=", "), "not found in input data.frame")
  } else {
    return(TRUE)
  }

}
