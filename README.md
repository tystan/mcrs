# mcrs
mCRS: multiclass Composite Reference Standard using simulation

## Purpose
Functions to reproduce the analysis in Brenton et al. (2018). The functions are written to perform mCRS for any ordinal outcome with 2 or more classes/categories.

The main function `perform_mcrs(...)` takes in a dataset containing one row per sample and at least three columns that represent the index text, imperfect truth and the resolver. The index test and the imperfect truth are expected to have no missing values, however as per the method, the resolver column may contain missing (`NA`) values to be imputed.

Details are available in the suplementaty material of paper:
[Clinical evaluation of APAS Independence: automated imaging and interpretation of urine cultures using artificial intelligence, integrating a novel method for unbiased discrepant resolution](https://notavailableyetsorry.com/). 

A paper to describe a generalised mCRS is currently being written.

# Installation
To install and load in R, run:
```R
library(devtools) # see http://cran.r-project.org/web/packages/devtools/README.html
devtools::install_github('tystan/mcrs')
library(mcrs)
### see help file to run example
?perform_mcrs
```

## Example usage

First load the data that comes with the package: `brenton2018`.

```R
data(brenton2018) # load data from Brenton et al. (2018)
brenton2018       # have a look at data
## A tibble: 881 x 3
##        A     S     P
##    <int> <int> <int>
##  1     4     4    NA
##  2     4     4    NA
##  3     1     1     1
##  4     3     3    NA
##  5     1     1     1
##  6     1     1    NA
##  7     4     4    NA
##  8     2     1     2
##  9     4     4    NA
## 10     2     2    NA
## ... with 871 more rows
```

To run mCRS pass the data (or any dataset in the required form) to the `perform_mcrs()` function.

```r
# run mCRS analysis on brenton2018 data
perform_mcrs(
  brenton2018, # data
  "A",         # index test
  "S",         # imperfect truth
  "P",         # resolver test (with NAs present)
  pos = 3:4,   # the categories that are 'positives' for sens+spec calculation
  r = 1000     # number of simulations
)
```

The resulting output:

|param |   est|    lo|    up|
|:-----|-----:|-----:|-----:|
|sens  | 0.932| 0.894| 0.958|
|spec  | 0.901| 0.851| 0.939|


mCRS can be compared to the index test against the imperfect truth by running the following.

```r
# the sens+spec estimates using the imperfect truth only
get_sens_spec(table(brenton2018[["S"]], brenton2018[["A"]]), 3:4)
```

|param | cases| correct|   est|    lo|    up|
|:-----|-----:|-------:|-----:|-----:|-----:|
|sens  |   449|     423| 0.942| 0.917| 0.960|
|spec  |   432|     342| 0.792| 0.751| 0.827|



<!--- ![](https://github.com/tystan/mcrs/blob/master/example.png) --->

