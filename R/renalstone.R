#'Risk of Renal Stone Data for Cochran-Armitage Trend Test
#'
#'@description Presents the frequencies of individuals at high risk of renal
#'  calculi according to age and gender. This a demo dataset for
#'  Cochran-Armitage trend test for investigating whether there is a linear
#'  trend between the proportion of individual with renal stone and ages.
#'
#'  It is the data set used in the Datanovia tutorial \dQuote{Cochran-Armitage
#'  Trend Test in R: Test a Trend in Proportions}
#'  (\url{https://www.datanovia.com/learn/biostatistics/categorical/cochran-armitage-trend-test-in-r}).
#'@name renalstone
#'@docType data
#'@usage data("renalstone")
#'@format A data frame with 3513 rows and 3 columns (stored as a tibble).
#'  \describe{
#'    \item{gender}{the individual's gender, "male" or "female".}
#'    \item{stone}{whether the individual has a renal stone, "yes" or "no".}
#'    \item{age}{the age group, an ordered factor: "30-39" < "40-49" < "50-59".}
#'  }
#'@source Frequencies reported by Hazra and Gogtay (2016), expanded to one row
#'  per individual.
#'@references Hazra, Avijit, and Nithya Jaideep Gogtay. 2016. "Biostatistics
#'Series Module 4: Comparing Groups - Categorical Variables." In Indian Journal
#'of Dermatology.
#'@seealso
#'  Datanovia tutorial:
#'  \href{https://www.datanovia.com/learn/biostatistics/categorical/cochran-armitage-trend-test-in-r}{Cochran-Armitage Trend Test in R: Test a Trend in Proportions}.
#' @examples
#' data(renalstone)
#' xtabs(~stone+age+gender, data = renalstone)
NULL
