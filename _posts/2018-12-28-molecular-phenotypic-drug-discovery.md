---
layout: post
title: Molecular Phenotyping in Drug Discovery
category: drug-discovery
tags: 
- molecular phenotyping
---

[Molecular Phenotyping](https://en.wikipedia.org/wiki/Molecular_phenotyping) characterizes drug candidates by profiling pathway reporter genes, i.e. pre-selected genes that are modulated specifically by human metabolic and signaling pathways, in cellular systems in order to infer drug-induced modulation of these pathways, which may predict late-onset phenotype *in vitro* and *in vivo*.

A pilot study of molecular phenotyping was published last year, as the cover story of the Cell Chemical Biology journal (2017 April Issue): [Molecular Phenotyping Combines Molecular Information, Biological Relevance, and Patient Data to Improve Productivity of Early Drug Discovery](https://www.sciencedirect.com/science/article/pii/S2451945617300995).

My colleagues and I work towards stronger integration of molecular phenotyping into drug-discovery pipelines. We envision further integration may leads to *molecular phenotypic drug discovery* that empowers both target-based and phenotype-based drug discovery processes.

In my opinion, there are three major components of molecular phenotypic drug discovery: 

* Computational phenotyping of drug candidates (integrative analysis of omics data such as transcriptomics,proteomics, pharmacogenomics, and drug-target information to predict cell-type specific phenotype of a drug candidate).
* Molecular Phenotyping, a real-world check to identify molecular-level mechanisms of drugs in both simple and advanced *in vitro* systems, including iPS-derived cells and organoids/organ-on-a-chip systems and alike.
* Pre-clinical safety studies and clinical trials.


In contrast to classical, linear drug-discovery pipelines, the ideal information flow in molecular phenotypic drug discovery is not one-directional, but rather circular. While computational phenotyping provides predictions for molecular phenotyping, and molecular phenotyping serves as surrogates of pre-clinical safety studies and clinical trials, information collected in downstream stages have to be fed back to upstream stages in order to continuously improve the process.

We are likely to face several challenges when promoting molecular phenotypic drug discovery.

* High-dimensionality of the optimization problem - the classic [von Neumann's elephant problem](http://blogs.sciencemag.org/pipeline/archives/2017/07/25/phenotypic-screening-the-state-of-the-art) as pointed out by Derek Lowe in his [*In the Pipeline* blog](http://blogs.sciencemag.org/pipeline/archives/2017/07/25/phenotypic-screening-the-state-of-the-art). 
* The variability associated with *in vitro* systems as well as with their predictability of *in vivo* needs rigorous testing and scrutinizing.
* We need an infrastructure that allows drug discovers making timely decisions, and deals with long-tail phenomena whereby there is lots of data on some compounds (targets, individuals, etc.) while little data on most compounds (targets, individuals, etc.). This was inspired by Michael Jordan's blog post [Artificial Intelligence — The Revolution Hasn’t Happened Yet](https://medium.com/@mijordan3/artificial-intelligence-the-revolution-hasnt-happened-yet-5e1d5812e1e7).

Some may argue that the idea of molecular phenotypic drug discovery is not new. Many people have tried and are trying to replace animal models with *in vitro* systems, and to integrate informatics systems into decision making. I think they are partially right. However, without the breath-taking progress in relevant fields in the last years, such as iPS-derived cells, next-generation sequencing, genome editing, and computational power, it would have been not feasible to setup such as pipeline with a competitive return-of-investment profile, which is necessary for practical use.

Molecular phenotyping is definitely not a magic bullet. It will be extremely challenging to model complex chemical-biological interactions that involve multiple organs using *in vitro* systems only. Much is unknown about the boundary of *invitro*-*in vivo* translation with regard to efficacy and safety prediction. The scarcity of data given the endless chemical *and* biological space will likely create huge hurdles when we try to build predictive models that are based on pattern recognition and machine learning. The list goes on and on. The point I want to make, however, is that without trying, we will not know the boundary; and even with very limited and humble efforts that we have spent in the last few years, we have realized that the boundary can be pushed, despite in a very slow and almost exhaustive way, and we even surprise ourselves every time about the things we learned about both disease and our molecules.

In short, molecular phenotyping will integrate chemical drug discovery and biological system understanding. The concept and applications will unlock the potential of novel *in vitro* cell systems to translate medicinal chemistry efforts into safe and efficacious drugs while replacing and reducing animal use.
