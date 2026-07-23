#'Heart Attack Data for Three Way ANOVA
#'
#'@description Measures of cholesterol concentration in 72 participants treated
#'  with three different drugs. The aim is to examine the potential of new class
#'  of drugs in lowering the cholesterol concentration and consequently reducing
#'  heart attack.
#'
#'  The participants include 36 males and 36 females. Males and
#'  females were further (equally) subdivided into whether they were at low or
#'  high risk of heart attack.
#'
#'  This data set is suited for three way Anova test.
#'
#'  For a worked tutorial on this analysis, see the Datanovia lesson
#'  \dQuote{Three-Way ANOVA in R: Three Factors and Their Interaction}
#'  (\url{https://www.datanovia.com/learn/biostatistics/anova/three-way-anova-in-r}).
#'@name heartattack
#'@docType data
#'@usage data("heartattack")
#'@format A data frame with 72 rows and 5 columns (stored as a tibble).
#'  \describe{
#'    \item{gender}{the participant's gender, "male" or "female".}
#'    \item{risk}{the participant's heart attack risk, "high" or "low".}
#'    \item{drug}{the drug received, "A", "B" or "C".}
#'    \item{cholesterol}{the blood cholesterol concentration.}
#'    \item{id}{participant identifier (1 to 72).}
#'  }
#'@source A simulated dataset for teaching three-way ANOVA.
#'@seealso
#'  \code{\link{headache}}, the companion three-way ANOVA data set.
#'  Datanovia tutorial:
#'  \href{https://www.datanovia.com/learn/biostatistics/anova/three-way-anova-in-r}{Three-Way ANOVA in R: Three Factors and Their Interaction}.
#' @examples
#' data(heartattack)
#' head(heartattack)
#'
#' # Three-way ANOVA of the cholesterol concentration
#' summary(aov(cholesterol ~ gender * risk * drug, data = heartattack))
NULL
