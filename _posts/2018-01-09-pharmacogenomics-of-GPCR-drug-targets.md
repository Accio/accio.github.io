---
layout: post
title:  Pharmacogenomics of GPCR Drug Targets
categories: bioinformatics
tags: pharmacology GPCR genetics pharmacogenomics
---

During the Christmas break I stumbled upon a very interesting paper published in *Cell*,  [Pharmacogenomics of GPCR Drug Targets](http://www.cell.com/cell/abstract/S0092-8674(17)31384-3) (open access). I liked the paper, because it points a way forward to personalised pharmacology and safety.

<a id="top"></a>

> [Summary](#summary)

> [Highlights](#highlights)

> [Thoughts](#thoughts)

> [Key facts](#keyfacts)

## Summary

<a id="summary"></a>
[Back to top](#top)

The study investigated the genetic variability of GPCR (G-protein coupled receptor) drug targets, an important class of targets, and their likely consequences.

The authors integrated multiple sources of genomics and genetics information to show that there is considerable variability in the genetic basis of GPCRs of individuals, with functional consequences that may alter individual patient's response to treatment. 

## Highlights
<a id="highlights"></a>
[Back to top](#top)

The comprehensive data integration performed by the authors is impressive. The sources of information includes:

+ The 1000 Genome Project
+ Exome Aggregation Consortium (ExAC)
+ FDA-approved drug list
+ Functional sites of GPCRs, derived from GPCR-ligand crystal structures, published literature, and experimentally validated post-translational modification sites (PTMs)
+ Experimental data on ligang-mutatnt GPCR interactions
+ Association studies between variants and altered drug response 
+ Experimental data of mu-opioid receptor and cholecystokinin A receptor demonstrating the association between genetic variance and variability in ligand affinity.
+ Drug prescription data and associated costs. This is also known as real-world data.

And to make the results accessible to the readers, the authors made the analysis and visualization available in the [GPCR database](http://www.gpcrdb.org).

## Thoughts

<a id="thoughts"></a>

[Back to top](#top)

As the authors wrote: 'While significant efforts are under way for generating large-scale information on genome variation, there is still a huge gap between generating such data and understanding the impact of genome variation'. This manuscript definitely contributes to closing the gap.

One limitation I see in this work is that the expression of the affected GPCRs is not assessed, and no _in vivo_ functional characterization is done. After all, there is possibility that GPCRs with missense variations or loss-of-function mutations will be over-expressed by feedback regulation, or their loss-of-function may be compensated by other mechanisms. Future work will likely cover these aspects.

The work also points to several potential extensions. One apparent next step is to expand the analysis to other pharmacological targets beyond GPCRs: kinases, ion channels, *etc*. 

GPCRs are particular interesting for scientists working on metabolic and cardiovascular diseases as well as neuroscience. Furthermore, similar analysis can be particularly interesting for two disease areas: 
+ **Oncology**, where somatic mutations and drug-induced mutations can be very relevant for the efficacy of the drugs.
+ **Infectious diseases**, where the mutation information of bacterial or viral genome has been traditionally monitored and used for the purpose of resistance surveillance, however little work has been done on the host gene side, as far as I know.  

On the drug discovery side, I wonder is it possible to establish pre-clinical models to incorporate genetic variability in the discovery pipeline? By using genetic tools like CPRISR-CAS9 and integrating information of efficacy- or safety-relevant genetic variants, it may be possible to predict individual patient's response to drugs already in the pre-clinical phase. The genetic variance information can then be used as biomarker in clinical development, too.



## Key facts

<a id="keyfacts"></a>

[Back to top](#top)

Below are some key facts quoted from the paper; feel free to jump over them if you are not interested in the numeric details. For people working with drug discovery, it may be an interesting and thought-invoking read: how much variability can we integrate into our discovery pipelines?
1. Analysis of data from the 1000 Genomes Project reveals that, on average, an individual harbors 68 missense variations within the coding region of one-third of the GPCR drug targets. 
  + Of these, an average of 8 variants per individual have previously known clinical associations with altered drug response
  + Analysis of 1,762 trios (father, mother, offspring) (Turner et al., 2017) revealed that 6 offsprings harbor at least one new *de novo* MV in a GPCR drug target. In other words, a new, non-lethal, missense, germline mutation in a GPCR drug target arises in 1 of every 300 newborns
2. Analysis with the data collected by the exome aggregation consortium (ExAC) reveals that 14192 missense variations (MVs) in 108 drug targets, with a mean of 128 rare (MAF < 1E-3) and 3.7 common (MAF >= 1E-3) variants per receptor.  
  + GPCR drug targets have, on average, a loss-of-function (LoF) mutation in 9.3 different positions per receptor.
  + The m-opioid receptor (MOR; OPRM1), targeted by analgesics, is one of the highly variable GPCR drug targets in the human population
3. Integrating the information about the extent of variability of GPCR targets with the FDA approved drugs revealed that several of the highly polymorphic
GPCRs are targeted by a large number of drugs. Thus, variation in GPCR drug targets may contribute to a substantial, and as yet underappreciated, variability in drug responses between individuals in the population.
4. Missense variations are found in the drug-binding pocket of several GPCR receptors, as well as in other functional sites that influence GPCR structure, dynamics, activation, allostery, and function.
5. On average, each receptor harbors at least one polymorphism in 23% of the known functional sites
6. The authors find that on average, 3.1% of the 2,504 individuals in the 1000 Genomes Project carry at least one allele with a missense variation in a known functional site in any given GPCR drug target
7. Drugs that are highly prescribed bind to receptors that are polymorphic within known and putative functional sites in the human population. The possible economic burden is presented in an interactive resource at [http://gpcrdb.org/mutational_landscape/economicburden](http://gpcrdb.org/mutational_
landscape/economicburden).


