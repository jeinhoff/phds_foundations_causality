# 🎯 Foundations of Causal Inference

*Estimands · Identification · Estimation* — a one-day PhD course at **MPIDR Rostock**, 26 November 2026.

Social scientists ask causal questions but rarely run experiments, so most work relies on observational data — where the step from association to causation is anything but automatic. This course builds the foundations: how to state a precise causal question and define what you want to estimate (the **estimand**), what assumptions let you **identify** it from data, and how different estimators target different quantities in the **estimation** step. The emphasis is on foundations rather than specific designs, because every causal analysis first needs clarity about *what* is being estimated and *under what assumptions*. Throughout, we follow one running example — the effect of a **university degree** on **completed fertility** — using a synthetic dataset whose true effect we know.

## 📂 Contents

| File | What it is |
|------|------------|
| 🖥️ `slides.html` | The full course deck — open in any browser, no internet needed. |
| 📊 `exercise.R` | Hands-on lab script (Steps 1–5) for the afternoon. |
| 🗃️ `fertility.csv` | The synthetic teaching dataset (keep it beside `exercise.R`). |

## ⚙️ Setup

```r
install.packages(c("tidyverse", "marginaleffects"))
```

Then open `exercise.R`, set the working directory to this folder, and run it top to bottom.
