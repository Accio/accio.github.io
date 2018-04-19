---
layout: single
title: edX Medicinal Chemistry - Chapter Six on Blood and Drug Transport
category: medchem
mathjax: true
tags: 
  - medchem
  - edX
---

Module three consists of chapter six (blood and drug transport) and chapter seven (pharmacokinetics). This module deals with the absorption and distribution of small-molecule drugs. While the previous modules were more about biochemistry, physical chemistry seems to be more relevant for this module.

Module three is closely related with module four, which is about metabolism of the drugs.

## Blood

Understanding blood is important for drug discovery for two reasons: (1) blood is the vehicle to transport drugs within the body, and (2) blood is often used to determine drug concentration in the body.

A 70-kg human has an approximate blood volume of 5L.

Roughly speaking the blood consists of red blood cells (~45%), white blood cells (~1%), and the blood plasma (~54%) that contains high concentrations of proteins, electrolytes, hormones, *etc*.. Hits can be screened with plasma to downprioritise compounds that bind strongly to blood proteins and prioritise compounds that bind less.

A few numbers of a 70-kg patient
* Whole blood: 5L
* Plastma 2.7L
* Interstitial fluid, liquid that sits between the cells of the body, 10L.
* Intracellular fuild, the total water found in the body, which includes the cellular volume of the whole blood, 25L. Only drugs that can cross a cell membrane will have access to the intracellular fluid.
* Total body water, 38L
* Body volume, approximately 70L

Proteins that are extensively high expressed in plasma may bind drug and therefore reducing concentration of drug that reaches the desired target. Examples include
* Albumin (~5% weight of blood), which binds particularly strongly to acid drugs such as warfarin and ibuprotein (>99%)
* Globulins (~2.5% weight of blood). $$ \alpha_{1} $$-acid glyocoprotein tends to bind basic drugs, such as disopyramide and lidocaine (~70%)

## ADME

* Absoprtion: from administration point to the blood.
* Distribution: drug transport to its target and from its target.
* Metabolism: chemical modification of a drug, mostly in liver. Drugs go through the *hepatic portal system* to liver, where the *first pass effect* takes place. This has consequences on the bioavailability of drugs. 
* Excretion: waste removal, which mostly happens in kidney.

### Lipinski's rules

Developed by Chris Lipinski of Pfizer in 1997, Lipinski's rules predict whether a molecule is able to diffuse across membranes so that they can be absorbed from the digestive tract and enter the blood stream. These rules are also known as *Rule of Five*.

* Molecular weight (MW) less than 500
* Lipophilicity (logP) less than 5
* Hydrogen bond acceptors (HBA) less than 10
* Hydrogen bond donors (HBD) less than 5.

LogP, developed by the late Corwin Hansch, is a measure of lipophilicity, which is defined by the base-10 algorithm of an equilibrium constant (*P*) for the partitioning of a drug in a biphasic system of 1-octanol (non-polar) and water (polar). A molecule that is preferentially solved in 1-octanol (logP>5) is too lipophilic to adequately dissolve in digestive fluids.

clogP stands for *calculated* logP based on chemical structures.

HBA are mostly oxygen and nitrogen atoms in the structure, because they have lone pairs. Exceptions are lone pairs that are extensively involved in resonance. For instance amide nitrogens in amino acids, and nitrogens in aromatic rings. 

The number of HBDs is determined by the number of O-H and N-H bonds in the structure.

### Predictability of logP

LogP can be estimated by decomposing molecules into subunits, calculating the contribution of each subunit, and summing the contributions up. Apparently, more elaborated machine-learning algorithms can be used; nevertheless the basic idea is the same: break down and sum up.

An exercise in the course was to use a linear model to estimate the contribution of methylene (CH2) group to the lipophilicity. An answer can be found on in [my Rmarkdown document hosted on github](https://github.com/Accio/sandbox/blob/master/2018-02-MedChem/chapter6-logP-exercise.Rmd).
