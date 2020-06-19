---
layout: post
title: more about LRT
category: Statistics
---


Points by Iakov
On a scientific note, I guess you know this. But often underappreciated:
- LRT is approximate, so while widely used, it doesn't guarantee anything for a concrete pair of hypotheses (at least that's how I understand this)
- AFAIR it relies on quadratic approximation of the maximum likelihood point; for very steep/sharp/strange ML peaks might not work
- LRT works only if you find a true maximum likelihood. This is extremely hard for all non-convex problems, and a lot of interesting problems are non-convex. Best bet is to run ML optimization from different points multiple times, but I used a cheaper trick :-)
- LRT statistic asymptotic distribution changes if your null hypothesis is on the border of alternative hypothesis; e.g., if you have a non-negative parameter in alternative hypothesis, which is =0 in the H0.

The trick used by Iakov was to reduce the number of false positives mainly. In
the positive selection database about ~30% of the data points were false
positive due to H0 ML underoptimization.

So Iakov implemented a simple heuristic. After ML for H0 and H1 are optimized:
1. try to improve H0 ML from H1 ML estimate in the parameter space
2. try to improve H1 ML from H0 ML estimate in the parameter space
3. if 1 or 2 succeeded, goto 1.
