# ===========================================================================
# Foundations of causal inference — hands-on exercise
# MPIDR Rostock, 26 November 2026
#
# Running question: does completing a UNIVERSITY degree change COMPLETED
# FERTILITY (number of children by age 45)?
#
# The data are SIMULATED, so we know the true effect and can check our work.
# Put fertility.csv in the same folder as this script.
# ===========================================================================

library(tidyverse)        # data wrangling helpers
library(marginaleffects)  # our estimation engine

# --- Step 1: load and look at the data -------------------------------------
dat <- read.csv("fertility.csv")

dim(dat)
dat |>
  select(university, n_children, woman, parental_edu, ability, birth_year) |>
  head()

# --- Step 2: fit the outcome model -----------------------------------------
# Interact the treatment with the confounders so the effect can vary by person.
# NOTE: we deliberately leave out `income` (a mediator) and `owns_home`
# (a collider). More on that below.
mod <- lm(
  n_children ~ university * (
    woman + parental_edu + ability + birth_year +
    migration_background + urban),
  data = dat)

# Do NOT interpret these coefficients directly — the model is just an engine.
# length(coef(mod))

# --- Step 3: the ATE (average treatment effect) ----------------------------
# Average effect of a degree over the whole sample.
avg_comparisons(mod, variables = "university")

# Discuss: sign and size? which estimand? which assumption worries you most?

# --- Step 4: ATT and CATE --------------------------------------------------
# ATT — only among those who actually got a degree:
avg_comparisons(mod, variables = "university",
                newdata = subset(dat, university == 1))

# CATE — effect for women vs. men:
avg_comparisons(mod, variables = "university", by = "woman")

# Visualise the heterogeneity:
plot_comparisons(mod, variables = "university", by = "woman")

# --- Step 5: explore the traps ---------------------------------------------
# The true ATE (only knowable because the data are simulated):
mean(dat$oracle_y1 - dat$oracle_y0)

# 5a. MEDIATOR: add `income`. The estimate shrinks — you just blocked part of
#     the causal path university -> income -> ... . This is over-control bias.
mod_med <- lm(
  n_children ~ university * (
    woman + parental_edu + ability + birth_year +
    migration_background + urban + income),
  data = dat)
avg_comparisons(mod_med, variables = "university")

# 5b. COLLIDER: add `owns_home`, a common effect of BOTH the degree and
#     fertility. Conditioning on it opens a spurious path and biases the answer.
mod_col <- lm(
  n_children ~ university * (
    woman + parental_edu + ability + birth_year +
    migration_background + urban + owns_home),
  data = dat)
avg_comparisons(mod_col, variables = "university")

# 5c. Compare all three to the truth:
round(c(
  truth        = mean(dat$oracle_y1 - dat$oracle_y0),
  correct      = avg_comparisons(mod,     variables = "university")$estimate,
  add_mediator = avg_comparisons(mod_med, variables = "university")$estimate,
  add_collider = avg_comparisons(mod_col, variables = "university")$estimate
), 2)

# 5d. Your turn: compute a CATE by `migration_background`, and plot it.
# avg_comparisons(mod, variables = "university", by = "migration_background")

# Take-away: the estimation code barely changes — but adding the WRONG control
# silently breaks a causal estimate. The hard work is estimand + identification.
