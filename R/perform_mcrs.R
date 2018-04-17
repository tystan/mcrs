globalVariables(c(
  "param", "est", "lo", "up"
))

#' Perform mCRS using a one sample-per-row input dataset
#'
#' @author Ty Stanford <tyman@lbtinnovations.com>
#' @description Performs the mCRS analysis
#' @param dat data frame that contains the index test, imperfect truth and resolver columns (see details)
#' @param index string of column name in \code{dat} corresponding to the index test
#' @param imperfect string of column name in \code{dat} corresponding to the imperfect truth
#' @param resolver string of column name in \code{dat} corresponding to the resolver
#' @param pos the levels of \code{index}/\code{imperfect}/\code{resolver} that are considered "positive"
#' @param r the number of random simulations of \code{m*_ik} to generate (default=1000)
#' @param seed for reporducibility of results (default=12345678)
#' @param alpha confidence level (default=0.05)
#' @param summ the full \code{r} results are returned when \code{FALSE} or just the summarised values (default, \code{TRUE})
#' @return A tibble with columns \code{param}, \code{cases}, \code{correct}, \code{est}, \code{lo}, \code{up}. The number of rows is determined by the value of \code{summ}
#' @details Currently \code{perform_mcrs} requires \code{dat} to contain variables with levels that are consectutive integers starting at \code{1} (i.e. here the outcome levels are labelled 1, 2, 3, 4).
#' @export
#' @examples
#' library(tibble)
#' data(brenton2018)
#' # the sens+spec estimates using the imperfect truth
#' get_sens_spec(table(brenton2018[["S"]], brenton2018[["A"]]), 3:4)
#' # now check against mCRS (allow ~0.02 sec per repetition)
#' perform_mcrs(brenton2018, "A", "S", "P", pos = 3:4, r = 10)


perform_mcrs <-
  function(
    dat,
    index, imperfect, resolver,
    pos,
    r = 1000,
    seed = 12345678,
    alpha = 0.05,
    summ = TRUE
  ) {

  col_check(dat, c(index, imperfect, resolver))

  # create 3D array/3-way contingency table of complete observations, indices: [k, i, j]
  m_ijk   <-   get_m_ijk(dat, index, imperfect, resolver) #
  # create constant 2D array of out-of-resamples, indices: [j, i]
  s_st_ij <- get_s_st_ij(dat, index, imperfect, resolver) # s^*_ij
  # create the constant 3D array of probabilities, indices: [k, i, j]
  p_ijk   <- get_p_ijk(m_ijk)
  # create a list of the constant 2D array of resamples, indices: [k, i]
  m_ik    <-  get_m_ik(m_ijk)

  # now randomly generate the unobserved m_st_ik values r-times
  # create a list (length r) 2D arrays of different m_st_ik, indices: [k, i]
  set.seed(seed) # make reproducable
  msl <- replicate(r, get_m_st_ik(p_ijk, s_st_ij), simplify = FALSE)

  # create a list (length r) 2D arrays of different c_ik, indices: [k, i]
  cl  <- map(msl, ~get_c_ik(m_ik, .))

  # calculate summary stats for each c_ik in list
  # concatenate each returned data_frame row-wise
  ss  <- map_dfr(cl, ~get_sens_spec(., pos = pos, alpha = alpha))

  if(summ) { # just return mean est, and relevant quantiles of CIs
    ss_summ <-
      ss %>%
      group_by(param) %>%
      summarise(
        est = mean(est),
        lo=quantile(lo, alpha/2),
        up=quantile(up, 1-alpha/2)
      )
    return(ss_summ)
  } else {
    return(ss)
  }

}
