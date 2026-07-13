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
#'
#'  It contain the following variables: \itemize{ \item id, the participant
#'  identifier; \item gender, which has two categories: "male" and "female";
#'  \item risk, which has two levels: "low" and "high"; \item treatment, which
#'  has three categories: "X", "Y" and "Z"; \item pain_score, the outcome (pain
#'  score associated with the migraine headache episode). }
#'@name headache
#'@docType data
#'@usage data("headache")
#'@format A data frame with 72 rows and 5 columns.
#' @examples
#' data(headache)
#' head(as.data.frame(headache))
NULL
