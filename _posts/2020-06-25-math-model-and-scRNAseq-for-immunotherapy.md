---
layout: post
title: Mathematical modelling and single-cell RNA sequencing for cancer immunotherapy
category: Bioinformatics
---

[Griffiths *et al.*](https://www.pnas.org/content/early/2020/06/19/1918937117)
reported on *PNAS* their effort of profiling peripheral immune cell abundance
in time series following treatment of immunotherapy in a small clinical trial. I found the study interesting and here are my learning notes.

The authors used mathematical modelling to characterize cell-cell interactions and used single-cell omics data to reveal immune cell abundance, pathway activity patterns, and differentiation status, which are associated with cell-cell interactions. The study presents an interesting case study that integrates cellular and omics level modelling and organ and system level modelling.

I found the following approaches taken by the authors particularly interesting from a methodological point of view:

* The authors used a Gaussian process latent variable model to characterize tumour burden, based on clinical diagnosis and biomarker data.
* They used a system of ordinary differential equations (ODEs) to characterize treatment effect on immune and cancer cells.
* They used manual and machine-leaning based cell type annotation, single-cell gene-set enrichment analysis (GSEA), and pseudotime analysis to analyse immune cell abundance, pathway activity patterns, and differentiation status.

I enjoyed reading the paper and liked it for two reasons particularly. On the biological side, the results suggest that peripheral blood phenotypes can be used as biomarker of patient responsiveness to therapy (though probably we can use simpler, cheaper, and faster methods than scRNA-sequencing). On the modelling side, I liked the approach to use machine learning and statistical techniques to link macroscopic findings, such as tumour size and biomarker data, with cellular findings, including single-cell RNA-sequencing and flow cytometry.

While the immune cell abundance, pathway activity patterns, and differentiation status show difference between responders and non-responders of gastrointestinal tumour patients to immune checkpoint (anti PL-1) therapy, I could not pin down the causal gene, interaction, or cell type that we can experimentally manipulate in order to turn non-responders to responders. 

We may be asking for too much if we would expect the paper to come up with such hypotheses and test them. Apparently, though, such a silver bullet, if existing, would interest many people. Until then, I think the integration of mathematical modelling and single-cell omics data is interesting enough so that we may see similar applications of such approaches.
