---
layout: post
title: Three classical approaches to hypothesis testing
category: Statistics
---

Here I introduce three classical approaches to hypotheses testing in the
frequentists's approach of statistics: the likelihood-ratio test, the Lagrange
multiplier test (or the score test), and the Wald test.

* TOC
{:toc}

## The likelihood-ratio test

The oldest is the [likelihood-ratio
test](https://en.wikipedia.org/wiki/Likelihood-ratio_test), sometimes
abbreviated as &lsquo;LQT&rsquo;. It compares the goodness of fit of two
statistical models being considered by the ratio of their likelihoods, which is
found either by maximization over the entire parameter space, or either by
imposing certain constraints. The constraints, for instance, can be expressed as
the null hypothesis. If the constraints are supported by the data, the two
likelihoods should not differ by more than sampling error. Therefore, the
likelihood-ratio test tests whether the ratio of two likelihood values is
significant from one.

The [Neyman-Pearson
lemma](https://en.wikipedia.org/wiki/Neyman%E2%80%93Pearson_lemma) states that
when we compare two models each of which has no unknown parameters, the
likelihood-ratio test is the most powerful test among all statistical tests.

The likelihood-ratio test is a standard statistical test for comparing nested
models. Two models are nested if one model contains all the terms of the other,
and at least one additional term. By simulation, it is also possible to use the
test for non-nested models. For details, see [Lewis, Butler, and Gilbert,
2010](https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/j.2041-210X.2010.00063.x).

Besides the likelihood-ratio test, the other two approaches of hypothesis
testing are the score test (also known as &lsquo;Lagrange multiplier
test&rsquo;) and the Wald test, which is named after the Hungarian mathematician
[Abraham Wald](https://en.wikipedia.org/wiki/Abraham_Wald), who discovered the
[survivorship bias](https://en.wikipedia.org/wiki/Survivorship_bias).

## The score test

[The score test](https://en.wikipedia.org/wiki/Lagrange_multiplier_test)
evaluates constraints on the parameter to be estimated based on the gradient of
the likelihood function with respect to the parameter, which is known as the
*score*, evaluated at the hypothesized parameter value under the null
hypothesis. If the estimator is near the maximum of the likelihood function,
then the score should not differ from zero by more than sampling error.

## The Wald test

[The Wald test](https://en.wikipedia.org/wiki/Wald_test) in essence is based on
the weighted distance between the estimate and its hypothesized value under the
null hypothesis, where the weight is the precision of the estimate, namely the
reciprocal of the variance. So the form resembles closely that of a t-test.
Indeed, when testing a single parameter, the square root of the Wald statistic
can be understood as a (pseudo) t-ratio, which is, however, not actually
t-distributed except for the special case of linear regression.

## The relationship between the three methods and their applications

The three approaches are asymptotically equivalent (all approaching the
chi-square distribution), though in the case of finite samples, the results can
differ strongly between the methods.

In bioinformatics and computational biology, these methods are used in many
settings, for instance estimating differential gene expression in bulk and
single-cell RNA sequencing studies.

## Inference and model selection in Bayesian statistics

In Bayesian statistics, suppose that we have a prior distribution of a
parameter, which can be our intuition or prior knowledge, some data associated
with that parameter, and we wish to estimate (infer) the value of a parameter
given the prior distribution and the data. One can use the mode of the posterior
distribution, which is distribution of the parameter updated from the prior
model by the data, as the best guess of the parameter. The mode of the posterior
distribution is known as the Maximum a posteriori probability estimate, or
simply the *MAP estimate*. Hypothesis testing is then addressed by quantifying
the confidence interval of the MAP estimate with respect to the hypothesis.

If we have two hypotheses, we can choose the one with the highest posterior
probability. This is known as the *MAP hypothesis test*. See the course's
website of [Introduction to Probability, Statistics and Random
Processes](https://www.probabilitycourse.com/chapter9/9_1_8_bayesian_hypothesis_testing.php)
for mathematical details and examples of MAP hypothesis test. And see the blog
post by Jonny Brooks-Bartlett [*Probability concepts explained: Bayesian
inference for parameter
estimation*](https://towardsdatascience.com/probability-concepts-explained-bayesian-inference-for-parameter-estimation-90e8930e5348)
for graphical examples and more explanations.

But what happens that we have two competing hypotheses with strong difference in
complexity? Then we need to select among the models, following the principle of
Occam's Razor: *Use fewer things unless necessary*.

The mostly used Bayesian versions of model selection are [Akaike information
criterion (AIC)](https://en.wikipedia.org/wiki/Akaike_information_criterion) and
[Bayesian information criterion (BIC)](Bayesian_information_criterion). They
both reward parameters and models that maximize likelihood, while penalizing
complex models.

## Conclusions

In the frequentist's approach of statistics, one can use the likelihood-ratio
test, the score test, or the Wald test to test a hypotheses against another. The
likelihood-ratio test is used for model selection, either directly for nested
models, or via simulation for non-nested models.

In the Bayesian approach, we often use MAP estimates and confidence intervals to
test a hypothesis. AIC and BIC uses likelihood and penalties of model complexity
to select the parsimonious model that fit the data at best.
