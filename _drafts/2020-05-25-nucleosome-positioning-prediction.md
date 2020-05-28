---
layout: post
title: Predicting nucleosome positioning
category: bioinformatics
mathjax: True
tags: nucleosome
---

Nucleosome positioning an important factor determining whether a gene is
actively transcribed. Together with transcription factor binding, it determines
transcriptional behaviour.

* TOC
{:toc}

## What is nucleosome

### Structure of nucleosome

DNA in our genome, like in genomes of other eukaryotic species, does not exist
in a linear form, neither does it form random folding or coiling. Instead, they
form nucleosomes together with histone proteins. Each nucleosome consists of 147
base-pair DNA and eight histone proteins (a histone *octamer*, *octo* is a
prefix representing in both Latin and Greek the number 8). The way DNA wound on
nucleosomes are often described as &lsquo;beads on a string&rsquo;.

{% include image.html
url="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Basic_units_of_chromatin_structure.svg/266px-Basic_units_of_chromatin_structure.svg.png"
description="Nucleosome organization, created by David O Morgan. Source:Wikimedia"
%}

The diameter of a nucleosome is about 11 nanometer (1 nanometer=$$ 10^{-9} $$ m).
If DNA in a human cell exists in a linear form, it will be about two meters from
one end to the other.  Thanks to their compact organization into nucleosomes and
higher-order structures, DNA can be fit into human cells, which is about 100
micrometer ($$ 10^{-6} $$ m) in diameter, and takes only a small proportion of it
(in diameter of a few micrometer).

### Higher-order structures based on nucleosome

Nucleosome is the first layer of the organization of our chromosomes. They are
the foundation of higher layers, which include:

* *Chromatin fibre*. The beads-on-a-string structure coils into a about 30 nm
  diameter helical structure known as the 30nm fibre or filament. Histone
  protein H1 is required for this step. Along the chromatin fibre, the density
  of nucleosomes vary densities, depending on and influencing gene regulation.
* *Chromatin loops*. Chromatin fibre further coils and
  forms loops, known as chromatin loops.
* *Topologically associated domains (TADs)*. Chromatin loops fold at a
  sub-megabase scale (1 megabase, or 1Mb, is 1,000,000 bases), and they form
  higher domains of preferential interactions, known as topological associated
  domains (TADs), with the size of a few hundred nanometer.
* *Compartment*. TADs further segregate. On the chromosomal scale, chromatin is
  segregated into two major compartments: the active "A" compartment and
  repressed, inactive "B" compartment, each with distinct properties.
* *Territories*. Finally, entire chromosomes segregate (which means setting
  apart from each other) into distinct regions in the nucleus, occupy distinct
  sub-nuclear *chromosome territories*.

The following figure from [*Principles of genome folding into topologically
associating domains*]() by Szabo *et al.* (Science Advances, 2019) offers a
graphical overview of the hierarchical organization.

{% include image.html
url="/assets/images/Szabo-2019-Science-Advances-Fig1A-genome-folding.png"
description="Figure 1A by Szabo et al. Re-used under the Creative Commons Attribution NonCommercial License 4.0 (CC BY-NC)"
%}

### Why nucleosome is important

We have learned above that nucleosomes are important to package DNA strands
densely. And we learned that they regulate gene expression. In fact, a model of
gene transcription regulation proposed by [Eran Segal and Jonathan
Widom](https://www.nature.com/articles/nrg2591) (Nature Review Genetics, 2009)
postulates that transcriptional regulation can be explained by an
&lsquo;equilibirium competition&rsquo; between nucleosomes and other DNA-binding
proteins such as transcription factors.

## Experimental approaches to quantify nucleosome binding

MNase
ATAC-seq

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
