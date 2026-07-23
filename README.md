<!-- README.md is generated from README.Rmd. Please edit that file -->

[![R build
status](https://github.com/kassambara/datarium/workflows/R-CMD-check/badge.svg)](https://github.com/kassambara/datarium/actions)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/datarium)](https://cran.r-project.org/package=datarium)
[![Downloads](https://cranlogs.r-pkg.org/badges/datarium)](https://cran.r-project.org/package=datarium)
[![Total
Downloads](https://cranlogs.r-pkg.org/badges/grand-total/datarium?color=orange)](https://cranlogs.r-pkg.org/badges/grand-total/datarium)

datarium: Data bank for statistical analyses and visualization <img src="man/figures/logo.png" align="right" height="139" alt="datarium hex logo" />
====================================================================================================================================================

Contains 23 curated data sets for teaching classical statistical
inference in R. Each data set is paired with the analysis it is designed
to teach — one data set per test. The same map is available in R via
`?datarium`. Each analysis below links to its worked tutorial on
[Datanovia](https://www.datanovia.com).

**Comparing means**

| Analysis                                                                                                 | Data set       |
|----------------------------------------------------------------------------------------------------------|----------------|
| [One-sample t-test](https://www.datanovia.com/learn/biostatistics/two-groups/t-test-in-r)                | `mice`         |
| [Paired-samples t-test](https://www.datanovia.com/learn/biostatistics/two-groups/t-test-in-r)            | `mice2`        |
| [Two-samples (independent) t-test](https://www.datanovia.com/learn/biostatistics/two-groups/t-test-in-r) | `genderweight` |

**Analysis of variance (ANOVA)**

| Analysis                                                                                                              | Data set                  |
|-----------------------------------------------------------------------------------------------------------------------|---------------------------|
| [Two-way ANOVA](https://www.datanovia.com/learn/biostatistics/anova/two-way-anova-in-r)                               | `jobsatisfaction`         |
| [Three-way ANOVA](https://www.datanovia.com/learn/biostatistics/anova/three-way-anova-in-r)                           | `headache`, `heartattack` |
| [One-way repeated measures ANOVA](https://www.datanovia.com/learn/biostatistics/anova/repeated-measures-anova-in-r)   | `selfesteem`              |
| [Two-way repeated measures ANOVA](https://www.datanovia.com/learn/biostatistics/anova/repeated-measures-anova-in-r)   | `selfesteem2`             |
| [Three-way repeated measures ANOVA](https://www.datanovia.com/learn/biostatistics/anova/repeated-measures-anova-in-r) | `weightloss`              |
| [Two-way mixed ANOVA](https://www.datanovia.com/learn/biostatistics/anova/mixed-anova-in-r)                           | `anxiety`, `depression`   |
| [Three-way mixed ANOVA](https://www.datanovia.com/learn/biostatistics/anova/mixed-anova-in-r)                         | `performance`             |
| [Two-way ANCOVA](https://www.datanovia.com/learn/biostatistics/anova/ancova-in-r)                                     | `stress`                  |

**Categorical data and proportions**

| Analysis                                                                                                                                | Data set                       |
|-----------------------------------------------------------------------------------------------------------------------------------------|--------------------------------|
| [Chi-square test of independence](https://www.datanovia.com/learn/biostatistics/categorical/chi-square-test-of-independence-in-r)       | `properties`, `housetasks.raw` |
| [Categorical descriptive statistics](https://www.datanovia.com/learn/biostatistics/categorical/categorical-descriptive-statistics-in-r) | `titanic.raw`                  |
| [McNemar’s test](https://www.datanovia.com/learn/biostatistics/categorical/mcnemar-test-in-r)                                           | `antismoking`                  |
| [Cochran’s Q test](https://www.datanovia.com/learn/biostatistics/categorical/cochran-q-test-in-r)                                       | `taskachievment`               |
| [Cochran-Armitage trend test](https://www.datanovia.com/learn/biostatistics/categorical/cochran-armitage-trend-test-in-r)               | `renalstone`                   |

**Regression**

| Analysis                                                                                                                             | Data set       |
|--------------------------------------------------------------------------------------------------------------------------------------|----------------|
| [Linear regression](https://www.datanovia.com/learn/biostatistics/regression/multiple-linear-regression-in-r)                        | `marketing`    |
| Poisson regression (count data)                                                                                                      | `infections`   |
| [Logistic regression (real, messy clinical data)](https://www.datanovia.com/learn/biostatistics/regression/logistic-regression-in-r) | `heartdisease` |

**Time series**

| Analysis    | Data set          |
|-------------|-------------------|
| Time series | `AirPassengersDf` |

Helper functions
----------------

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
