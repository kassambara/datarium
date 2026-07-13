#'Stress Data for Two-Way ANCOVA
#'
#'@description Researchers want to evaluate the effect of a new "treatment" and
#'  "exercise" on the stress score reduction after adjusting for "age".
#'
#'  Two-way ANCOVA can be performed in order to determine
#'  whether there is interaction between exercise and treatment on the stress
#'  score.
#'@name stress
#'@docType data
#'@usage data("stress")
#'@format A data frame with 60 rows and 5 columns (stored as a tibble).
#'  \describe{
#'    \item{id}{participant identifier (1 to 60).}
#'    \item{score}{the stress score; a simulated measure on an arbitrary scale
#'      with no real-world units.}
#'    \item{treatment}{whether the participant received the treatment, "yes" or
#'      "no".}
#'    \item{exercise}{the exercise level, "low", "moderate" or "high".}
#'    \item{age}{the participant's age, in years.}
#'  }
#'@source A simulated dataset created for teaching two-way ANCOVA.
#' @examples
#' data(stress)
#' head(stress)
#'
#' # Two-way ANCOVA of the stress score, adjusting for age
#' summary(aov(score ~ age + treatment * exercise, data = stress))
NULL
