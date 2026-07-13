#' Mice Weight Data for Paired-Samples Mean Test
#'
#'@description contains the weight of 10 mice before and after the treatment.
#'
#' A paired-samples t-test can be performed to answer to this question.
#'@name mice2
#'@docType data
#'@usage data("mice2")
#'@format A data frame with 10 rows and 3 columns.
#'  \describe{
#'    \item{id}{mouse identifier (1 to 10).}
#'    \item{before}{the mouse weight before the treatment.}
#'    \item{after}{the mouse weight after the treatment.}
#'  }
#'@source A simulated dataset for teaching the paired-samples t-test.
#' @examples
#' data(mice2)
#' head(mice2)
#'
#' # Paired-samples t-test: did the treatment change the weight?
#' t.test(mice2$before, mice2$after, paired = TRUE)
NULL
