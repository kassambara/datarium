## Provenance / regeneration check for AirPassengersDf. Base R only.
##
## Derivation: the base R `AirPassengers` monthly time series (1949-1960),
## reshaped to a long data frame with the first day of each month as `Month`.
## The shipped data/AirPassengersDf.rda is byte-frozen; this reconstructs the
## object and VERIFIES it fingerprint-identical to the shipped one -- it never
## overwrites the .rda (the earlier version called usethis::use_data(overwrite =
## TRUE), which would change the frozen bytes).

source("data-raw/verify.R")   # verify_against_shipped()

rebuild <- data.frame(
  Month      = seq(as.Date("1949-01-01"), by = "month", length.out = length(AirPassengers)),
  Passengers = as.numeric(AirPassengers)
)

verify_against_shipped("AirPassengersDf", rebuild, exact = TRUE)
