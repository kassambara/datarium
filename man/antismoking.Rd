% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/antismoking.R
\docType{data}
\name{antismoking}
\alias{antismoking}
\title{Anti-Smoking Emotive Communication Data for McNemar Test}
\format{
A data frame with 62 rows and 3 columns.
}
\usage{
data("antismoking")
}
\description{
Paired nominal data providing the smoking status 62 individuals
 before and after emotive video communications showing the danger of smoking.
This a demo dataset for McNemar test.
}
\examples{
data(antismoking)
xtabs(~before + after, data = antismoking)
}
