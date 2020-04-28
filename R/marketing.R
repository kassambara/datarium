#'Marketing Data Set
#'
#'@description A data frame containing the impact of three advertising medias
#'  (youtube, facebook and newspaper) on sales. Data are the advertising budget
#'  in thousands of dollars along with the sales (in thousands of units). The
#'  advertising experiment has been repeated 200 times. This is a simulated data.
#'@name marketing
#'@docType data
#'@usage data("marketing")
#'@format A data frame with 200 rows and 4 columns.
#' @examples
#' data(marketing)
#' res.lm <- lm(sales ~ youtube*facebook, data = marketing)
#' summary(res.lm)
#'
NULL
