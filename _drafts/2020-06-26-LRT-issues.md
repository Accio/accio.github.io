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

