---
layout: post
title: Lysyl oxidase mediates drug resistance in triple-negative breast cancer
category: Biology
---

[Saatci *et al.*](https://www.nature.com/articles/s41467-020-16199-4) report on
*Nature Communication* that targeting lysyl oxidase (LOX) overcomes drug
resistance in cellular and mouse models of triple-negative breast
cancer. Here are my learning notes.

**A statement of conflict of interest**: the last authors, Yasser Riazalhosseini
and Özgür Sahin, are my long-year collaborators. I am not involved in
the study any way though.

* TOC
{:toc}

## Paper outline

### What is lysyl oxidase (LOX)

Lysyl oxidase ([reviewed here](https://pubmed.ncbi.nlm.nih.gov/9524359/)) is an
enzyme of the class amine oxidase. It converts lysine into highly reactive
aldehydes that form cross-links in the extracellular matrix. It is induced by
hypoxia-induced factors, and its expression is reported higher in several cancer
types. Its inhibition has been suggested to abolish metastasis. The [Wikipedia
page](https://en.wikipedia.org/wiki/Lysyl_oxidase) of the gene summarizes some
of the findings.

### FN1/ITGA5 are higher expressed in doxorubicin-resistant cells

Saatci *et al.* used a xenograft mouse model of a human cancer cell line
(MDA-MB-231) to identify differentially expressed genes between cells that are
sensitive to doxorubicin, a chemotherapy agent, and cells that resistant. They
compared differential gene expression profiles derived from their experiment
with publicly available data of patients and found good concordance. From the
data, they observed that FN1 and ITGA5, which form a ligand-receptor pair in
integrin signalling, are positively regulated.

### Hypoxia response is induced in doxorubicin-resistant cells

It is believed that hypoxia-induced factors (HIFs) regulate integrin and focal
adhesion. They asked whether HIF induction is involved in the process. By
verifying the positive regulation of CA9, a known marker of HIF induction, they
accepted the hypothesis. Among genes modulated, they identified LOX as
particularly interesting because of its functions and its association with
metastasis that we introduced before.

### The HIF1A/ITGA5/FAK axis mediates drug resistance by extracellular remodelling

Next, they confirmed the regulation of LOX in this system by HIF1A. They mined
patient data to show that increased LOX expression is associated with shorter
relapse-free survival in chemotherapy-treated basal breast cancer patients but
not in other patients.

They went on to show that inhibition of LOX by [beta-aminopropionitrile,
BAPN](https://en.wikipedia.org/wiki/Aminopropionitrile) remodels extracellular
matrix (ECM) to confer sensitivity to chemotherapy. Targeting LOX or its
downstream signalling components FAK/Src reduced drug resistance *in vivo*.

### miR-142-3p may mediate sustained expression of LOX and ITGA5 in hypoxia

Finally, the authors identified one microRNA, miR-142-3p, that simultaneously
inhibits HIF1A, LOX, and ITGA5.

Since the microRNA is inhibited by HIF1A, HIF1A, miR-142-3p and LOX form a
feed-forward loop with consistent net outcomes: HIF1A induces LOX, at the same
time it inhibits miR-142-3p, which in turn inhibits LOX. Therefore, miR-142-3p
may mediate sustained induction of LOX upon HIF1A induction.

### Mechanistic understanding of how LOX may mediate drug-resistance

Our mechanistic understanding of how LOX may mediate drug resistance in
triple-negative breast cancer is captured in Figure 8 of the paper.

![Figure 8 of Saatci et
al.](/assets/images/202005-Saatci-Fig8.png){:.center-image}

## Conclusions and my impressions

I learned a lot from reading the paper, especially integrin and focal adhesion
signalling and its regulation by hypoxia, and regulation of extracellular matrix
modelling by LOX.

From the drug-discovery perspective, BAPN is not specific and potent enough. It
seems that it is more active against LOX-like genes including LOXL2 and LOXL3
than LOX itself (source:
[ChEMBL](https://www.ebi.ac.uk/chembl/g/#browse/activities/filter/molecule_chembl_id%3A(%22CHEMBL1618272%22%20OR%20%22CHEMBL1315165%22%20OR%20%22CHEMBL1255942%22))).
And it exposes considerable cytotoxicity. A better chemical tool is needed to
further validate the biological role and the potential of LOX as a drug target.

