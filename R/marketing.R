#'Marketing Data Set
#'
#'@description A data frame containing the impact of three advertising medias
#'  (youtube, facebook and newspaper) on sales. Data are the advertising budget
#'  in thousands of dollars along with the sales (in thousands of units). The
#'  advertising experiment has been repeated 200 times. This is a simulated data.
#'
#'  It is the data set used in the Datanovia tutorial \dQuote{Multiple Linear
#'  Regression in R: Several Predictors}
#'  (\url{https://www.datanovia.com/learn/biostatistics/regression/multiple-linear-regression-in-r}).
#'@name marketing
#'@docType data
#'@usage data("marketing")
#'@format A data frame with 200 rows and 4 columns.
#'  \describe{
#'    \item{youtube}{the advertising budget spent on YouTube, in thousands of
#'      dollars.}
#'    \item{facebook}{the advertising budget spent on Facebook, in thousands of
#'      dollars.}
#'    \item{newspaper}{the advertising budget spent on newspaper, in thousands
#'      of dollars.}
#'    \item{sales}{the sales generated, in thousands of units.}
#'  }
#'@source A simulated dataset for teaching multiple linear regression.
#'@seealso
#'  Datanovia tutorial:
#'  \href{https://www.datanovia.com/learn/biostatistics/regression/multiple-linear-regression-in-r}{Multiple Linear Regression in R: Several Predictors}.
#' @examples
#' data(marketing)
#' res.lm <- lm(sales ~ youtube*facebook, data = marketing)
#' summary(res.lm)
#'
NULL
