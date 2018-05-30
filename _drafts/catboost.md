---
layout: single
title: CatBoost
category: MachineLearning
mathjax: true
tags: SVD
---

Recently, I learned through a hackathon event [CatBoost](https://github.com/catboost/catboost), an open-source library of gradient boosting on decision trees, which is particular friendly with categorical features. Users do not need to pre-process categorical features and can directly start inference, which the authors argue is both fast and accurate.

Here I shortly summarise the key aspects of the method.

# Gradient boosting

Gradient boosting can be used for both regression (where the target is a continuous or dicrete numeric variable) and classification (where the target is categorical) problems. It produces a prediction model in the form of an *ensemble* of *weak* prediction models, typically decision trees.

In general, boost methods work by iteratively learning weak classifiers and adding them to a final, strong classifier. After a weak learner is added, the data are reweighted so that wrongly classified examples gain weight and correctly classified examples gain weight. In this way, future weak learners are trained to concentrate on the misclassified samples.

In the case of regression, during the training process, each model is fitted to the residual between target variable $$ y $$ and the output of existing model ensemble $$ F_{m}(x) $$, which is $$ y - F_{m}(x) $$. Note that this happens to be the negative gradients with respect to $$ F(x) $$ of the squared error loss function $$ \frac{1}{2}(y-F(x))^2 $$. Therefore gradient boosting is a gradient descent algorithm.
