## Generator for the `infections` dataset (simulated, for teaching Poisson
## regression). Base R only, deterministic given the seed.
##
## DGP: number of infections per patient over a one-year follow-up.
##   log(mu) = 1.6 - 0.8 * (treatment == "treated") + 0.25 * ((age - 40) / 10)
##   count ~ Poisson(mu),  100 patients (50 placebo / 50 treated),
##   age ~ round(Uniform(20, 60)).
##
## The committed data/infections.rda is the frozen source of truth. This script
## documents the DGP and VERIFIES a regeneration against it with identical(); it
## never overwrites the .rda.

source("data-raw/verify.R")   # verify_against_shipped()

set.seed(123)
n <- 100L
treatment <- factor(rep(c("placebo", "treated"), each = n / 2L),
                    levels = c("placebo", "treated"))
age   <- round(runif(n, 20, 60))
mu    <- exp(1.6 - 0.8 * (treatment == "treated") + 0.25 * ((age - 40) / 10))
count <- rpois(n, mu)

infections <- data.frame(id = seq_len(n), treatment = treatment, age = age, count = count)

verify_against_shipped("infections", infections, exact = TRUE)
