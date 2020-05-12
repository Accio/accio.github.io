---
layout: post
title: >-
  Introduction to machine learning with graph networks
category: machine-learning
tags: inductive biases, deep learning, graph networks
---

I read the article *Relational inductive biases, deep learning, and graph
networks* by Battaglia *et al*. Below are my learning notes.

According to the authors, it is "part position paper, part review, and part
unification". It is the first paper that I read in this area, but the paper is
written clearly so that even an outsider like me can grasp some key ideas
quickly.

The full paper is available at [arXiv](http://arxiv.org/abs/1806.01261).


## The inductive bias

The authors started with the principle of *combinatorial generalization*, an
ability of human to construct new interferences, predictions, and behaviours
from known building blocks. We can also call it the ability to *make infinite
use of finite means*.

Throughout the paper, the authors argued that graph networks is one direction to
go if we aim at achieving combinatorial generalization. A important reason is
that graph networks implement the *relational inductive bias*.

What is an inductive bias? T. Mitchell defined an inductive bias as set of
assumptions that the learner uses to predict outputs given inputs that it has
not encountered. In a way, it resembles the modelling procedure in statistical
inference, where we make assumptions of the procedure how the sample data are
collected.

In the process of learning, during which we gain knowledge by observing and
interacting with the world, we need to search a space of solution for one that
either provides a better explanation of the data, or offers higher awards. But
what happens if there are multiple solutions that are equally good? An
*inductive bias* allows a learning algorithm to prioritize one solution or one
interpretation over another, independent of the observed data.

Many techniques in statistics and machine learning implement the concept
*inductive bias* either explicitly or implicitly. Probably the best known of
them is the Occam's Razor Principle: when multiple hypotheses make the same
predictions, one should prefer the one with the fewest assumptions. Other
examples listed by the authors include the choice and parametrization of the
prior distribution in Bayesian inference and the techniques of regularization
for regression and classification, which shrinks the parameters towards zero in
order to avoid over-fitting. It can also be implemented in the architecture of
the algorithm itself, for instance by preferring certain hypotheses
heuristically. 

From the statistical perspective, inductive biases often trade flexibility for
improved sample complexity, which is defined in machine learning as the number
of training samples required to learn a target function, and can be understood
in terms of the variance-bias trade-off. One form of inductive bias or another
may improve the capacity of the conclusion being generalized, though this is not
guaranteed until the model has been repeatedly tested and validated.

## Deep learning

The authors went on listing three types of deep learning techniques that have
developed rapidly in the last years: multi-layer perceptrons (MLPs),
convolutional neural networks (CNN), and recurrent neural networks (RNN).

The authors observe these models from the perspective of inductive biases. There
are some relational inductive biases implemented, for instance the local
inductive biases in CNN, however they are not yet strong enough. They believe
that graphs, the mathematical model encoding objects and their relationships,
in particular computations over graphs, support a strong relational inductive
bias.

From there, they propose to use graph structures explicitly for computation,
especially in combination with the three types of neural networks listed above.
They name the framework *graph networks*.

## Graph networks

A graph in the framework of graph networks is a 3-tuple consisting of
nodes, edges, and global attributes. Computation in a full graph-network block
involves iterative updates of attributes of edges, nodes, and the graph. Details can be
found in the Algorithm 1 in the paper.

The computation model reminds me strongly of physical models of networks as well
as rule-based network-analysis methods such as Boolean network analysis.
According to the authors, the function used to update the elements of a
graph and to aggregate multiple effects as input to an element can be versatile.
Even a neural network is possible to be used.

Next, the authors went on introducing ideas how to implement the iterative
update logic inside a graph network block. And they also discussed how to
combine blocks of graph networks into a larger architecture of computation, for
instance a sequential architecture, an encoder-decoder architecture, or a
recurrent graph-network architecture.

The authors also provide software-code implementations of graph networks,
available at GitHub [deepmind/graph_nets](https://github.com/deepmind/graph_nets).

## My thoughts and material for further learning

Overall I found the manuscript a good read. Using networks to represent
biological networks and to perform computations over them is a topic that I have
pursued since my PhD study. While the concept is not new, the emerging tools and
data may provide us more resources to apply such methods to real-world problems,
for instance multimodal analysis of single-cell data, understanding of
poly-pharmacology, and development of multi-specific drugs.

A collection of papers on graph neural networks can be found in the GitHub
repository [nnzhan/Awesome-Graph-Neural-Networks](https://github.com/nnzhan/Awesome-Graph-Neural-Networks).

The Ph.D. thesis of T. N. Kipf, [Deep learning with graph-structured
representations](https://pure.uva.nl/ws/files/46900201/Thesis.pdf), can be an
interesting in-depth read in this area, since the author and his mentor, M.
Welling, are among the people who pioneered research in this area.

[Fout *et
al*](https://papers.nips.cc/paper/7231-protein-interface-prediction-using-graph-convolutional-networks.pdf)
used graph convolutional networks to predict protein-protein interfaces. The
code is available on [GitHub](https://github.com/fouticus/pipgcn), though no
update has been done since Dec 2017.

[Zitnik *et
al.*](https://academic.oup.com/bioinformatics/article/34/13/i457/5045770)
reported on *Bioinformatics* in 2018 their attempt to use a multimodal graph of
protein-protein interactions, drug-target interactions and the poly-pharmacology
side effects. High-level illustrations of their approach, which is named
decagon, code, and data are available at [the website of Stanford Network
Analysis Project (SNAP)](http://snap.stanford.edu/decagon/).

Did I miss important points of the paper? Do you have other ideas how to graph
networks in biomedical settings? Please let me know.
