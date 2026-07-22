#'Anxiety Data for Two-Way Mixed ANOVA
#'
#'@description The data provide the anxiety score, measured at three time
#'  points, of three groups of individuals practicing physical exercises at
#'  different levels (grp1: basal, grp2: moderate and grp3: high)
#'
#'  Two-way mixed ANOVA can be used to evaluate if there is interaction between
#'  group and time in explaining the anxiety score.
#'
#'  It is the data set used in the Datanovia tutorial \dQuote{Mixed ANOVA in R:
#'  One Between- and One Within-Subjects Factor}
#'  (\url{https://www.datanovia.com/learn/biostatistics/anova/mixed-anova-in-r}).
#'@name anxiety
#'@docType data
#'@usage data("anxiety")
#'@format A data frame with 45 rows and 5 columns (stored as a tibble).
#'  \describe{
#'    \item{id}{participant identifier (1 to 45).}
#'    \item{group}{the physical exercise level, "grp1" (basal), "grp2"
#'      (moderate) or "grp3" (high); a between-subjects factor.}
#'    \item{t1}{the anxiety score at the first time point.}
#'    \item{t2}{the anxiety score at the second time point.}
#'    \item{t3}{the anxiety score at the third time point.}
#'  }
#'  The anxiety score is a simulated measure on an arbitrary scale with no
#'  real-world units.
#'@source A simulated dataset created for teaching two-way mixed ANOVA.
#'@seealso
#'  Datanovia tutorial:
#'  \href{https://www.datanovia.com/learn/biostatistics/anova/mixed-anova-in-r}{Mixed ANOVA in R: One Between- and One Within-Subjects Factor}.
#' @examples
#' data(anxiety)
#' head(anxiety)
#'
#' # Two-way mixed ANOVA: group (between) x time (within)
#' anxiety_long <- reshape(anxiety, varying = c("t1", "t2", "t3"),
#'                         v.names = "score", timevar = "time",
#'                         direction = "long")
#' summary(aov(score ~ group * factor(time) + Error(factor(id)/factor(time)),
#'             data = anxiety_long))
NULL
