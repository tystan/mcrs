#' Data from Benton et al. (2018)
#'
#' These are the data from from Benton et al. (2018) containing the APAS (A, the index test),
#' St Vincent's standard workflow (S, imperfect truth) and the panel consensus (P, resolver) variables.
#'
#' @format A data frame with 881 rows and 3 variables:
#' \describe{
#'   \item{A}{APAS values \code{1}, \code{2}, \code{3} and \code{4} representing growth enumeration of 0, 10^6, 10^7 and 10^8+ CFU/L, respectively.}
#'   \item{S}{St Vincent's standard workflow values \code{1}, \code{2}, \code{3} and \code{4} representing growth enumeration of 0, 10^6, 10^7 and 10^8+ CFU/L, respectively.}
#'   \item{P}{Panel consensus values \code{1}, \code{2}, \code{3} and \code{4} representing growth enumeration of 0, 10^6, 10^7 and 10^8+ CFU/L, respectively. Column contains 600 \code{NA} values where the resolver values are not obtained.}
#' }
#' @docType data
#'
#' @usage data(brenton2018)
"brenton2018"
