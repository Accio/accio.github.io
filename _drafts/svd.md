---
layout: single
title: Singular Value Decomposition, Simon Funk, and others
category: machine-learning
mathjax: true
tags: SVD
---

A recent HackerNews news post on [Facebook and Cambridge Analytica](http://www.niemanlab.org/2018/03/this-is-how-cambridge-analyticas-facebook-targeting-model-really-worked-according-to-the-person-who-built-it/) sheds quite some technical light on the matter. The author, Matthew Hindman, explained how the Facebook data was used to cluster users and predict their psychological profiles. An interesting read for people that are interested in machine learning and in particular how collaborative filtering can be applied in political campaigns.

In its essence, **s**ingular **v**value **d**ecomposition, known as *SVD*, was used. It is a dimention reduction algorithm that decomposes any matrix $$ M $$ into the product of three matrices, $$ U\Sigma V^T $$. Why the decomposition? Because it turns out to have many interesting applications, for instance simultaneous clustering of rows and columns of input $$ M $$ by their association with an unobserved, *aka* latent, variable that is derived from the data. Another typical application of *SVD* is to reduce dimensionality.

During the course of reading I found a blog post by Simon Funk (pen name), who seems [a very interesting person](http://sifter.org/~simon/). In the Netflix million-dollar contest, he proposed to use an efficient *SVD* to predict how users will like movies. What's great about that is (1) he used a very simple model and achieved outstanding results, and (2) he shared his ideas with other participants of the competition, which was rather rare, and (3) he did this during travelling around New Zealand. He seems to have a lot of fun in coding and in life. Amazing. (If you are interested, [here is an interview given by him](https://www.kdnuggets.com/news/2007/n08/3i.html).)

Why SVD, being a simple method, delivered great results? To understand that, we need to have a deeper understanding of the method. There are many great resources around to explain the algorithm, for example [this Youtube video](https://www.youtube.com/watch?v=P5mlg91as1c&t=0s&list=LLPZ5hHZO9jGiHwWRv3RdVRg&index=1) by Leskovec, Rajaraman, and Ullman at the Stanford University.

