---
layout: post
title: Internship on graph learning with patient-level data
category: Career
---

A few colleagues at Roche are looking for a PhD-level intern to investigate the
potential to combine knowledge graphs with patient-level data for prediction
tasks. See the link at the bottom to apply for it.

Knowledge graphs represent our knowledge of biological systems in networks, i.e.
nodes (biological entities such as DNA, RNA, protein, bacteria, virus, or
abstract knowledge entities such as disease, life style, etc.) and edges (how
different entities relate to and modulate each other). These networks are
notoriously complex, incomplete, and noisy, since our understanding of biology
is probably still naive, often uncertain, and not rarely completely wrong.
However, people try to do their best to collect their knowledge in these
networks and to improve on them, because many people hold the assumption that by
factoring in the network, we may better understand our observations of and data
collected from biological systems, for instance human disease. For any given
biological question, it is of general interest to learn whether using the
network improves our capability of addressing and solving the question compared
with the scenario where biological knowledge is used heuristically at best.

Representation learning on graphs tries to find optimal ways to represent, or
encode, the graph structure so that it can be used by machine learning models[^1].
Traditionally, researchers relied on user-defined heuristics to extract
features, for instance degree statistics or kernel methods. Alternatively, we
can exploit matrix factorization and stochasticity such as random walk to
address the problem. When data amount is huge, nonlinear dimensionality
reduction with neural-network-like approaches such as graph convolutional
networks and variational autoencoders can work well, though we often have to
sacrifice the interpretability of the model. Again, for any given task, it is of
interest to learn the optimal strategy (or strategies) by considering both its
performance, and perhaps more importantly, the complexity and interpretability
of the model.

My colleagues are interested in using graph networks and patient-level data for
prediction tasks such as label expansion, prediction of patient outcome, and
inference and prediction of efficacy and safety profiles of drug combinations. I
think such tasks may be perfect cases to test whether graph learning exceeds
various baseline benchmark results, which can derive from (1) data-only
interpretable methods, (2) data-only black-box methods, and (3) interpretable
methods coupled with heuristic biological knowledge, and (4) back-box methods
coupled with heuristic biological knowledge. While comparing all these
strategies presents a daunting task, the intern will hopefully make the first
move, helping us better understand the strengths and limitations of applying
graph-learning approaches for questions in personalized healthcare.

If you are interested, please find more details and apply [here](https://roche.wd3.myworkdayjobs.com/roche-ext/job/Basel/Data-Science-Intern--Roche-Advanced-Analytics-Network---Biomedical-Knowledge-Graph-machine-learning_202201-100735-1).

### Notes

[^1]: See [Representation Learning on Graphs: Methods and Applications by Hamilton, Ying, andmark Leskovec](https://www-cs.stanford.edu/people/jure/pubs/graphrepresentation-ieee17.pdf) for a review of the techniques.
