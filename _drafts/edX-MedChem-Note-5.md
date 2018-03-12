---
layout: single
title: edX Medicinal Chemistry - Chapter Five on Receptors
category: medchem
mathjax: true
tags: 
  - medchem
  - edX
---

Chapter five discusses various aspects of receptors as drug targets, such as classification, ligands, and the occupancy theory.

## Receptor types

Major receptor superfamilies are introduced:

* Ligand-gated ion channels
* G-protein coupled receptors
* Tyrosine kinase-linked receptors: ligand binding causes receptor dimers
* Nuclear receptors: not membrane bound and located in nucleus

## Ligands

Four types of ligands:

* Full agonists, which arose full response of the receptor. Different full agonists can be compared by $$ \textrm{log}EC_{50} $$.
* Partial agonists, which arose only partial response of the receptor. Partial agonists tend to bind to the same position as the full aognists; therefore they often compete with each other. Partial agonists may even supress the response to full agonists.
* Antagonists, the efficacy of which can be compared by $$ \textrm{log}IC_{50} $$.
* Inverse agonists, which inhibits the constituent activity of the receptor. Cannabinoid receptors are examples of constitutively active receptors.

Two types of antagonist, *competitive* and *noncompetitive*, are distinguished. The first type binds to the same site as the agonist, while the second type binds to an allosteric site.

## Occupancy theory

Clark's occupancy theory is introduced, in the center of which lies $$\textrm{Binding}=\textrm{Response}$$.

Clark's equation:
$$ \frac{E}{E_{max}} = \frac{[L]}{K_D+[L]} $$
, where 
$$ K_D = \frac{[R][L]}{[R-L} $$.

At $$ EC_{50} $$, $$[R-L]=[R]$$, and therefore $$ K_D=[L]=EC_{50} $$.

Unfortunately, Clark's occupancy theory cannot explain all receptors. Exceptions include:

* Constituent activity
* Spare receptors
* Desensitization due to feedback downregulation of the receptor

Alternative theories include the residence time: longer residence time equals greater effect. $$\tau = 1/k_{off}$$: the larger the value is, the greater the effect will be. An example is lapatinib, which has though lower $K_i$ but much longer $$\tau$$.

## Efficacy and potency

*Efficacy* and *potency* are two similar terms with distinct meanings in medical chemistry.

In the context of occupancy theory, efficacy is related to the ability of a molecule to impact a biological pathway.  For an agonist, the molecule activates a pathway.  Potency refers to the concentration at which the impact occurs.  Efficacy is related to $$E_{max}$$.  $$K_D$$ is related to a molecule's potency.

From a drug discovery viewpoint, a promising molecule should be both potent and efficacious.  In other words, a promising molecule, should have as low a value as possible for $$K_D$$, meaning the molecule causes its response at very low concentrations.  Such a molecule will be potent.  A promising molecule should also show efficacy with a high value for $$E_{max}$$, signifying that it can elicit a nearly maximum response from a receptor.

## Terms

* $$ EC_{50} $$ applies to agonists and partial agonists (*E* stands for effect)
* $$ IC_{50} $$ applies to antagonists and inverse agonists (*I* stands for inhibition)
* Recall the Cheng-Prussoff equation, $$ IC_{50} $$ values are usually not comparable between each other, however $$ K_i $$ is. The conversion is given by $$ K_i = \frac{IC_{50}}{1+\frac{[L]}{K_D}} $$.
