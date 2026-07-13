#'Survival of Passengers on the Titanic
#'
#'@description Survival of passengers on the Titanic. This data set provides
#'  information on the fate of passengers on the fatal maiden voyage of the
#'  ocean liner "Titanic". Columns are economic status (Class), Sex,
#'  Age and Survived.
#'@name titanic.raw
#'@docType data
#'@usage data("titanic.raw")
#'@format A data frame with 2201 rows and 4 columns.
#'  \describe{
#'    \item{Class}{the passenger's economic status, "1st", "2nd", "3rd" or
#'      "Crew".}
#'    \item{Sex}{the passenger's sex, "Male" or "Female".}
#'    \item{Age}{the age category, "Child" or "Adult".}
#'    \item{Survived}{whether the passenger survived, "No" or "Yes".}
#'  }
#'@source Derived from the \code{Titanic} data set in base R, expanded to one
#'  row per passenger.
#' @examples
#' data(titanic.raw)
#' with(titanic.raw, table(Class, Survived))
NULL
