---
layout: post
title: edX Medicinal Chemistry - Chapter Four on enzymes
category: medchem
mathjax: true
tags: 
  - medchem
  - edX
---

Chapter four sheds lights on enzymes, which represents a large class of targets of small-molecules.

## Michaelis-Menten kinetics

This part is covered well by biochemical introductory texts. It is essential to fully understand (one form of) the Michaelis-Menten equation:

$$ V = \frac{V_{max} \times [S]}{K_m+[S]} $$

where $$ V $$ represents **v**elocity of the reaction, $$ [S] $$ represents the concentration of the **s**ubstrate, and $$ K_m $$ represents the Michaelis-Menten constant, which equals the substrate concentration at which $$ V $$ reaches half of $$ V_{max} $$, which represents half of the theoretically maximum velocity of the reaction.

Once this equation is understood, its linear transformation, the Lineweaver-Burk equation, is easy to understand:

$$ \frac{1}{V} = \frac{K_m}{V_{max}} \times \frac{1}{[S]} + \frac{1}{V_{max}} $$

## Enzynmic inhibitors

Drug-mediated enzymic inhibition is mostly reversible. We differentiate between three types of reversible inhibition:

* Competitive inhibition
* Noncompetitive inhibition
* Uncompetitive inhibition

### Competitive inhibition

The inhibitor binds to the active site of the enzyme in competitive inhibition. In competitive inhibition, $$ V_{max} $$ is unchanged but $$ K_m $$ increases.

### Noncompetitive inhibition

The inhibitor binds to an *allosteric* site, namely a site other from the active site which nevertheless has a regulatory role of the enyzmic function. Note that in noncompetitive inhibition, the inhibitor can bind both the enzyme and the enzyme-substrate complex. This can modulate the enzymic conversion from the substrate to the product. 

In noncompetitive inhibition, as the inhibitor's concentration increases, $$ V_{max} $$ decreases. At the same time, however, $$ K_m $$ remains constant, because a noncompetitive inhibitor does not affect the affinity of the enzyme for the substrate - it just reduces what $$ V_{max} $$ maximally can be.

### Uncompetitive inhibition

An uncompetitive inhibitor binds only to the enzymic-substrate complex, which reudces both $$ V_{max} $$ and $$ K_m $$.

### A short summary of reversible inhibitors

*E* stands for enzyme, *ES* stands for enzyme-substrate complex.

|---
| Type | Binding target | $$ V_{max} $$ | $$ K_m $$ 
| - | - | - | -
| Competitive inhibitor | Active site of E | Unchanged | Increased
| Noncompetitive inhibitor | Allosteric site of E | Decreased | Unchanged
| Uncompetitive inhibitor | ES | Decreased | Decreased

### Irreversible inhibitors

Irreversible inhibitors will chemically react with the enzyme and covalently bind to it. Off-target effects of such inhibitors may cause side effects and other problems. However, recently attentions have also been paid to such inhibitors, especially in certain settings such as oncology and infectious disease. For instance, [suicide inhibition](https://en.wikipedia.org/wiki/Enzyme_inhibitor#Examples_of_irreversible_inhibitors) happens when the enzyme converts the inhibitor into a reactive form in its active site.

## Enzymic inhibition

Two types of measures were introduced: $$ IC_{50} $$ and $$ K_i $$.

### IC50

$$ IC_{50} $$ is the concentration at which the reaction velocity is at half of $$ V_{max} $$.

### Ki

$$ K_i $$ is a constant that is independent of how the experiment is performed. It can be determined by the following equation.

$$ K^{obs}_m = \frac{K_m}{K_i}[I] + K_m $$

where $$ [I] $$ represents the inhibitor's concentration, and $$ K^{obs}_m $$ is the observed $$ K_m $$ that is modulated by the inhibitor.

One apparent advantage of using $$ K_i $$ over using $$ IC_{50} $$ is that while $$ IC_{50} $$ depends on the concentration of substrate, $$ K_i $$ remains constant irrespective of the substrate's concentration. Therefore $$ K_i $$ is sometimes perceived as a more rigorous measurement of enzyme inhibition.

### Cheng-Prussoff equation

$$ K_i $$ and $$ IC_{50} $$ can be converted to each other by the Cheng-Prussoff equation:

$$ K_i = \frac{IC_{50}}{1 + \frac{[S]}{K_m}} $$ 

It is obvious that $$ K_i $$ is positively correlated with $$ IC_{50} $$ when $$ [S] $$ and $$ K_m $$ is fixed. Therefore lower $$ K_i $$ values, similar with lower $$ IC_{50} $$ values, are associated with more potent compounds.

### Further notes on Ki and IC50

Often $$ K_i $$ is reported as $$ \textrm{p}K_i $$ ($$ -\textrm{log} K_i $$), and similarly  $$ IC_{50} $$ as $$ \textrm{p}IC_{50} $$ ($$ -\textrm{log} IC_{50} $$).

Only $$ K_i $$ values can be directly compared between each other; two $$ IC_{50} $$ values should not be directly compared unless they are obtained under identical experimental conditions.
