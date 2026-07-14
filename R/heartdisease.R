#'Heart Disease Data (UCI, Four Sites, with Real Missing Values)
#'
#'@description A real, deliberately messy clinical dataset: 920 patients assessed
#'  for coronary artery disease at four institutions (Cleveland, Hungary,
#'  Switzerland and the Long Beach VA). Unlike the simulated teaching sets in
#'  datarium, it ships close to raw --- integer-coded categorical variables,
#'  substantial and uneven missingness across sites, and a multi-level outcome ---
#'  so it can be used to teach the "clean the data before you analyse it" step
#'  ahead of logistic regression, chi-square tests and group comparisons. The
#'  values are the original UCI codes and are \strong{not} relabelled; see the
#'  \code{data-raw/heartdisease/heart-disease.names} codebook.
#'@name heartdisease
#'@docType data
#'@usage data("heartdisease")
#'@format A data frame with 920 rows and 15 columns. The missing marker
#'  \code{"?"} in the source has been converted to \code{NA}; missingness is heavy
#'  and very uneven across sites (see \code{colSums(is.na(heartdisease))}).
#'  \describe{
#'    \item{age}{age, in years.}
#'    \item{sex}{sex, integer-coded: \code{1} = male, \code{0} = female.}
#'    \item{cp}{chest pain type: \code{1} = typical angina, \code{2} = atypical
#'      angina, \code{3} = non-anginal pain, \code{4} = asymptomatic.}
#'    \item{trestbps}{resting blood pressure (mm Hg on admission to hospital).}
#'    \item{chol}{serum cholesterol (mg/dl). Note: 172 patients are recorded with
#'      \code{0} --- all 123 of the Switzerland site's patients and a further 49 at
#'      the Long Beach VA site --- where \code{0} means "not measured" rather than a
#'      true value: a real missing-data trap to handle before analysis.}
#'    \item{fbs}{fasting blood sugar > 120 mg/dl: \code{1} = true, \code{0} = false.}
#'    \item{restecg}{resting electrocardiographic results: \code{0} = normal,
#'      \code{1} = ST-T wave abnormality, \code{2} = probable or definite left
#'      ventricular hypertrophy (Estes' criteria).}
#'    \item{thalach}{maximum heart rate achieved.}
#'    \item{exang}{exercise-induced angina: \code{1} = yes, \code{0} = no.}
#'    \item{oldpeak}{ST depression induced by exercise relative to rest.}
#'    \item{slope}{slope of the peak exercise ST segment: \code{1} = upsloping,
#'      \code{2} = flat, \code{3} = downsloping.}
#'    \item{ca}{number of major vessels (0--3) coloured by fluoroscopy.}
#'    \item{thal}{thallium stress-test result: \code{3} = normal, \code{6} = fixed
#'      defect, \code{7} = reversible defect.}
#'    \item{num}{diagnosis of heart disease (angiographic disease status):
#'      \code{0} = < 50\% diameter narrowing (no disease); \code{1}--\code{4} =
#'      > 50\% narrowing (disease present). It is commonly binarised to absence
#'      (\code{0}) vs presence (\code{> 0}).}
#'    \item{dataset}{the collecting site, a factor with levels \code{"cleveland"},
#'      \code{"hungarian"}, \code{"switzerland"} and \code{"va"}.}
#'  }
#'@source Heart Disease, UCI Machine Learning Repository
#'  (\doi{10.24432/C52P4X}). Real patient data collected by the Hungarian
#'  Institute of Cardiology, Budapest; University Hospital, Zurich; University
#'  Hospital, Basel; and the V.A. Medical Center, Long Beach, and shared by the
#'  Cleveland Clinic Foundation. This dataset combines the four
#'  \code{processed.<site>.data} files (the 14 commonly-used attributes of the
#'  original 76), converting the \code{"?"} marker to \code{NA} and keeping the raw
#'  values otherwise unchanged; the source files and codebook are in
#'  \code{data-raw/heartdisease/}. Distributed under the Creative Commons
#'  Attribution 4.0 International (CC BY 4.0) licence; when using the data please
#'  cite Janosi et al. (1989) (see references).
#'@references
#'  Janosi, A., Steinbrunn, W., Pfisterer, M., & Detrano, R. (1989). Heart Disease
#'  [Dataset]. UCI Machine Learning Repository. \doi{10.24432/C52P4X}.
#'
#'  Detrano, R., Janosi, A., Steinbrunn, W., Pfisterer, M., Schmid, J. J.,
#'  Sandhu, S., Guppy, K. H., Lee, S., & Froelicher, V. (1989). International
#'  application of a new probability algorithm for the diagnosis of coronary
#'  artery disease. \emph{The American Journal of Cardiology}, 64(5), 304--310.
#' @examples
#' data("heartdisease")
#'
#' # Real data is messy: missingness is heavy and very uneven across sites
#' colSums(is.na(heartdisease))
#' table(heartdisease$dataset)
#'
#' # The Cleveland site is the most complete; use it for a first model
#' cleveland <- subset(heartdisease, dataset == "cleveland")
#'
#' # Binarise the 0-4 angiographic outcome into disease present/absent
#' cleveland$disease <- as.integer(cleveland$num > 0)
#'
#' # Logistic regression of disease on age, sex and maximum heart rate
#' fit <- glm(disease ~ age + sex + thalach, family = binomial, data = cleveland)
#' summary(fit)
#'
#' # Chi-square test: is disease associated with sex (all sites)?
#' heartdisease$disease <- as.integer(heartdisease$num > 0)
#' chisq.test(table(heartdisease$sex, heartdisease$disease))
NULL
