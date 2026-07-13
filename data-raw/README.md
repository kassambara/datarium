# data-raw

Provenance and regeneration scripts for the datarium datasets. This directory is
`.Rbuildignore`d — it is kept in git but does **not** ship to CRAN, so its
scripts may use packages (factoextra, tibble, …) that are **not** datarium
dependencies.

The shipped `data/*.rda` files are **byte-frozen** (lessons and committed Quarto
freezes depend on the exact bytes). These scripts therefore **verify** a
reconstruction against the shipped object and **never overwrite** it — none of
them calls `usethis::use_data()`. Run a script from the package root, e.g.:

```r
source("data-raw/titanic.raw.R")
```

`verify.R` provides `verify_against_shipped(name, rebuild, exact)`:
`exact = TRUE` requires the reconstruction to be `identical()` to the shipped
object (values, order and structure; `identical()` ignores the order of
attributes, so it is the right "same data" test); `exact = FALSE` requires only
structural identity (class, dims, names, types, factor levels).

## Deterministic-derived (exactly reproducible)
All three are verified `identical()` to the shipped object.

- `AirPassengersDf.R` — base R `AirPassengers`, reshaped to long (base R only).
- `titanic.raw.R` — base R `Titanic`, expanded to one row per passenger (base R
  only).
- `housetasks.raw.R` — factoextra `housetasks` (the "Wife"/"Husband" columns
  relabeled "Partner1"/"Partner2"; the stored data keeps the misspelling
  "Parter2"), expanded to one row per case.

## Contingency-derived (in `inst/data.R`)
`antismoking`, `taskachievment` and `renalstone` are constructed from small
contingency tables in `inst/data.R` (`taskachievment` uses `set.seed(123)`).

## Stochastic-simulated (the remaining datasets)
The remaining teaching datasets are simulated. Their `@source` documents each as
"a simulated dataset for teaching <analysis>". Exact regeneration is not
attempted: they predate a committed seed, and R 3.6's change to `sample()` makes
exact reproduction impossible even with one — the committed `.rda` is the source
of truth.
