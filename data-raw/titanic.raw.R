## Provenance / regeneration check for titanic.raw. Base R only.
##
## Derivation: the base R `Titanic` 4-way contingency table, expanded to one row
## per passenger (Class, Sex, Age, Survived). The shipped
## data/titanic.raw.rda is byte-frozen; this reconstructs the object and VERIFIES
## it fingerprint-identical to the shipped one -- it never overwrites the .rda.

source("data-raw/verify.R")   # counts_to_cases(), verify_against_shipped()

rebuild <- counts_to_cases(Titanic)

verify_against_shipped("titanic.raw", rebuild, exact = TRUE)
