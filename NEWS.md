# datarium 0.2.0.9000

Development version.

# datarium 0.2.0

## New features

### New data sets

- `heartdisease`: real, deliberately messy UCI four-site cardiology data (920
  patients, 15 variables) with heavy, uneven missingness, for teaching data
  cleaning ahead of logistic regression. Redistributed under CC BY 4.0; see
  `?heartdisease`.
- `infections`: a simulated count outcome for teaching Poisson regression.
- `antismoking`, `taskachievment` and `renalstone`: paired and repeated
  categorical data for McNemar's test, Cochran's Q test and the
  Cochran-Armitage trend test.
- `AirPassengersDf`: the classic monthly international airline-passenger series
  (1949-1960) as a data frame, for time-series teaching.

## Main changes

### Documentation

- Every data set now ships a full help page: a per-variable `@format`
  description (with units and factor levels), an honest `@source` (real vs
  simulated), `@references`, and a runnable base-R `@examples` that carries out
  the canonical analysis.
- Every data set's help page now links to the Datanovia tutorial that teaches
  its analysis -- in the description and under "See also" -- and sibling data
  sets are cross-linked (`mice`/`mice2`, `selfesteem`/`selfesteem2`,
  `headache`/`heartattack`).
- New "Meet the datarium datasets" article and a one-data-set-per-test map,
  available both in `?datarium` and the README.
- Package hex sticker (`man/figures/logo.png`).
- Added a `LICENSE.note` documenting the data licensing: the author's data sets
  under CC0 1.0, `heartdisease` under CC BY 4.0.

## Minor changes

- The `stress` data set's `id` column is now stored as numeric (rather than
  integer) and some legacy column attributes were dropped; the values are
  unchanged.
- Added `data-raw/` provenance scripts documenting how each reproducible data
  set is generated.
- Added a dataset-consistency check to `R CMD check`, backed by a byte-hash
  manifest that guards every shipped `.rda`.
- Modernized the continuous-integration setup (R-CMD-check runs on the default
  branch).

## Bug fixes

- Corrected factual errors in several data-set help files (dimensions and
  descriptive prose). Documentation only; no data values were changed.

# datarium 0.1.0

First release
