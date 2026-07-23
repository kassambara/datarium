#'Depression Data for Two Way Mixed ANOVA
#'
#'@description
#'  The data correspond to an experiment in which a treatment for depression is
#'  studied. Two groups of patients - control ("ctr") and treatment
#'  ("treated") - have been followed at four different time points: t0
#'  (pre-test) and three post-test follow-up measurements (t1, t2, t3). The
#'  dependent variable is a depression score.
#'
#'  Repeated measures ANOVA can be performed in order to determine the effect
#'  of the treatment and the effect of time on the depression score.
#'
#'  For a worked tutorial on this analysis, see the Datanovia lesson
#'  \dQuote{Mixed ANOVA in R: One Between- and One Within-Subjects Factor}
#'  (\url{https://www.datanovia.com/learn/biostatistics/anova/mixed-anova-in-r}).
#'@name depression
#'@docType data
#'@usage data("depression")
#'@format A data frame with 24 rows and 6 columns (stored as a tibble).
#'  \describe{
#'    \item{id}{participant identifier (1 to 24).}
#'    \item{treatment}{the treatment group, "ctr" (control) or "treated".}
#'    \item{t0}{the depression score at pre-test.}
#'    \item{t1}{the depression score at the first post-test follow-up.}
#'    \item{t2}{the depression score at the second post-test follow-up.}
#'    \item{t3}{the depression score at the third post-test follow-up.}
#'  }
#'  The depression score is a simulated measure on an arbitrary scale with no
#'  real-world units.
#'@source A simulated dataset created for teaching two-way mixed ANOVA.
#'@seealso
#'  Datanovia tutorial:
#'  \href{https://www.datanovia.com/learn/biostatistics/anova/mixed-anova-in-r}{Mixed ANOVA in R: One Between- and One Within-Subjects Factor}.
#' @examples
#' data(depression)
#' head(depression)
#'
#' # Two-way mixed ANOVA: treatment (between) x time (within)
#' depression_long <- reshape(depression, varying = c("t0", "t1", "t2", "t3"),
#'                            v.names = "score", timevar = "time",
#'                            direction = "long")
#' summary(aov(score ~ treatment * factor(time) + Error(factor(id)/factor(time)),
#'             data = depression_long))
NULL
