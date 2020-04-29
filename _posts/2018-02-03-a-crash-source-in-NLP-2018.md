---
layout: post
title: A crash course to start state-of-the-art NLP in 2018
category: machine-learning
tags: NLP NCBI word2vec LIME
---

Recently I stumbled via *HackerNews* upon [a good article](https://blog.insightdatascience.com/how-to-solve-90-of-nlp-problems-a-step-by-step-guide-fda605278e4e) introducing how to perform state-of-the-art natural language processing (NLP) analysis, featuring real-world examples. 

The title of the article, *How to solve 90% of NLP problems: a step-by-step guide*, seems a bold claim. Nevertheless the article is very reasonable: it explains not only the basics of NLP, but also some basic principles of machine learning.

## Key steps of solving a NLP problem

The author, [Emmanuel Ameisen](https://blog.insightdatascience.com/@emmanuelameisen?source=post_header_lockup), proposes following steps:

1. Gather data;
2. Clean data;
3. Find a good data representation (e.g. the adjacency matrix in network analysis, or particularly well known the **bag-of-words** model), and visualise the embeddings;
4. Build a simple classifier (*e.g.* logistic regression);
5. Inspection of the model (*e.g.* most-weighted features) and its performance (*e.g.* with visualisation of confusion matrix);
6. Accouting for vocabulary structure, for instance by using term-frequency, inverse document frequency (TF-IDF);
7. Leveraging semantics, for example by using the [Word2Vec](https://arxiv.org/abs/1301.3781) technique, which tries to find continuous embeddings for words; or in plain english, it learns from reading massive amounts of text which words tend to appear in similar contexts. At this step, the author tried both a very simple method (averaging the Word2Vec vector of all words in a sentence, therefore creasing a setence-level representation), as well as a black-box method known as LIME ([article describing the method](https://arxiv.org/abs/1602.04938), [codes on github](https://github.com/marcotcr/lime)). LIME explains the decisions of any classifier **on one particular example** by perturbing the input and seeing how prediction changes.
8. Leveraging syntax using end-to-end approaches, which treat a setence as **a sequence of individual word vectors**, such as [GloVe](https://nlp.stanford.edu/projects/glove/) or [CoVe](https://arxiv.org/abs/1708.00107), which can be trained with [convolutional neural networks (CNN)](https://arxiv.org/abs/1408.5882). According to the author, CNN generally performs well and is much quicker to train than more complex models such as LSTMs (Long short-term memory) and Encoder/Decoder architectures.

## A quick recap

The recaps can be in fact generalised to most ML problems:

* Start with a quick and simple model
* Explain its predictions
* Understand the kind of mistakes it is making
* Use that knowledge to inform your next step, whether it is to improve the data or to improve the model.

## Code and other resources

* The author kindly shared his code, originally used apparently for a NLP workshop, on [github](https://github.com/hundredblocks/concrete_NLP_tutorial). It may be an interesting resource for anyone who wants to give it a try.
* On this somehow hidden [web page of NCBI research](https://www.ncbi.nlm.nih.gov/CBBresearch/Wilbur/IRET/DATASET/), you may find word vectors (in *word2vec* binary format) trained on all PubMed abstracts as of Mar. 2016. It is an interesting resource for any one working with NLP to tackle biological problems.
