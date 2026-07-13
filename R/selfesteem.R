#'Self-Esteem Score Data for One-way Repeated Measures ANOVA
#'
#'@description The dataset contains 10 individuals' self-esteem score on three time points
#'  during a specific diet to determine whether their self-esteem improved.
#'
#'  One-way repeated measures ANOVA can be performed in order to determine the
#'  effect of time on the self-esteem score.
#'@name selfesteem
#'@docType data
#'@usage data("selfesteem")
#'@format A data frame with 10 rows and 4 columns (stored as a tibble).
#'  \describe{
#'    \item{id}{participant identifier (1 to 10).}
#'    \item{t1}{the self-esteem score at the first time point.}
#'    \item{t2}{the self-esteem score at the second time point.}
#'    \item{t3}{the self-esteem score at the third time point.}
#'  }
#'  The self-esteem score is a simulated measure on an arbitrary scale with no
#'  real-world units.
#'@source A simulated dataset created for teaching one-way repeated measures ANOVA.
#' @examples
#' data(selfesteem)
#' head(selfesteem)
#'
#' # One-way repeated measures ANOVA of the self-esteem score over time
#' selfesteem_long <- reshape(selfesteem, varying = c("t1", "t2", "t3"),
#'                            v.names = "score", timevar = "time",
#'                            direction = "long")
#' summary(aov(score ~ factor(time) + Error(factor(id)/factor(time)),
#'             data = selfesteem_long))
NULL
