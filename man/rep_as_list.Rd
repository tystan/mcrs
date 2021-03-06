% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rep_as_list.R
\name{rep_as_list}
\alias{rep_as_list}
\title{Create a list of an object repeated \code{x} times}
\usage{
rep_as_list(x, n)
}
\arguments{
\item{x}{an object}

\item{n}{number of repeated elements}
}
\value{
a list with length \code{n} with the object \code{x} in each elelment of the list
}
\description{
Create a list with length \code{n} with the object \code{x} in each elelment of the list
}
\examples{
A <- matrix(c(1,2,1,0,0,0,6,3,3), nrow=3)
rep_as_list(A, 3)
}
\author{
Ty Stanford <tyman@lbtinnovations.com>
}
