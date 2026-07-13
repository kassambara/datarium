#'Air Passengers
#'
#'@description This dataset contains the number of monthly air passengers from
#'1949 to 1960. It is taken from the R datasets package and formatted into long
#'data frame format.
#'@name AirPassengersDf
#'@docType data
#'@usage data("AirPassengersDf")
#'@format A data frame with 144 rows and 2 columns.
#'  \describe{
#'    \item{Month}{the month of the observation, as a \code{Date} (the first day
#'      of each month from January 1949 to December 1960).}
#'    \item{Passengers}{the monthly total of international airline passengers.}
#'  }
#'@source The \code{AirPassengers} time series in base R (the classic Box and
#'  Jenkins airline data), reshaped into a long data frame.
#'@references Box, G. E. P., Jenkins, G. M. and Reinsel, G. C. (1976) Time
#'  Series Analysis, Forecasting and Control. San Francisco: Holden-Day.
#' @examples
#' data("AirPassengersDf")
#' head(AirPassengersDf)
#'
#' # Monthly international airline passengers over time
#' plot(Passengers ~ Month, data = AirPassengersDf, type = "l")
NULL
