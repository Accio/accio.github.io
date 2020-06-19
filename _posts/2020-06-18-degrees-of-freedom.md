---
layout: post
title: Degree of freedom in statistical testing
category: Statistics
mathjax: true
---

In [this Minitab Blog
Post](https://blog.minitab.com/blog/statistics-and-quality-data-analysis/what-are-degrees-of-freedom-in-statistics)
I found a clear explanation of the concept of *degree of freedom* (often
abbreviated as &lsquo;d.f.&rsquo;) in the context of hat warning (!), one-sample
t-test, Chi-square test, and linear regression.

A relevant key concept to understand about degree of freedom is *constraint*. In
mathematics, a constraint is a condition of a problem that the solution must
satisfy. Say if we want to compare whether the average height of ten people
equals 1.65m. We can use an one-sample test for it. The null hypothesis is that
the average height is indeed 1.65m (plus and minus sampling error), and the
alternative hypothesis is that the average is a different value.

So under the null hypothesis, the constraint is that the average height must be
1.65m, or the sum of the height of ten people must be 16.5m. That means, the
height of nine persons can vary as they wish, but the last person's height must
be such a value that the mean (or the sum) matches the average value against
which we wish to test. That is the constraint of our problem.

What I find intriguing is that the sconstraint is in essence a human invention:
it is because we *care* about a certain property, we set the constraint.
Therefore, the degree of freedom in fact reflects our interest and intention in
the data (or in the unobservable variables that generate the data).

If this is clear, then the degree of freedom of an one-sample t-test is clear:
it is $ n-1 $ for a sample of $ n $ probes. By following the logic, we have
following rules

* The degree of freedom is $m+n-2$ for two-sample t-tests with two groups of
    sizes $m$ and $n$, respectively.
* The degree of freedom of a $2\times2$ table, used in a Chi-square test of
  independence, has a freedom of 1, because the row sum and column sum are
  constraints. For a table of size $m\times n$, the degree of freedom is
  $(m-1)(n-1)$.
* The degree of freedom of a regression analysis is $n-p$, where $n$ is the
    number of data points to be regressed and $p$ is the number of parameters in
    the regression model.

More generally, in mathematics, degree of freedom can represent the number of
*dimensions* of the *domain* of a random vector, or the number of *free*
components, the number of components by knowing each we can fully determine the
vector. Any in a dynamic system, degree of freedom specifies the number of
independent ways the system can move, without violating any constraint imposed
on it.

