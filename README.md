# Foundations of Causal Inference: Estimands, Identification, Estimation

A one-day PhD course at the **Max Planck Institute for Demographic Research (MPIDR), Rostock**
**26 November 2026 · 10:00–15:00 CET**

---

## About the course

Social scientists are often interested in causal questions but can rarely run
experiments. Most research therefore relies on observational data — yet moving
from observed associations to causal conclusions is far from straightforward.
This course introduces the foundational tools for determining whether and how
causal insights can be drawn from such data.

We begin by learning how to formulate precise causal questions and define what
we want to estimate (the **estimand**) using potential-outcomes notation. We
then turn to the assumptions required to **identify** an estimand from observed
data, and discuss when these assumptions are (and are not) defensible in
practice. Finally, we examine how different statistical **estimators** target
different estimands, and why this distinction matters.

The course emphasizes foundations rather than specific research designs, because
any causal analysis first requires clarity about *what* is being estimated and
*under what assumptions*.

### The three-step arc

1. **Estimand** — what precisely do we want to know? (potential outcomes; ATE / ATT / CATE)
2. **Identification** — what must hold to recover it from data? (exchangeability, positivity, consistency)
3. **Estimation** — how do we compute it, and with what uncertainty? (g-computation with `marginaleffects`)

We follow one running example all day: the causal effect of completing a
**university degree** on **completed fertility** (number of children), using a
**synthetic social-demography dataset** whose true effect we know — so we can
watch our estimates recover it, and watch bad choices break it.

## Learning goals

By the end of the day you will be able to:

- state a causal question as a **theoretical estimand** in potential-outcomes terms;
- distinguish **descriptive, predictive, and causal** questions;
- read a **DAG** and classify variables as confounder, mediator, or collider;
- reason about the **identification assumptions** behind a causal claim;
- estimate ATE / ATT / CATE with **g-computation** and report uncertainty;
- recognise how controlling the **wrong** variable silently breaks an estimate.

## What's in this folder

| File | Description |
|------|-------------|
| `slides.html` | The full course deck (self-contained; open in any browser, no internet needed). |
| `exercise.R` | Hands-on lab script (Steps 1–5) students work through in the afternoon. |
| `fertility.csv` | The synthetic teaching dataset. Keep it in the same folder as `exercise.R`. |

## Setup

You need **R** (≥ 4.2) and two packages:

```r
install.packages(c("tidyverse", "marginaleffects"))
```

Then open `exercise.R`, set the working directory to this folder, and run it
top to bottom:

```r
setwd("path/to/phds_foundations_causality")
source("exercise.R")   # or step through it interactively
```

## The dataset

`fertility.csv` is **simulated**, so the true causal effect is known (true
ATE ≈ **−0.5 children**). This is what lets the exercise *check its own answers*.

| Variable | Role | Meaning |
|----------|------|---------|
| `university` | treatment | completed a university degree (0/1) |
| `n_children` | outcome | number of children by age 45 |
| `woman`, `parental_edu`, `ability`, `birth_year`, `migration_background`, `urban` | confounders | pre-treatment background |
| `income` | **mediator** | degree → income → fertility — do **not** control |
| `owns_home` | **collider** | common effect of degree *and* fertility — do **not** control |
| `oracle_y0`, `oracle_y1` | (hidden truth) | each person's potential outcomes, used only to check answers |

The lab deliberately hides a mediator and a collider so students can *see*
over-control bias and collider bias move the estimate for the wrong reasons.

## Sources

The course is built on three sources that map onto one another:

- **Lundberg, Johnson & Stewart (2021)**, "What Is Your Estimand? Defining the
  Target Quantity Connects Statistical Evidence to Theory," *American
  Sociological Review* — the conceptual arc (theoretical → empirical estimand → estimation).
- **Arel-Bundock**, the [`marginaleffects`](https://marginaleffects.com) R
  package — the computational engine (predictions, comparisons, slopes).
- **Arel-Bundock (2026)**, *Model to Meaning: How to Interpret Statistical
  Models with R and Python*, CRC Press — free online at
  [marginaleffects.com](https://marginaleffects.com).
