#'Headache Data for Three Way ANOVA
#'
#'@description A pharmaceutical company tested three treatments for migraine headache
#'  sufferers. 72 participants were enrolled in the experiments. The aim is to
#'  examine the potential of new class of treatments in lowering the pain score
#'  associated with the migraine headache episode.
#'
#'  The participants include 36 males and 36 females. Males and females were
#'  further (equally) subdivided into whether they were at low or high risk of
#'  migraine headache.
#'
#'  This data set is suited for three way Anova test.
#'@name headache
#'@docType data
#'@usage data("headache")
#'@format A data frame with 72 rows and 5 columns (stored as a tibble).
#'  \describe{
#'    \item{id}{participant identifier (1 to 72).}
#'    \item{gender}{the participant's gender, "male" or "female".}
#'    \item{risk}{the participant's migraine risk, "high" or "low".}
#'    \item{treatment}{the treatment received, "X", "Y" or "Z".}
#'    \item{pain_score}{a simulated migraine pain score (an arbitrary scale with
#'      no real-world units).}
#'  }
#'@source A simulated dataset for teaching three-way ANOVA.
#' @examples
#' data(headache)
#' head(headache)
#'
#' # Three-way ANOVA of the pain score
#' summary(aov(pain_score ~ gender * risk * treatment, data = headache))
NULL
