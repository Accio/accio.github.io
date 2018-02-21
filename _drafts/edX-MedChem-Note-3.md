---
layout: single
title: edX Medicinal Chemistry - Chapter Three on protein structures
category: medchem
tags: 
  - medchem
  - edX
---

Chapter Three focuses on protein structures. From amino acids, via primary, secondary, and tertiary structure, up to quaternary structure and X-ray crystallography, our understanding of proteins' structures is underlying our ability to develop potent drugs.

## Amino acids and protein primary sequences

The contents are covered by most introductory texts of biochemistry. From a chemistry point of view, note that carbonyls in peptides are hydrogen bond acceptors while NHs (amides) are hydrogen bond donors.

## Secondary structure

Secondary structures are defined as regions of localized folding in the protein backbone, which include alpha-helix, beta-sheet, and random coils.

The quiz was to look up four PDB entries and find (1) maximum residue (amino acid) counts and (2) which molecule has the largest percentage of alpha helices.

An interesting resource introduced was [SCOP2](http://scop2.mrc-lmb.cam.ac.uk/front.html), or Structural Classification of Proteins 2. It classifies proteins with known structures by various ways, such as evolutionary relationships and structural relationships.

## Tertiary and quarternary structure

Tertiary structure is defined by the overall *spatial* arrangement of secondary structures within a protein. An example is [an adenosine deaminase with an inhibitor](https://www.rcsb.org/3d-view/3EWC/1).

Quaternary structure is defined by the aggregation structure formed by a complex of multiple proteins. An example is [human sigma alcohol dehydrogenase](https://www.rcsb.org/3d-view/1AGN/1).

## Determining protein structure

Two methods are commonly used to determine protein structure: X-ray crystallography, and nuclear magnetic resonance (NMR). X-ray is the method of choice: more than 85% of the structures in PDB are solved through X-ray.

In X-ray crystallography, the primary sequence of the protein is matched with the electron density map, and the individual amino acids are placed within the structures as closely as possible.

Once all the amino acids are positioned, the quality of the assigned structure can be measured by several tools. One of the most common tools is the [Ramachandran plot](https://en.wikipedia.org/wiki/Ramachandran_plot).

A Ramachandran plot visualizes the permissible regions on the psi-phi coordinate system, where *psi* is the dihedral angle of the C-C bond in the backbone of peptides, and *phi* is the dihedral angle of the (alpha-)C-N bond in the backbone. If a plot has too many outliers, namely too many residuals that fall out of the permissible regions (say >5%), the structure of the protein may be incorrectly assigned. Therefore, a Ramachandran plot is a simple, visual tool for quickly checking the validity of an assigned protein structure.


Given multiple structures of the same protein, outlier detection with Ramachandran plot can be a simple method to rank the quality of the structures. The fewer outliers outside of the permissible areas, the more likely that the structure is correct. An example is 1B57 is better than 1ZEN, though both depicting the structure of the protein 1,6-bisphophoate aldolase.

Note that random coils do not fall in disallowed regions of a Ramachandran plot.

As a rule of thumb, crystallographic structures used in drug discovery typically have a resolution of 2 Amstrongs or lower.

[A page on PCB](http://www.rcsb.org/pdb/static.do?p=software/software_links/analysis_and_verification.html) lists further tools than Ramachandran plots to analyze and verify protein structures.

### NMR versus X-ray

A solution-phase structure is available with NMR. Such a structure reflects the structure properties of a protein in a cellular context better than the solid-state structure derived from X-ray. However, this usually does not affect enzyme active sites because they are usually deep in the protein and are not significantly affected by changes in the enzyme's environment. Allosteric sites, however, are more prone to showing differences between the two approaches.

### Cryo-electron microscopy (Cryo-EM)

Cryo-EM can also be used to elucidate structures. It seems to be more effective for larger structures, and the structures are usually of a lower resolution than is available through X-ray. The course website pointed to an online database, [EMSearch](http://www.ebi.ac.uk/pdbe/emdb/searchForm.html/), which is dedicated to cryo-EM structures.


