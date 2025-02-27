<!-- README.md is generated from README.Rmd. Please edit that file -->

[![R build
status](https://github.com/kassambara/datarium/workflows/R-CMD-check/badge.svg)](https://github.com/kassambara/datarium/actions)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/datarium)](https://cran.r-project.org/package=datarium)
[![CRAN
Checks](https://cranchecks.info/badges/summary/datarium)](https://cran.r-project.org/web/checks/check_results_datarium.html)
[![Downloads](https://cranlogs.r-pkg.org/badges/datarium)](https://cran.r-project.org/package=datarium)
[![Total
Downloads](https://cranlogs.r-pkg.org/badges/grand-total/datarium?color=orange)](https://cranlogs.r-pkg.org/badges/grand-total/datarium)

# datarium: Data bank for statistical analyses and visualization

Contains data organized by topics: categorical data, regression model,
means comparisons, independent and repeated measures ANOVA, mixed ANOVA
and ANCOVA.

-   **Categorical Data**
    -   housetasks.raw
    -   titanic.raw
    -   antismoking
-   **Regression Model**
    -   marketing
-   **Comparing Two Means**
    -   mice
    -   mice2
    -   genderweight
-   **Independent-Measures ANOVA**
    -   heartattack
    -   headache
    -   performance
    -   jobsatisfaction
-   **Repeated Measures ANOVA**
    -   selfesteem
    -   selfesteem2
    -   weightloss
    -   depression
-   **Mixed ANOVA**
    -   anxiety
-   **ANCOVA**
    -   stress
-   **Comparing Proportions**
    -   properties
-   **Time Series**:
    -   AirPassengersDf

## Helper functions

The two data sets (`Titanic` and `housetasks`) are frequency/contingency
table. We’ll create our demo data sets by recovering the original data
from Titanic and housetasks tables.

To do so, first copy and paste the following helper function:

``` r
counts_to_cases <- function(x, countcol = "Freq") {
    if(!inherits(x, "table")) x <- as.table(as.matrix(x))
      x <- as.data.frame(x)
    # Get the row indices to pull from x
    idx <- rep.int(seq_len(nrow(x)), x[[countcol]])
    # Drop count column
    x[[countcol]] <- NULL
    # Get the rows from x
    x <- x[idx, ]
    rownames(x) <- 1:nrow(x)
    x
}
```

Then, recover the original data as follow:

``` r
# Load the data
data("Titanic")
data("housetasks", package = "factoextra")

# Recover the original raw data
titanic.raw <- counts_to_cases(Titanic)
housetasks.raw <- counts_to_cases(housetasks)
```
