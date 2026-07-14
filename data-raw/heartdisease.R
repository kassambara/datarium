## Generator for the `heartdisease` dataset (REAL data, deliberately messy).
##
## Source: UCI Machine Learning Repository, "Heart Disease" (DOI 10.24432/C52P4X),
## Janosi, Steinbrunn, Pfisterer & Detrano (1989). Licence: CC BY 4.0.
## Downloaded from
##   https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/
## the four `processed.<site>.data` files (14 commonly-used attributes) + the
## `heart-disease.names` codebook, kept verbatim in data-raw/heartdisease/ for
## reproducibility. This script combines the four sites, turns the "?" missing
## marker into NA, and keeps the raw integer-coded values as-is (the point of the
## dataset is that real data needs cleaning before analysis).

sites <- c(cleveland = "processed.cleveland.data", hungarian = "processed.hungarian.data",
           switzerland = "processed.switzerland.data", va = "processed.va.data")
cols <- c("age","sex","cp","trestbps","chol","fbs","restecg","thalach",
          "exang","oldpeak","slope","ca","thal","num")

read_site <- function(s) {
  x <- read.csv(file.path("data-raw", "heartdisease", sites[[s]]),
                header = FALSE, na.strings = "?", col.names = cols)
  x$dataset <- s
  x
}

heartdisease <- do.call(rbind, lapply(names(sites), read_site))
heartdisease$dataset <- factor(heartdisease$dataset, levels = names(sites))
heartdisease$num <- as.integer(heartdisease$num)
rownames(heartdisease) <- NULL

stopifnot(nrow(heartdisease) == 920L, ncol(heartdisease) == 15L,
          all(table(heartdisease$dataset) == c(303, 294, 123, 200)))

## version = 2 (RDX2) to match the other datasets and keep Depends: R (>= 3.1.0).
usethis::use_data(heartdisease, overwrite = TRUE, version = 2)
