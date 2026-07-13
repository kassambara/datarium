#'Mice Weight Data for One Sample Mean Test
#'
#'@description Contains the weight of 10 mice. The question is whether the
#'  average weight of the mice differs from 25g.
#'
#' A one sample t-test can be performed to answer to this question.
#'@name mice
#'@docType data
#'@usage data("mice")
#'@format A data frame with 10 rows and 2 columns (stored as a tibble).
#'  \describe{
#'    \item{name}{mouse identifier, "M_1" to "M_10".}
#'    \item{weight}{the mouse weight, in grams.}
#'  }
#'@source A simulated dataset for teaching the one-sample t-test.
#' @examples
#' data(mice)
#' head(mice)
#'
#' # One-sample t-test: does the mean weight differ from 25 g?
#' t.test(mice$weight, mu = 25)
NULL
