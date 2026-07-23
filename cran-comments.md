## Test environments
* local macOS, R 4.5.1
* GitHub Actions R-CMD-check (macOS, Windows, Ubuntu; release/devel/oldrel)
* win-builder (devel and release)

## R CMD check results
There were no ERRORs, WARNINGs or NOTEs (`R CMD check --as-cran`, status OK).

## Submission

This is an update from the 0.1.0 version on CRAN (2019).

The release is additive: it adds new teaching data sets
(`heartdisease`, `infections`, `antismoking`, `taskachievment`, `renalstone`,
`AirPassengersDf`) and completes the documentation of the existing data sets.
No existing data set's values, structure, or name was changed, so packages that
use datarium's data are unaffected.

A `LICENSE.note` file documents the data licensing: the author's data sets are
released under CC0 1.0, and the `heartdisease` data is redistributed under
CC BY 4.0 (UCI Machine Learning Repository; attributed in `?heartdisease`).

## Notes

* The package URL `https://rpkgs.datanovia.com/datarium/` is valid; the host
  sits behind a CDN that occasionally times out automated link checkers, but it
  serves normally (HTTP 200) to browsers.
