library(tidyverse)

# antismoking-----------------------------------
xtab <- as.table(
  rbind(c(25, 6), c(21,10))
)
dimnames(xtab) <- list(
  before = c("non.smoker", "smoker"),
  after = c("non.smoker", "smoker")
)
antismoking <- counts_to_cases(xtab)
antismoking  <- antismoking %>%
  add_column(id = 1:nrow(antismoking), .before = 1) %>%
  as_tibble() %>%
  mutate(
    before = factor(before, levels = c("non.smoker", "smoker")),
    after = factor(after, levels = c("non.smoker", "smoker"))
  )

# taskachievment-----------------------------------
xtab <- as.table(
  rbind(c(19, 32, 45), c(54, 41, 28))
)
dimnames(xtab) <- list(
  outcome = c("1", "0"),
  task = c("Task1", "Task2", "Task3")
)
# Individual cases
set.seed(123)
df <- counts_to_cases(xtab)
taskachievment <- add_column(df, participant = rep(1:73, 3)) %>%
  spread(task, outcome) %>%
  mutate_all(as.character)  %>%
  mutate_all(as.numeric) %>%
  mutate(participant = sample(participant)) %>%
  dplyr::arrange(participant) %>%
  mutate(participant = as.factor(participant)) %>%
  as_tibble()


# renal stone-----------------------------------
renalstone.males <- as.table(
  rbind(
    c(188, 313, 232),
    c(348, 383, 206)
  )
)
dimnames(renalstone.males) <- list(stone = c("yes", "no"), age = c("30-39", "40-49", "50-59"))
renalstone.males <- counts_to_cases(renalstone.males) %>%
  add_column(gender = "male", .before = 1)

renalstone.females <- as.table(
  rbind(
    c(196, 223, 103),
    c(603, 486, 232)
  )
)
dimnames(renalstone.females) <- list(stone = c("yes", "no"), age = c("30-39", "40-49", "50-59"))
renalstone.females <- counts_to_cases(renalstone.females) %>%
  add_column(gender = "female", .before = 1)

renalstone <- bind_rows(renalstone.males, renalstone.females) %>%
  as_tibble() %>%
  mutate(
    gender = factor(gender, levels = c("male", "female")),
    stone = factor(stone, levels = c("yes", "no")),
    age = factor(age, levels = c("30-39", "40-49", "50-59"))
  )

