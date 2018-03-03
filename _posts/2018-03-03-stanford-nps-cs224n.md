---
layout: single
title: Course on Natural Language Processing with Deep Learning - Standford CS224n
category: NLP MachineLearning
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

# Acknowledgment

I would like to thank Richard Socher, the course's instructor, and many teaching assitants who have not only designed and implemented such an interesting course, but also made it publicly available. 
