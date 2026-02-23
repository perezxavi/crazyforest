# crazyforest 🌳🎲

[![R-CMD-check](https://github.com/perezxavi/crazyforest/workflows/R-CMD-check/badge.svg)](https://github.com/perezxavi/crazyforest/actions)
![Version](https://img.shields.shields.io/badge/Version-0.1.0-orange.svg)
![License: GPL v3](https://img.shields.shields.io/badge/License-GPLv3-blue.svg)

`crazyforest` is a high-performance framework designed for methodological research in Machine Learning. It enables the study of entropy and stochasticity in ensemble models by introducing randomness in both the decision-tree growth phase and the forest aggregation logic.

Built on a high-speed C++ core, `crazyforest` replaces traditional greedy optimization with probabilistic tournaments and chaotic partitioning, making it ideal for large-scale simulations.

## ✨ Core Stochastic Features

The package introduces four specialized mechanisms to explore randomness in Random Forests:

### 1. Chaos Split Rule
* **Usage:** `splitrule = "chaos_split"`
* **Mechanism:** Instead of selecting the locally optimal split, it conducts a random tournament among all candidate points. Each candidate receives a random score $U \sim [0,1]$, and the highest score wins.
* **Audit Mode:** The algorithm "audits" the winner by calculating its actual Gini decrease in the background, allowing for valid **Variable Importance** extraction even from stochastic trees.

### 2. Totally Random Trees
* **Usage:** `splitrule = "totally_random"`
* **Mechanism:** Bypasses all impurity calculations by selecting a variable and a cut-point entirely at random. 
* **Use Case:** Ideal for studying recursive random partitioning and the "Wisdom of the Crowds" in high-dimensional spaces.

### 3. Roulette Prediction Strategy
* **Usage:** `predict_strategy = "roulette"`
* **Mechanism:** Replaces strict majority voting with a probabilistic approach. The final class is sampled randomly, with weights proportional to the tree votes.

### 4. Corrected Roulette
* **Usage:** `predict_strategy = "corrected_roulette"`
* **Mechanism:** An advanced stochastic voting system that normalizes class probabilities based on training set frequencies, neutralizing majority class bias in imbalanced datasets.



## 🚀 Installation

```R
# install.packages("devtools")
devtools::install_github("perezxavi/crazyforest")
```

## 📊 Quick Start: Auditing the Chaos

See how `chaos_split` identifies true signals by auditing the Gini decrease of random splits:

```R
library(crazyforest)

# Generate synthetic data (Var1 and Var2 are signal)
set.seed(42)
n <- 2000
X <- matrix(rnorm(n * 10), ncol = 10); colnames(X) <- paste0("Var", 1:10)
prob <- 1 / (1 + exp(-(X[,1] * 2 + X[,2] * -1.5))) 
df <- data.frame(Y = as.factor(ifelse(prob > 0.5, "A", "B")), X)

# Grow a chaotic forest with audited importance
model <- crazyforest(
  Y ~ ., data = df, 
  splitrule = "chaos_split", 
  importance = "impurity", 
  predict_strategy = "roulette"
)

# True predictors Var1 and Var2 will lead the importance ranking
print(sort(model$variable.importance, decreasing = TRUE))
```

## 📜 Acknowledgements
`crazyforest` is distributed under the GPL3 license. The underlying high-performance C++ architecture is based on the `ranger` framework (Wright & Ziegler). This fork extends that core with novel stochastic splitting and voting methodologies.
