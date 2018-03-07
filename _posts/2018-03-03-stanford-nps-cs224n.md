---
layout: single
title: Course on Natural Language Processing with Deep Learning - Stanford CS224n
category: MachineLearning
tags: NLP course ML
---

Here is the outline of an interesting course on deep learning in natural language processing (NLP), summarized from [the syllabus of the course](http://web.stanford.edu/class/cs224n/syllabus.html). The subtitles are given by me.

* Introduction
* Basics
    * Word vector: Vector representations of words are introduced, such as *word2vec* and *GloVe*
    * Neural networks: introduction and backpropagation
    * Introduction to Tensorflow
* Language structures and models
    * Dependency parsing: identify which words depend on which other words
    * Recurrent Neural Networks (RNNs) and Language Models
* State-of-the-art ideas and applications in NLP
    * Machine Translation, Seq2Seq and attention (Lesson 10): introduce a new task (machine translation) that is the primary use-case of a new neural architecture (sequence-to-sequence, or Seq2Seq), which can be improved by a new neural technique (attention).
    * Advanced attention
    * Transformer Networks and convolutionary neural networks (CNNs)
    * Conference resolution: identify all *mentions* that refer to the same real-world identity
* Advanced and relavant topics
    * Reinforcement learning
    * Semi-supervised and multi-task learning
    * Future of NLP models, multi-task learning and QA systems

The course is now still ongoing. Interested students and professionals may wish to check [the website of the course](http://web.stanford.edu/class/cs224n/) regularly for updated material.

Compared with [the same course given last year](http://cs224d.stanford.edu/syllabus.html), the material covered by the current course seems to remain comparable, though organisation of the material has been adapted to be more systematic, and to reflect new techniques.

# How NLP can be useful for a bioinformatician?

A recent example is to use NLP techniques to determine semantic similarities between Gene Ontology (GO) terms. 

Check out the publication on bioaRxiv: Duong, Dat, Wasi Uddin Ahmad, Eleazar Eskin, Kai-Wei Chang, and Jingyi Jessica Li. ["Word and Sentence Embedding Tools to Measure Semantic Similarity of Gene Ontology Terms by Their Definitions.”](https://doi.org/10.1101/103648) BioRxiv, March 2, 2018, 103648. 

In fact, I was drawn to the course mentioned above by the github repository of the first author, Dat Duong, who visited a earlier version of the course and setup interesting tools for example to [compare two GO terms or two genes](https://github.com/datduong/word2vec2compareGenes).

# Acknowledgment

I would like to thank Richard Socher, the course's instructor, and many teaching assitants who have not only designed and implemented such an interesting course, but also made it publicly available. 
