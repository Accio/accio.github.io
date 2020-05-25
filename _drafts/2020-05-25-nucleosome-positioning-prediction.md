---
layout: post
title: Predicting nucleosome positioning
category: bioinformatics
tags: nucleosome
---

Nucleosome positioning an important factor determining whether a gene is
actively transcribed. Together with transcription factor binding, it determines
transcriptional behaviour.

* TOC
{:toc}

## What is nucleosome and why it matters

## Experimental approaches to quantify nucleosome binding

## Software that I found to predict nucleosome binding

### NuPop

Xi *et al.* published in 2010 the software NuPop ([Xi *et al.*, BMC Genomics
2010](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-11-346)).
It uses a duration Hidden Markov Model for nucleosome position prediction. An
interesting feature is that it explicitly models the linker DNA length. The
core model was trained using yeast data, and the model parameters are scaled to
reflect genome structures of other species.

The software was written in Fortran and a R package as a wrapper. It is
available in the
[Bioconductor](https://www.bioconductor.org/packages/release/bioc/html/NuPoP.html),
as well as on GitHub [jipingw/NuPoP](https://github.com/jipingw/NuPoP).

For those who want to see the parameters of the models, it seems that the binary
file [`sysdata.rda`](https://github.com/Accio/NuPoP/tree/master/R) contains
them.

To those who are interested in differential splicing, the paper of Xiong *et
al.*, *The human splicing code reveals new insights into the genetic
determinants of disease*, published in 2015 in *Science* may be familiar. In
fact, the authors used `NuPop` to predict nucleosome positioning in their study.

### LeNup

A recent software to learn sequence-based features of nucleosome positioning and
to predict nucleosome positioning patterns is *LeNup* ([Zhang *et
al.*](https://academic.oup.com/bioinformatics/article/34/10/1705/4796955),
Bioinformatics, 2018).

It uses a convolutional neural network to predict nucleosome positioning in Homo
sapiens and other species. The open-source software is written in Python and
Lua, and is available on GitHub at
[biomedBit/LeNup](https://academic.oup.com/bioinformatics/article/34/10/1705/4796955#supplementary-data).
