## code to prepare `DATASET` dataset goes here

library(zoo)
library(readr)
df <- data.frame(
  Month = as.Date(zoo::as.yearmon(time(AirPassengers))), 
  Passengers = as.numeric(AirPassengers)
  )

AirPassengersDf <- df

readr::write_csv(AirPassengersDf, "data-raw/AirPassengersDf.csv")


usethis::use_data(AirPassengersDf, overwrite = TRUE)
