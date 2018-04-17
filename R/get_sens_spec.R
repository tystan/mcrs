globalVariables(c(
  "correct", "cases"
))

#' Calculate sensitivity and specificity
#'
#' @author Ty Stanford <tyman@lbtinnovations.com>
#' @description Calculate sensitivity and specificity from a confusion matrix
#' @param tab a confusion matrix (object of class "matrix" or table")
#' @param pos the levels of the margins that are considered "positive"
#' @param alpha confidence level of CIs (default=0.05)
#' @return A tibble with columns \code{param} ("sens" or "spec"), \code{cases}, \code{correct}, \code{est}, \code{lo}, \code{up}.
#' @export
#' @examples
#' library(tibble)
#' set.seed(1234)
#' AB <- data_frame(A=sample(1:3, 20, replace=TRUE), B=sample(1:3, 20, replace=TRUE))
#' get_sens_spec(with(AB,table(A,B)), pos = 2:3)


get_sens_spec <- function(tab, pos, alpha = 0.05) {

  spec_rws <- !(rownames(tab) %in% as.character(pos))
  sens_rws <-   rownames(tab) %in% as.character(pos)

  data_frame(
    param = c("sens", "spec"),
    cases = as.integer(c(sum(tab[sens_rws, ]), sum(tab[spec_rws, ]))),
    correct = as.integer(c(sum(tab[sens_rws, sens_rws]), sum(tab[spec_rws, spec_rws]))),
    est = correct / cases,
    lo = binom.confint(correct, cases, conf.level = 1-alpha, methods = "wilson")$lower,
    up = binom.confint(correct, cases, conf.level = 1-alpha, methods = "wilson")$upper
  )
}




