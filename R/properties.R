#'Properties Data for Chi-square Test of Independence
#'
#'@description Contains the type of properties and the buyer types. Buyer
#'  categories are: "single male", "single female", "married couple" and
#'  "family".
#'
#'  The type of property these buyers purchased were sorted into four
#'  categories: "flat", "bungalow" (i.e., a one-storey home), "detached house"
#'  and "terrace" (i.e., a block of adjoining houses).
#'
#'  Chi-square test of independence can be used to assess the association between
#'  the type of buyer who purchases a property and the type of property that is
#'  purchased.
#'@name properties
#'@docType data
#'@usage data("properties")
#'@format A data frame with 333 rows and 2 columns (stored as a tibble).
#'  \describe{
#'    \item{property_type}{the type of property purchased: "flat", "bungalow",
#'      "detached house" or "terrace".}
#'    \item{buyer_type}{the type of buyer: "single male", "single female",
#'      "married couple" or "family".}
#'  }
#'@source A simulated dataset for teaching the chi-square test of independence.
#' @examples
#' data("properties")
#' head(properties)
#'
#' # Chi-square test of independence between buyer type and property type
#' chisq.test(table(properties$property_type, properties$buyer_type))
NULL
