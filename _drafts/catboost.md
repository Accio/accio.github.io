---
layout: single
title: CatBoost
category: MachineLearning
mathjax: true
tags: CatBoost boosting
---

Recently, I learned through a hackathon event [CatBoost](https://github.com/catboost/catboost), an open-source library of gradient boosting on decision trees developed by the Russian company yandex, which is particular friendly with categorical features. Users do not need to pre-process categorical features and can directly start inference, which the authors argue is both fast and accurate.

Here I shortly summarize the key aspects of the method.

# Gradient boosting

Gradient boosting can be used for both regression (where the target is a continuous or discrete numeric variable) and classification (where the target is categorical) problems. It produces a prediction model in the form of an *ensemble* of *weak* prediction models, typically decision trees.

In general, boost methods work by iteratively learning weak classifiers and adding them to a final, strong classifier. After a weak learner is added, the data are re-weighted so that wrongly classified examples gain weight and correctly classified examples gain weight. In this way, future weak learners are trained to concentrate on the misclassified samples.

In the case of regression, during the training process, each model is fitted to the residual between target variable $$ y $$ and the output of existing model ensemble $$ F_{m}(x) $$, which is $$ y - F_{m}(x) $$. Note that this happens to be the negative gradients with respect to $$ F(x) $$ of the squared error loss function $$ \frac{1}{2}(y-F(x))^2 $$. Therefore gradient boosting is a gradient descent algorithm.

Other algorithms in this class includes [AdaBoost](https://en.wikipedia.org/wiki/AdaBoost) and [XGBoost](https://github.com/dmlc/xgboost).

# Hand-on of CatBoost

[CatBoost website](https://catboost.yandex/) provides a comprehensive tutorial introducing both python and R packages implementing the CatBoost algorithm. A [jupyter notebook](https://github.com/catboost/catboost/blob/master/catboost/tutorials/catboost_python_tutorial.ipynb) is available to explore some base cases of using CatBoost.

The python package can be installed via `pip`. And below is a minimal example to test CatBoost.

```{python}
import numpy as np
from catboost import CatBoostRegressor

dataset = np.array([[1,4,5,6], [4,5,6,7], [30,40,50,60], [20,15,85,60]])
train_labels = [1.2, 3.4, 9.5, 24.5]
model = CatBoostRegressor(learning_rate=1, depth=6, loss_function='RMSE')
fit_model = model.fit(dataset, train_labels)

print(fit_model.get_params())
```

# Why CatBoost has superior performances

According to the key reference on arXiv, [CatBoost: unbiased boosting with categorical features](https://arxiv.org/abs/1706.09516), two critical algorithmic advances were introduced in CatBoost. 

The first is the implementation of ordered boosting, a permutation-driven alternative to the classic algorithm. The second is an innovative algorithm for processing categorical features. Both techniques were created to fight a prediction shift caused by a special kind of target leakage present in all currently existing implementations of gradient boosting algorithms.

# Impressions and conclusions

CatBoost seems very well equipped for real-world machine learning problems where a large number of categorical variables need to be considered. It is fast and accurate based on my experience. When the data is not well standardized and the model training time is limited, I think CatBoost is likely a better choice than methods that rely on heavy training and parameter/structure tuning, such as SVM and DNN. I will explore the method more to understand how exactly it ticks.
