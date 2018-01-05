<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build Status](https://api.travis-ci.org/kassambara/ggpubr.png)](https://travis-ci.org/kassambara/datarium)

datarium
========

STHDA data bank for statistical analyses an visualization.

Categorical data sets
---------------------

-   `Titanic` \[R base data set\]: Survival of passengers on the Titanic. This data set provides information on the fate of passengers on the fatal maiden voyage of the ocean liner ‘Titanic’, summarized according to economic status (class), sex, age and survival.
-   `housetasks` \[factoextra package\]: A data frame containing the frequency of execution of 13 house tasks in the couple.

These two data sets are frequency/contingency table. We'll create our demo data sets by recovering the original data from Titanic and housetasks tables.

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
