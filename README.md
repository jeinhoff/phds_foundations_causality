# 🎯 Foundations of Causal Inference: Estimands, Identification, Estimation

Social scientists are often interested in causal questions but can rarely run experiments. Most research therefore relies on observational data — yet moving from observed associations to causal conclusions is far from straightforward. This course introduces the foundational tools for determining whether and how causal insights can be drawn from such data. We begin by learning how to formulate precise causal questions and define what we want to estimate (“the estimand”) using potential outcomes notation. We then turn to the assumptions required to identify an estimand from observed data, and discuss when these assumptions are (not) defensible in practice. Finally, we examine how different statistical estimators target different estimands, and why this distinction matters. The course emphasizes foundations rather than specific research designs, because any causal analysis first requires clarity about what is being estimated and under what assumptions.

## ⚙️ Setup

The afternoon has a short hands-on lab in **R**. Please set this up before the course or during the lunch break — it takes about 10 minutes. No prior R experience is assumed; the steps below start from scratch.

**1. Install R and RStudio (both free).** R is the language; RStudio is a friendly window for writing and running it.
- R: <https://cran.r-project.org> — pick your operating system and install with the default options.
- RStudio Desktop: <https://posit.co/download/rstudio-desktop/> — install after R.

**2. Download the course files.** On the green **`< > Code`** button above, choose **Download ZIP**, then unzip it to a folder you can find again (e.g. your Desktop). You should see `slides.html`, `exercise.R`, and `fertility.csv` sitting together — keep them in the same folder.

**3. Open the project in RStudio.** Launch RStudio, then **File ▸ Open File…** and choose `exercise.R`. It opens in the top-left editor pane.

**4. Install the two packages we use.** Copy the line below into the **Console** (the bottom-left pane), press **Enter**, and wait for it to finish. You only ever do this once.

```r
install.packages(c("tidyverse", "marginaleffects"))
```

**5. Point R at the folder with the data.** So R can find `fertility.csv`, use **Session ▸ Set Working Directory ▸ To Source File Location** (this points R at the folder holding `exercise.R`).
