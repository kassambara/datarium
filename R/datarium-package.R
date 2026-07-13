#' datarium: Data Bank for Statistical Analysis and Visualization
#'
#' A collection of 22 curated data sets for teaching classical statistical
#' inference in R. Each data set is paired with the analysis it is designed to
#' teach -- one data set per test -- and is used across the Datanovia
#' biostatistics lessons (\url{https://www.datanovia.com}).
#'
#' @section Comparing means:
#' \tabular{ll}{
#'   One-sample t-test \tab \code{\link{mice}} \cr
#'   Paired-samples t-test \tab \code{\link{mice2}} \cr
#'   Two-samples (independent) t-test \tab \code{\link{genderweight}} \cr
#' }
#'
#' @section Analysis of variance (ANOVA):
#' \tabular{ll}{
#'   Two-way ANOVA \tab \code{\link{jobsatisfaction}} \cr
#'   Three-way ANOVA \tab \code{\link{headache}}, \code{\link{heartattack}} \cr
#'   One-way repeated measures ANOVA \tab \code{\link{selfesteem}} \cr
#'   Two-way repeated measures ANOVA \tab \code{\link{selfesteem2}} \cr
#'   Three-way repeated measures ANOVA \tab \code{\link{weightloss}} \cr
#'   Two-way mixed ANOVA \tab \code{\link{anxiety}}, \code{\link{depression}} \cr
#'   Three-way mixed ANOVA \tab \code{\link{performance}} \cr
#'   Two-way ANCOVA \tab \code{\link{stress}} \cr
#' }
#'
#' @section Categorical data and proportions:
#' \tabular{ll}{
#'   Chi-square test of independence \tab \code{\link{properties}}, \code{\link{housetasks.raw}} \cr
#'   Categorical descriptive statistics \tab \code{\link{titanic.raw}} \cr
#'   McNemar's test \tab \code{\link{antismoking}} \cr
#'   Cochran's Q test \tab \code{\link{taskachievment}} \cr
#'   Cochran-Armitage trend test \tab \code{\link{renalstone}} \cr
#' }
#'
#' @section Regression:
#' \tabular{ll}{
#'   Linear regression \tab \code{\link{marketing}} \cr
#'   Poisson regression (count data) \tab \code{\link{infections}} \cr
#' }
#'
#' @section Time series:
#' \tabular{ll}{
#'   Time series \tab \code{\link{AirPassengersDf}} \cr
#' }
#'
#' @name datarium
#' @keywords internal
"_PACKAGE"
