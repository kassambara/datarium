## Shared helper for the data-raw provenance scripts.
##
## The shipped data/*.rda files are BYTE-FROZEN (lessons and committed Quarto
## freezes depend on the exact bytes). So the regeneration scripts VERIFY a
## reconstruction against the shipped object and NEVER overwrite it -- do not
## call usethis::use_data() from these scripts. Base R only.

.structure <- function(x) {
  list(class = class(x), dim = dim(x), names = names(x),
       types = unname(vapply(x, function(col) class(col)[1], "")),
       levels = lapply(x, function(col) if (is.factor(col)) levels(col) else NULL))
}

## Compare a reconstruction to the SHIPPED dataset without touching data/*.rda.
## exact = TRUE  -> the reconstruction must be identical() to the shipped object
##                  (values, order and structure; identical() ignores the order
##                  of attributes, so it is the right "same data" test here).
## exact = FALSE -> only the structure (class/dims/names/types/levels) must match.
verify_against_shipped <- function(name, rebuild, exact = TRUE) {
  ## Load the SHIPPED object directly from the source tree (data-raw scripts run
  ## from the package root); this does not require datarium to be installed.
  rda <- file.path("data", paste0(name, ".rda"))
  if (!file.exists(rda)) stop("run from the package root; missing ", rda, call. = FALSE)
  e <- new.env()
  load(rda, envir = e)
  shipped <- get(ls(e)[1], envir = e)
  structural  <- identical(.structure(shipped), .structure(rebuild))
  exact_match <- isTRUE(identical(shipped, rebuild))
  cat(sprintf("%-16s structure: %-8s exact (identical): %s\n", name,
              if (structural) "MATCH" else "MISMATCH",
              if (exact_match) "MATCH" else "differ"))
  if (exact && !exact_match)
    stop(name, ": reconstruction is not identical() to the shipped object", call. = FALSE)
  if (!exact && !structural)
    stop(name, ": reconstruction structure does not match the shipped object", call. = FALSE)
  invisible(exact_match)
}

## The contingency-table -> case-level helper (also shown in README.Rmd).
counts_to_cases <- function(x, countcol = "Freq") {
  if (!inherits(x, "table")) x <- as.table(as.matrix(x))
  x <- as.data.frame(x)
  idx <- rep.int(seq_len(nrow(x)), x[[countcol]])
  x[[countcol]] <- NULL
  x <- x[idx, ]
  rownames(x) <- seq_len(nrow(x))
  x
}
