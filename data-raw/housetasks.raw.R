## Provenance for housetasks.raw. Needs the factoextra and tibble packages at
## AUTHORING time only (neither is a datarium dependency).
##
## Derivation: factoextra's `housetasks` contingency table, with the "Wife" and
## "Husband" columns relabeled "Partner1" and "Partner2" (the stored data keeps
## the frozen misspelling "Parter2"), expanded to one row per recorded case.
## Verified identical() to the shipped object. It never overwrites the .rda.

if (!requireNamespace("factoextra", quietly = TRUE))
  stop("factoextra is needed to regenerate housetasks.raw (authoring-time only)")
if (!requireNamespace("tibble", quietly = TRUE))
  stop("tibble is needed to regenerate housetasks.raw (authoring-time only)")

source("data-raw/verify.R")   # counts_to_cases(), verify_against_shipped()

utils::data("housetasks", package = "factoextra")
tab <- as.matrix(housetasks)
colnames(tab) <- c("Partner1", "Alternating", "Parter2", "Jointly")  # Wife/Husband relabeled

rebuild <- counts_to_cases(as.table(tab))
names(rebuild) <- c("tasks", "status")
rebuild <- tibble::as_tibble(rebuild)

verify_against_shipped("housetasks.raw", rebuild, exact = TRUE)
