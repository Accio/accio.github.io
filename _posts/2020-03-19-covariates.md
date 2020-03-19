---
layout: single
title: Covariates and control variables explained
category: bioinformatics
tags: statistics covariates RNAseq
---

This post tries to clarify what are covariates and control variables, and discuss how to treat them in the context of omics data analysis.

## What is a covariate

In the column of [Confusing Statistical Terms](https://www.theanalysisfactor.com/series-on-confusing-statistical-terms/) running on the blog [The Analysis Factor](https://www.theanalysisfactor.com/confusing-statistical-terms-5-covariate/), Karen Grace-Martin explains that the concept of covariate is clearly defined in one context: in Analysis of Variance (ANOVA). In ANOVA, the independent variables of interest are categorical. But there are cases where one wishes to adjust the effect of an observed, continuous variable, which is known as the *covariate*.

The author raised an example of assessing the effect of a training program on mathematical ability. Suppose that students are randomly assigned into groups receiving different training. A test is performed after the training. A covariate in this case, for instance, can be the pre-training mathematics score of the students - it is continuous and observed. Here, 'observed' means that the random variable - the pre-training test score - is not randomly assigned to the observations, but rather measured as they are.

The author then went on explaining two resources of confusion about covariates. Some people use the term to indicate *any* continuous independent variable, regardless whether it is an important predictor or a *control variable*. Note that the concept of *control variable* is a useful one. A control variable is included in the statistical model, but it is not of primary interest for the analyst. Its function is reduce unexplained variation by including known sources that are *likely* associated with or cause some of the unexplained variation. 

Another confusion is that people sometimes use the term *covariate* to indicate any control variable, either continuous or categorical. In the example of mathematical training raised above, a categorical control variable can be, 'did you take calculus'?

Given that covariates can carry different meanings in different contexts, the author suggests to state clearly what variables we are hypothesizing about (namely the important predictor variables) and which ones we are controlling for, and whether each variable is continuous or categorical.

## Handling covariates and categorical control variables in omics experiments

In omics experiments, just as other experiment settings, there can be variables that are not randomly assigned, but observed. A typical example in RNA sequencing experiment, for instance, is the RNA integrity, often represented by the *RIN number*. Since RNA integrity is continuous, is only measured but not assigned, and last but not least, is (usually) not a variable of our interest. Therefore, it can be treated as a covariate, *i.e.* continuous control variable.

In an ideal omics experiment, categorical variables are randomized prior to experiments. However, in reality, some categorical variables escape randomizations. For instance, the operator of the experiment may be suddenly sick and replaced by another one during the experiment. Or a sequencing lane is corrupt and a subset of samples are re-sequenced in another lane. Whether randomized or not, these categorical variables - operator, sequencing lane, etc. - are categorical control variables. They should be included in the statistical model, though their coefficients are not of primary interest.

From the statistical modelling perspective, covariates and categorical control variables can be included in the model just as predictor variables of primary interest. In another word, the linear models implemented in *edgeR*, *limma*, and *DESeq2*, for instance, do not know which variables are control variables and which are not. In theory, they do not have to know, either, because anyway the variables are treated the same whether they are control variables or not.

However, in reality, we often wish to remove the effect of control variables, and visualize the expression matrix with control variables removed. For instance, we may wish to use dimension reduction techniques including principal component analysis (PCA) or multidimensional scaling (MDS). In example example, we may wish to visualize library-size normalized gene expression values of selected genes. In either case, we wish to remove variations caused by control variables and use the resulting matrix for downstream analysis.

For this purpose, we can use the `removeBatchEffcet` function in the *limma* package in R/Bioconductor. In the version that I am using (*limma* version 3.42.2), the function can accept both categorical control variables (up to two, known as `batch` and `batch2`) and covariates, *i.e.* continuous control variables (using the `covariates` option). It returns the expression matrix after removing the effect of control variables.

If the input data is microarray or proteomics data where the signal is continuous and is expected to follow the normal distribution, `removeBatchEffect` can be applied directly. If the input data is count-based, we have at least three options to transform them: `voom` (quasi log2), `cpm`, and variance stabilization normalization (`vsn2`) provided by the `vsn` package.

Which one to choose? It depends on your need. For instance, `vsn2` is particularly suited for dimension reduction because it tries to stabilize the variance of the transformed matrix, and therefore reducing the impact of features showing large variance. On the other hand, to visualize expression of a particular gene, `cpm` may be a good choice because the result is mostly interpretable.

## Conclusions

Covariates are continuous control variables. Together with categorical control variables, they make control variables that should be included in the statistical model which however are not of primary interest.

In the context of omics experiment, effects of control variables often need to be removed from the expression matrix, sometimes after appropriate data transformation.

