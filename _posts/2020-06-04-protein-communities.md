---
layout: post
title: Probing protein communities with mass spectrometry
category: DrugDiscovery
tags: proteomics review
---

Budayeva and Kirkpatrick argue in their review [*Monitoring protein communities
and their responses to
therapeutics*](https://www.nature.com/articles/s41573-020-0063-y) (Nature
Reviews Drug Discovery, 2020) that mass spectrometry help us decipher complex
relations between protein communities and understand how disease and drug
influence them.

* TOC
{:toc}

## Protein communities

I understand the term &lsquo;protein communities&rsquo; as a generalized term of
gene-gene interaction, such as direct protein-protein interaction, two proteins
being co-regulated, or simply co-localized. The authors define a protein
community as *a set of proteins within a cell that are interconnected through
one or more physical, spatial, co-regulatory or functional relationships*.
Though apparently extracellular protein-protein interactions may be considered
as well.

## Experimental approaches to study proteomics

Mass spectrometry has been used in drug discovery mainly for following purposes:

* Global proteome profiling: estimating abundance of all proteins that can be
    measured.
* PTM profiling: understanding post-translational modifications (PTMs), for
    instance to understand the mechanism of drug resistance or to elucidate
    signalling events following target engagement.
* Activity-based protein profiling (ABPP): a technology that uses chemical
    probes that react with enzymes. The probe consists of two elements most of
    the time: a reactive group (known as a &lsquo;warhead&rsquo;), and a tag.
    Sometimes the probe may contain a binding group that enhances selectivity.
    The warhead contains a electrophile which becomes covalently linked to a
    nucleophilic residue in the active site of an active enzyme. If the enzyme
    is inhibited or post-translationally modified on the residue targetted by
    the probe, it will not react with the probe. The technique, when used in
    combination with mass spectrometry, can reveal for instance the selectivity
    of a kinase inhibitor.
* Chemoproteomics studies: proteomics studies using chemical probes to reveal
    small-molecule-protein interactions.

The authors highlighted a few approaches for disease understanding and drug
discovery. They include affinity purification, proximity labelling, organelle
proteome profiling, PTM profiling, chemoaffinity enrichment, and thermal
proteome profiling.

* Affinity purification, also known as immunoaffinity purification, identifies
    protein interactions by antibody-mediated isolation of a target protein with
    its interaction partners.
* Proximity labelling, as its name suggests, labels a protein with a reactive
    substrate so that proteins in proximity are captured by affinity
    purification. It can capture transient and functional interactions.
* Organelle proteome profiling identifies spatial protein distribution and
    expression patterns of proteins enriched in organelle fractions.
* Post-transcriptional modification (PTM) profiling enriches and quantifies
    modified peptides (for instance phosphorylated peptides). It offers
    information of physical interaction, spatial interaction, and co-regulatory
    interaction.
* Chemoaffinity enrichment uses a chemical tool compound (for instance a kinase
    inhibitor) to profile biochemical activities of proteins in the presence and
    absence of a drug (for instance another kinase inhibitor of interest). The
    competitive binding of two compounds to proteins offers information about
    expression levels, activity, and affinity of an isolated enzyme for the
    drug.
* Thermal proteome profiling uses the fact that protein thermal stability
    changes upon configuration change induced by binding to specific binding
    partners such as small molecules. It can be used for target identification.

## Practical considerations

The authors listed many examples, such as ERBB/EGFR receptors, GPCRs, and PD-L1,
to illustrate the use of proteomics in disease understanding for drug
mechanism-of-aciton investigation.

The authors discussed common methods of quantification in mass
spectrometry-based proteomics. They also suggested that it is necessary to
optimize time courses and compound concentration of proteomics experiment on the
basis of the model system and on the biological activity of the drug. For RTK
(receptor tyrosine kinase)-mediated phosphorylation events, detection can be
done seconds after stimulation, but typically profiling is done within 2-10
minutes after ligand binding. Lysine acetylation and ubiquitylation can also be
observed in the range of minutes. TNF-mediated NF-kB translocation happen in
waves after 1, 3 an 6h.

## Outlook

The authors believe that future progress is expected in *in vivo* proteomics,
automation, stoichiometric relationships between proteins, and improve proteomic
methods for low-level clinical samples. For drug discovery, connecting protein
communities with phenotypes is important, for instance by using proteomics to
understand the full sequence of events following target engagement and the
connections of these events to efficacy, adverse effects, and resistance.

## Conclusions

The paper summarizes diverse applications of mass-spectrometry proteomics in
disease understanding, and possibilities of using them to elucidate mechanisms
of action of drugs on the protein level.

The paper is already comphrehensive. Nevertheless, I would love to see more
industrial examples of using proteomics to guide leade identification,
optimization, and selection. In addition, probably due to the length limitation,
the review does discuss analysis of preoteomics data in detail. Interested users
may find the review [*Bioinformatic analysis of proteomics data* by Schmidt *et
al.*](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4108846/) and the publication
[*An Assessment of Software Solutions for the Analysis of Mass Spectrometry
Based Quantitative Proteomics Data* by Müller *et
al*.](https://doi.org/10.1021/pr700758r) informative and complementary to this
review.

P.S. Some interesting statistics:

* A single human cell contains an estimated 10 billion (10 to the power of 10)
  individual proteins.
* Protein abundance ranges from one to upward of 10 million copies per cell.

