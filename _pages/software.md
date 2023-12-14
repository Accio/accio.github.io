---
layout: page
title: Software
permalink: /software
author_profile: true
---

Here is a selection of the scientific software that I developed, often with help
and support of many other colleagues. More open-source software can be found in
my Github account [Accio](http://github.com/Accio) as well as the public Github
account of my team [BEDApub](http://github.com/BEDApub).

#### [BESCA](https://github.com/bedapub/besca)

The [BESCA](https://github.com/bedapub/besca) package in Python was developed by team members of the Bioinformatics and Exploratory Data Analysis team to support single-cell omics data analysis. It is particularly useful in translational studies: the analysis with BESCA has informed key decisions in multiple pre-clinical and clinical projects.

#### [BioQC](https://www.bioconductor.org/packages/release/bioc/html/BioQC.html)

[BioQC](https://www.bioconductor.org/packages/release/bioc/html/BioQC.html) performs quality control of high-throughput expression data based on tissue gene signatures. It can detect tissue heterogeneity in gene expression data. The core algorithm is a Wilcoxon-Mann-Whitney test that is optimised for high performance.

#### [ddCt](The ddCt Algorithm for the Analysis of qRT-PCR, or quantitative real-time PCR)

The Delta-Delta-Ct (ddCt) Algorithm is an approximation method to determine relative gene expression with quantitative real-time PCR (qRT-PCR) experiments. Compared to other approaches, it requires no standard curve for each primer-target pair, therefore reducing the working load and yet returning accurate enough results as long as the assumptions of the amplification efficiency hold. The ddCt package implements a pipeline to collect, analyse and visualize qRT-PCR results, for example those from TaqMan SDM software, mainly using the ddCt method. The pipeline can be either invoked by a script in command-line or through the API consisting of S4-Classes, methods and functions.

#### [HBVouroboros](https://github.com/bedapub/HBVouroboros)

*HBVouroboros* is written in Python and implements a Snakemake-based workflow to map Illumina RNA-sequencing reads to HBV cccDNA. It offers following functionalities: (a) mapping reads to reference genomes of of eight major HBV genotypes (A-H). (b) *de novo* assembly of the HBV genome, (c) inference of the reference strain from which the reads are likely generated and the genotype, and (d) reporting base-level, gene-level, and HBV-genome-level quantification of read counts, as well as structural variants with regard to the inferred reference strain.

#### [Kinex](https://github.com/bedapub/kinex)

[Kinex](https://github.com/bedapub/kinex) infers causal serine/threonine kinases from phosphoproteomics data. Kinex users can score kinase-substrate interactions, perform enrichment analysis, visualise candidates of causal regulators, and query similar profiles in a database of drug-induced kinase activities.

The software was mainly developed by Alexandra Valeanu, an intern sponsored by Roche Advanced Analytics Network (RAAN).

#### [KEGGgraph](https://www.bioconductor.org/packages/release/bioc/html/KEGGgraph.html)

[KEGGgraph](https://www.bioconductor.org/packages/release/bioc/html/KEGGgraph.html) is an interface between KEGG pathway and graph object as well as a collection of tools to analyze, dissect and visualize these graphs. It parses the regularly updated KGML (KEGG XML) files into graph models maintaining all essential pathway attributes. The package offers functionalities including parsing, graph operation, visualization and etc.

#### [ribiosUtils](https://cran.r-project.org/web/packages/ribiosUtils/index.html)

[ribiosUtils](https://cran.r-project.org/web/packages/ribiosUtils/index.html) is a R package that provides interface to the Bioinfo-C (internal name: BIOS) library and utilities. 'ribiosUtils' is a swiss-knife for computational biology in drug discovery, providing functions and utilities with minimal external dependency and maximal efficiency.

I develop and maintain this software package in memory of Clemens Broger.

#### [RpsiXML](https://www.bioconductor.org/packages/release/bioc/html/RpsiXML.html)

[RpsiXML](https://www.bioconductor.org/packages/release/bioc/html/RpsiXML.html) queries, data structure and interface to visualization of interaction datasets. This package inplements the PSI-MI 2.5 standard and supports up to now 8 databases. Further databases supporting PSI-MI 2.5 standard will be added continuously.

#### [rqubic](https://www.bioconductor.org/packages/release/bioc/html/rqubic.html)

[rqubic](https://www.bioconductor.org/packages/release/bioc/html/rqubic.html) implements the QUBIC algorithm introduced by Li et al. for the qualitative biclustering with gene expression data.

#### [RTCA](https://www.bioconductor.org/packages/release/bioc/html/RTCA.html)

Import, analyze and visualize data from Roche(R) xCELLigence RTCA systems. The package imports real-time cell electrical impedance data into R. As an alternative to commercial software shipped along the system, the Bioconductor package RTCA provides several unique transformation (normalization) strategies and various visualization tools.

