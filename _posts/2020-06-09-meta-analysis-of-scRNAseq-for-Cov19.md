---
layout: post
title: Meta-analysis of single-cell RNA-sequencing studies for SARS-CoV-2
category: Biology
---

A preprint by [Muus *et
al.*](https://www.biorxiv.org/content/10.1101/2020.04.19.049254v2) reports a
large collaborative meta-analysis of more than hundred single-cell and
single-nucleus RNA-seq studies to characterize key proteins involved in
host-pathogen interactions of the SARS-CoV-2 virus that causes the COVID-19
pandemic. Here are my learning notes.

* TOC
{:toc}

## Major findings

The key proteins in focus include angiotensin-converting enzyme 2 ([ACE2, GeneID
59272](https://www.ncbi.nlm.nih.gov/gene/59272)), the main mediator of entry
into human cells by the SARS-Cov-2 virus, and two proteases, transmembrane
protease serine 2 ([TMPRSS2, GeneID
7113](https://www.ncbi.nlm.nih.gov/gene/7113)), and cathepsin L ([CTSL, GeneID
1514](https://www.ncbi.nlm.nih.gov/gene/1514)), both of which are proteases,
enzymes that break down other proteins, and both of which are believed to prime
and assist the cellular entry of the virus.

The expression patterns of *ACE2* mRNA and co-expression patterns between *ACE2*
and the proteases show concordance with tissues and organs associated with
pathology induced by SARS-CoV-2, including gut enterocytes, corneal epithelial
cells (the outermost layer of the cornea in the eye, see
[LifeMap](https://discovery.lifemapsc.com/in-vivo-development/eye/corneal-epithelium)),
cardiomyocytes (heart muscle cells), heart pericytes, olfactory sustentacular
cells (a type of supporting cells in the olfactory epithelium, [serving as
metabolic and physical support for the olfactory
epithelium](https://en.wikipedia.org/wiki/Olfactory_epithelium#Supporting_cells)),
and renal epithelial cells. The mRNA expression profiles of three genes are
positively associated with increasing age, male gender, and smoking, which are
epidemiologically linked to COVID-19 susceptibility and outcomes.

Another interesting finding is that some cells that show ACE2+TMPRSS2+
expression patterns in nasal, gut, and lung also express genes associated with
viral entry, immune function, and epithelial-macrophage cross-talk. Among them
are interleukin 6 (IL6), its receptor and co-receptor, IL1R, TNF response
pathways, and complement genes. The cell type specificity in the lung and
airways and smoking effects were conserved in mice.

## Methodologies

Here are some quick notes about the methodologies. They are not comprehensive
and may even be inaccurate. Please look up the original paper if needed.

* The authors searched Gene Expression Omnibus, and compiled expression profiles
    of more than two million cells from 469 samples from 64 distinct datasets.
    They also included unpublished studies.
* They used two levels of annotation, and used a PyTorch impelementation of the
  [Harmony algorithm (Korsunsky *et al.*, Nature Methods,
  2019)](https://www.nature.com/articles/s41592-019-0619-0), available at GitHub
  [lilab-bcb/harmoney-pytorch](https://github.com/lilab-bcb/harmony-pytorch), to
  generate cell clusters.
* Single-cell and single-nucleus RNA-sequencing data analysis with done with
  [Scanpy](https://github.com/theislab/scanpy).
* Co-expression of TMPRSS2 and CTSL with ACE2 was assessed with a *logistic*
  (e.g. binarized) linear effect model, with *ACE2* mRNA abundance as an
  independent variable and individuals as a random effect.
* Association with gender, age, and smoking status was assessed with a
  generalized effect model, using
  [statsmodels](https://github.com/statsmodels/statsmodels) and a Wald test from
  [Diffxpy](https://github.com/theislab/diffxpy).
* Single-cell ATAC-sequencing data was analysed with
  [timoast/signac](https://github.com/timoast/signac). I introduced
  ATAC-sequencing in a previous [blog
  post](https://accio.github.io/bioinformatics/2020/05/28/nucleosome-positioning-prediction.html#experimental-approaches-to-quantify-nucleosome-positioning)
  as an experimental approach to profile accessible chromatin regions. In this
  study, scATAC-sequencing data were used to support immune-like molecular
  phentoypes of epithelial cells that express ACE2.
* Random forest models were built with [sklearn](https://scikit-learn.org/) to
  distinguish double-positive from double-negative cells, and genes that build
  the trees are used as distinguishing features between the two types of cells.
* Networks were illustrated for visual purposes with
    [networkx](https://github.com/networkx/networkx).
* The code is available at
  [terra.bio](https://app.terra.bio/#workspaces/kco-incubator/COVID-19_cross_tissue_analysis).
* The data and interactive visualizations are available at [The Human Cell
    Atlas](https://singlecell.broadinstitute.org/single_cell?scpbr=hca-covid-19-integrated-analysis).

## Conclusions and reflections

Overall, the study suggests that cell type-specific expression of genes
mediating SARS-CoV-2 viral entry is consistent with disease pathology. Their
expression profiles and potentially other genes involved in immune response may
explain some aspects of COVID-19 epidemiology and clinical course.

Currently, we have no data of mRNA-protein abundance correlation of these genes
in the human body, in particular in patients affected by the virus. In addition,
the meta-analysis cannot provide an estimate of the variance of clinical
symptoms explained by the expression profile. Nevertheless, it is interesting to
observe the concordance between cell-type specific gene expression and
anatomical sites of disease manifest.

Furthermore, it can be envisioned that such analysis can empower further,
similar analysis that spans multiple tissues and organs which focus on genes
that interact to perform biological processes.

I thank Klas Hatje who discovered this preprint and shared it with me.

