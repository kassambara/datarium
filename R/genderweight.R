#'Weight Data By Gender for Two-Samples Mean Test
#'
#'@description Contains the weights by sex (M for male; F for
#'  female). The question is whether the average women's weight differs from the
#'  average men's weight?
#'
#'  A two-samples independent t-test can be performed to answer to this question.
#'@name genderweight
#'@docType data
#'@usage data("genderweight")
#'@format A data frame with 40 rows and 3 columns (stored as a tibble).
#'  \describe{
#'    \item{id}{participant identifier (1 to 40).}
#'    \item{group}{the participant's sex, "F" (female) or "M" (male).}
#'    \item{weight}{the participant's body weight.}
#'  }
#'@source A simulated dataset for teaching the two-samples (independent) t-test.
#' @examples
#' data(genderweight)
#' head(genderweight)
#'
#' # Two-samples independent t-test: do mean weights differ by sex?
#' t.test(weight ~ group, data = genderweight)
NULL
