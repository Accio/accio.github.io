---
layout: page
title: Software
permalink: /software
author_profile: true
---

Here is a collection of the software that I developed:

## [ribiosUtils](https://cran.r-project.org/web/packages/ribiosUtils/index.html)

[ribiosUtils](https://cran.r-project.org/web/packages/ribiosUtils/index.html) is a R package that provides interface to the Bioinfo-C (internal name: BIOS) library and utilities. 'ribiosUtils' is a swiss-knife for computational biology in drug discovery, providing functions and utilities with minimal external dependency and maximal efficiency.

I develop and maintain this software package in memory of Clemens Broger.

## [KEGGgraph](https://www.bioconductor.org/packages/release/bioc/html/KEGGgraph.html)

[KEGGgraph](https://www.bioconductor.org/packages/release/bioc/html/KEGGgraph.html) is an interface between KEGG pathway and graph object as well as a collection of tools to analyze, dissect and visualize these graphs. It parses the regularly updated KGML (KEGG XML) files into graph models maintaining all essential pathway attributes. The package offers functionalities including parsing, graph operation, visualization and etc.

## [BioQC](https://www.bioconductor.org/packages/release/bioc/html/BioQC.html)

[BioQC](https://www.bioconductor.org/packages/release/bioc/html/BioQC.html) performs quality control of high-throughput expression data based on tissue gene signatures. It can detect tissue heterogeneity in gene expression data. The core algorithm is a Wilcoxon-Mann-Whitney test that is optimised for high performance.

## [RTCA](https://www.bioconductor.org/packages/release/bioc/html/RTCA.html)

Import, analyze and visualize data from Roche(R) xCELLigence RTCA systems. The package imports real-time cell electrical impedance data into R. As an alternative to commercial software shipped along the system, the Bioconductor package RTCA provides several unique transformation (normalization) strategies and various visualization tools.

## [RpsiXML](https://www.bioconductor.org/packages/release/bioc/html/RpsiXML.html)

[RpsiXML](https://www.bioconductor.org/packages/release/bioc/html/RpsiXML.html) queries, data structure and interface to visualization of interaction datasets. This package inplements the PSI-MI 2.5 standard and supports up to now 8 databases. Further databases supporting PSI-MI 2.5 standard will be added continuously.

## [rqubic](https://www.bioconductor.org/packages/release/bioc/html/rqubic.html)

[rqubic](https://www.bioconductor.org/packages/release/bioc/html/rqubic.html) implements the QUBIC algorithm introduced by Li et al. for the qualitative biclustering with gene expression data.

## [ddCt](The ddCt Algorithm for the Analysis of Quantitative Real-Time PCR (qRT-PCR))

The Delta-Delta-Ct (ddCt) Algorithm is an approximation method to determine relative gene expression with quantitative real-time PCR (qRT-PCR) experiments. Compared to other approaches, it requires no standard curve for each primer-target pair, therefore reducing the working load and yet returning accurate enough results as long as the assumptions of the amplification efficiency hold. The ddCt package implements a pipeline to collect, analyse and visualize qRT-PCR results, for example those from TaqMan SDM software, mainly using the ddCt method. The pipeline can be either invoked by a script in command-line or through the API consisting of S4-Classes, methods and functions.
