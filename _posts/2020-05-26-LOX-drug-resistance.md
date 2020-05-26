---
layout: post
title: Lysyl oxidase mediates drug resistance in triple-negative breast cancer
category: Biology
---

[Saatci *et al.*](https://www.nature.com/articles/s41467-020-16199-4) report on
*Nature Communication* their finding that targeting lysyl oxidase (LOX)
overcomes drug resistance in mouse against models and cellular models of
triple-negative breast cancer. Here are my learning notes.

**Conflict-of-interest statement**: the last authors, Yasser Riazalhosseini and
Oezguer Sahin, are my long-year collaborators.

Lysyl oxidase ([reviewed here](https://pubmed.ncbi.nlm.nih.gov/9524359/)) is an
enzyme of the class amine oxidase. It converts lysine into highly reactive
aldehydes that form cross-links in the extracellular matrix. It is induced by
hypoxia-induced factors, and its expression is reported higher in several cancer
types. Its inhibition has been suggested to abolish metastasis. The [Wikipedia
page](https://en.wikipedia.org/wiki/Lysyl_oxidase) of the gene summarizes some
of the findings.

Saatci *et al.* used a xenograft mouse model of a human cancer cell line
(MDA-MB-231) to identify differentially expressed genes between cells that are
sensitive to doxorubicin, a chemotherapy agent, and cells that resistant. They
compared differential gene expression profiles derived from their experiment
with publicly available data of patients and found good concordance. From the
data, they observed that FN1 and ITGA5, which form a ligand-receptor pair in
integrin signalling, are positively regulated.

It is believed that hypoxia-induced factors (HIFs) regulate integrin and focal
adhesion. They asked whether HIF induction is involved in the process. By
verifying the positive regulation of CA9, a known marker of HIF induction, they
accepted the hypothesis. Among genes modulated, they identified LOX as
particularly interesting because of its functions and its association with
metastasis that we introduced before.

Next, they confirmed the regulation of LOX in this system by HIF1A. They mined
patient data to show that increased LOX expression is associated with shorter
relapse-free survival in chemotherapy-treated basal breast cancer patients but
not in other patients.

They went on to show that inhibition of LOX by [beta-aminopropionitrile,
BAPN](https://en.wikipedia.org/wiki/Aminopropionitrile) remodels extracellular
matrix (ECM) to confer sensitivity to chemotherapy. Targeting LOX or its
downstream signalling components FAK/Src reduced drug resistance *in vivo*.
Finally, they identified one microRNA, miR-142-3p, that simultaneously inhibits
HIF1A, LOX, and ITGA5. Since it is inhibited by HIF1A, miR-142-3p may
mediate sustained induction of LOX upon HIF1A induction.

Our mechanism understanding of how LOX may mediate drug resistance in
triple-negative breast cancer is captured in Figure 8 of the paper.

![Figure 8 of Saatci et
al.](/assets/images/202005-Saatci-Fig8.png){:.center-image}

I learned a lot from reading the paper. From the drug-discovery perspective,
BAPN is not specific and potent enough. It seems that it is more active against
LOX-like genes including LOXL2 and LOXL3 than LOX itself (source:
[ChEMBL](https://www.ebi.ac.uk/chembl/g/#browse/activities/filter/molecule_chembl_id%3A(%22CHEMBL1618272%22%20OR%20%22CHEMBL1315165%22%20OR%20%22CHEMBL1255942%22))).
And it exposes considerable cytotoxicity. A better chemical tool is needed to
further validate the biological role and the potential of LOX as a drug target.

