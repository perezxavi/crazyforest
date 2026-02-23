
# crazyforest 0.18.0
* New CRAN version

# crazyforest 0.17.2
* Fix compilation with C++20

# crazyforest 0.17.1
* Fix bug where missing value handling lead to negative impurity importance values
* Slightly change the missing value algorithm (see docs)

# crazyforest 0.17.0
* New CRAN version

# crazyforest 0.16.4
* Add handling of missing values for classification and regression

# crazyforest 0.16.3
* Fix a bug for always.split.variables (for some settings)

# crazyforest 0.16.2
* Add Poisson splitting rule for regression trees

# crazyforest 0.16.1
* Set num.threads=2 as default; respect environment variables and options
* Add hierarchical shrinkage
* Allow vector min.node.size and min.bucket for class-specific limits

# crazyforest 0.16.0
* New CRAN version

# crazyforest 0.15.4
* Add node.stats option to save node statistics of all nodes
* Add time.interest option to restrict unique survival times (faster and saves memory)

# crazyforest 0.15.3
* Fix min bucket option in C++ version

# crazyforest 0.15.2
* Fix memory error for always.split.variables in certain settings

# crazyforest 0.15.1
* Fix quantile regression for factor variables in "order" mode

# crazyforest 0.15.0
* New CRAN version

# crazyforest 0.14.2
* Switch to C++14 standard
* Add min.bucket parameter to restrict terminal node size
* Fix a bug with always.split.variables selecting the wrong variables

# crazyforest 0.14.1
* URL fix for CRAN

# crazyforest 0.14.0
* New CRAN version

# crazyforest 0.13.5
* Fix weight calculation in case-specific RF (csrf())
* Add as.data.frame() method for predictions

# crazyforest 0.13.4
* Allow split.select.weights and always.split.variables together

# crazyforest 0.13.3
* Faster permutation variable importance for high dimensional data (thanks to Roman Hornung)

# crazyforest 0.13.2
* Add deforest() function to remove trees from ensemble
* Fix cross compiling for Windows

# crazyforest 0.13.1
* Fix https URLs

# crazyforest 0.13.0
* New CRAN version

# crazyforest 0.12.4
* Bug fixes

# crazyforest 0.12.3
* Add ... argument to crazyforest()
* Bug fixes

# crazyforest 0.12.2
* Bug fixes

# crazyforest 0.12.1
* Bug fixes

# crazyforest 0.12.0
* New CRAN version

# crazyforest 0.11.8
* Add regularization
* Faster computation (in some cases)

# crazyforest 0.11.7
* Add local variable importance 

# crazyforest 0.11.6
* Add "hellinger" splitrule for binary classification

# crazyforest 0.11.5
* Add x/y interface
* Internal changes (seed differences possible, prediction incompatible with older versions)

# crazyforest 0.11.4
* Add "beta" splitrule for bounded outcomes

# crazyforest 0.11.3
* Accept user-specified function in quantile prediction

# crazyforest 0.11.2
* Bug fixes

# crazyforest 0.11.1
* Bug fixes

# crazyforest 0.11.0
* New CRAN version

# crazyforest 0.10.6
* Internal changes (slightly improved computation speed)
* Warning: Possible seed differences compared to older versions
* Bug fixes

# crazyforest 0.10.5
* Add support of splitting weights for corrected impurity importance 
* Bug fixes

# crazyforest 0.10.4
* Add inbag argument for manual selection of observations in trees

# crazyforest 0.10.3
* Bug fixes

# crazyforest 0.10.2
* Add max.depth parameter to limit tree depth

# crazyforest 0.10.1
* Bug fixes

# crazyforest 0.10.0
* New CRAN version

# crazyforest 0.9.12
* Remove GenABEL from suggested packages (removed from CRAN). GenABEL data is still supported

# crazyforest 0.9.11
* Improve memory management (internal changes)

# crazyforest 0.9.10
* Add impurity importance for the maxstat splitting rule
* Bug fixes

# crazyforest 0.9.9
* Add 'order' mode for unordered factors for GenABEL SNP data (binary classification and regression)

# crazyforest 0.9.8
* Bug fixes

# crazyforest 0.9.7
* Change license of C++ core to MIT (R package is still GPL3)

# crazyforest 0.9.6
* Better 'order' mode for unordered factors for multiclass and survival

# crazyforest 0.9.5
* Bug fixes

# crazyforest 0.9.4
* Add class-weighted Gini splitting

# crazyforest 0.9.3
* Bug fixes

# crazyforest 0.9.2
* Add fixed proportion sampling

# crazyforest 0.9.1
* Bug fixes

# crazyforest 0.9.0
* New CRAN version

# crazyforest 0.8.5
* Faster aggregation of predictions
* Fix memory issues on Windows 7
* Add treeInfo() function to extract human readable tree structure

# crazyforest 0.8.4
* Add quantile prediction as in quantile regression forests

# crazyforest 0.8.3
* Add standard error estimation with the infinitesimal jackknife (now the default)

# crazyforest 0.8.2
* Add bias-corrected impurity importance (actual impurity reduction, AIR)
* Add impurity importance for survival forests

# crazyforest 0.8.1
* Bug fixes

# crazyforest 0.8.0
* New CRAN version

# crazyforest 0.7.2
* Handle sparse data of class Matrix::dgCMatrix
* Add prediction of standard errors to predict()

# crazyforest 0.7.1
* Allow devtools::install_github() without subdir and on Windows
* Bug fixes

# crazyforest 0.7.0
* New CRAN version

# crazyforest 0.6.7
* Improvements in holdoutRF and importance p-value estimation

# crazyforest 0.6.6
* Split at mid-point between candidate values

# crazyforest 0.6.5
* Better formula interface: Support interactions terms and faster computation

# crazyforest 0.6.4
* Add randomized splitting (extraTrees)

# crazyforest 0.6.3
* Bug fixes

# crazyforest 0.6.2
* Drop unused factor levels in outcome before growing
* Add predict.all for probability and survival prediction

# crazyforest 0.6.1
* Bug fixes

# crazyforest 0.6.0
* New CRAN version

# crazyforest 0.5.6
* Faster version of getTerminalNodeIDs(), included in predict()

# crazyforest 0.5.5
* Handle new factor levels in 'order' mode
* Bug fixes

# crazyforest 0.5.4
* Set write.forest=TRUE by default
* Add num.trees option to predict()
* Bug fixes

# crazyforest 0.5.3
* Bug fixes

# crazyforest 0.5.2
* Use unadjusted p-value for 2 categories in maxstat splitting

# crazyforest 0.5.1
* Bug fixes

# crazyforest 0.5.0
* New CRAN version

# crazyforest 0.4.7
* Add splitting by maximally selected rank statistics for regression forests

# crazyforest 0.4.6
* Bug fixes

# crazyforest 0.4.5
* Use faster method for unordered factor splitting

# crazyforest 0.4.4
* Add p-values for variable importance
* Bug fixes

# crazyforest 0.4.3
* Add splitting by maximally selected rank statistics for survival forests
* Bug fixes

# crazyforest 0.4.2
* Add Windows multithreading support for new toolchain

# crazyforest 0.4.1
* Runtime improvement for regression forests on classification data

# crazyforest 0.4.0
* New CRAN version. New CRAN versions will be 0.x.0, development versions 0.x.y

# crazyforest 0.3.9
* Reduce memory usage of savest forest objects (changed child.nodeIDs interface)

# crazyforest 0.3.8
* Remove tuning functions, please use mlr or caret

# crazyforest 0.3.7
* Fix bug with alternative interface and prediction
* Small fixes

# crazyforest 0.3.6
* Add keep.inbag option to track in-bag counts
* Add option sample.fraction for fraction of sampled observations

# crazyforest 0.3.5
* Add tree-wise split.select.weights

# crazyforest 0.3.4
* Add predict.all option in predict() to get individual predictions for each tree for classification and regression
* Small changes in documentation

# crazyforest 0.3.3
* Add case-specific random forests

# crazyforest 0.3.2
* Add case weights (weighted bootstrapping or subsampling)

# crazyforest 0.3.1
* Catch error of outdated gcc not supporting C++11 completely

# crazyforest 0.3.0
* Allow the user to interrupt computation from R
* Transpose classification.table and rename to confusion.matrix
* Respect R seed for prediction
* Memory improvements for variable importance computation
* Fix bug: Probability prediction for single observations
* Fix bug: Results not identical when using alternative interface

# crazyforest 0.2.7 
* Small fixes for Solaris compiler

# crazyforest 0.2.6 
* Add C-index splitting
* Fix NA SNP handling

# crazyforest 0.2.5 
* Fix matrix and gwaa alternative survival interface
* Version submitted to JSS

# crazyforest 0.2.4 
* Small changes in documentation

# crazyforest 0.2.3 
* Preallocate memory for splitting

# crazyforest 0.2.2 
* Remove recursive splitting

# crazyforest 0.2.1 
* Allow matrix as input data in R version

# crazyforest 0.2.0 
* Fix prediction of classification forests in R

# crazyforest 0.1.9 
* Speedup growing for continuous covariates
* Add memory save option to save memory for very large datasets (but slower)
* Remove memory mode option from R version since no performance gain

# crazyforest 0.1.8 
* Fix problems when using Rcpp <0.11.4

# crazyforest 0.1.7 
* Add option to split on unordered categorical covariates

# crazyforest 0.1.6 
* Optimize memory management for very large survival forests

# crazyforest  0.1.5 
* Set required Rcpp version to 0.11.2
* Fix large $call objects when using BatchJobs
* Add details and example on GenABEL usage to documentation
* Minor changes to documentation

# crazyforest 0.1.4 
* Speedup for survival forests with continuous covariates
* R version: Generate seed from R. It is no longer necessary to set the
  seed argument in crazyforest calls.

# crazyforest 0.1.3 
* Windows support for R version (without multithreading)

# crazyforest 0.1.2 
* Speedup growing of regression and probability prediction forests
* Prediction forests are now handled like regression forests: MSE used for
	prediction error and permutation importance
* Fixed name conflict with randomForest package for "importance"
* Fixed a bug: prediction function is now working for probability
	prediction forests
* Slot "predictions" for probability forests now contains class probabilities
* importance function is now working even if randomForest package is
	loaded after crazyforest
* Fixed a bug: Split selection weights are now working as expected
* Small changes in documentation
