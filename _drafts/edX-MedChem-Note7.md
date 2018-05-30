---
layout: single
title: edX Medicinal Chemistry - Chapter Seven on Pharmacokinetics
category: medchem
mathjax: true
tags: 
  - medchem
  - edX
  - pharmacokinetics
---


The chapter on pharmacokinetics covers following topics:

* IV Bolus - $$ C_{p} $$ versus time
* Clearance
* Volume of distribution
* Oral delivery

The key learning is the mathematical relationships between drug concentration in the plasma and time for both IV and oral drugs, as well as how clearance and volume of distribution determine the half-life of a drug.

# Pharmacokinetics

Plasma concentration is often fit to the ideal, expotential decay model, $$ C_p = {C_p}^0e^{-k_{el}t} $$. $$ k_{el} $$ is known as elimination rate constant and has units of 1/time.

Mathematically it is clear that $$ k_{el} $$ is associated with the half-life of the drug, $$ t_{1/2} $$, which equals $$ ln2/k_{el} $$. Note that the half-life is constant as soon as the concentration is halfed: it is identical between changes from 50% to 25%, and changes from 24% to 12%. 

GThe linear form of the equation, $$ lnC_p = -k_{el}t + ln{C_p}^0 $$, can be convenient to use.

Elimination rate constant is determined by clearance and volume of distribution, namely $$ k_{el}=\frac{CL}{V_d} $$. $$ CL $$, clearance, is the volume of clearance per time unit. $$ V_d $$ is the apparent volume of distribution.

In clinics, $$ C_p $$ is determined by drawing blood samples from a patient. The whole blood is centrifuged to remove the cells from the plasma, and drugs are normrally extacted from plasma to increase drug concentration and to improve detection sensitivity and reproducibility. The analysis of the drug involves methods such as high-performance liquid chromatography (HPLC) and a spectrophotometric detection method, normally UV-VIS spectrometry.

# Clearance

Clearance is the process of removing drug from the bloodstream. Since elimination is a combination of both metabolism and excretion, and in most cases they happen in liver and kidney, respectively, therefore the elimination rate constant $$ k_{el} $$ is driven by hepatic metabolism and renal excretion.

Blood flows through an organ (denoted as *Q*) and a fraction of the drug in that blood is removed by the organ (extraction ratio, denoted as *E*). Through the action of blood flow and drug removal, the drug is cleared from the blood stream and the plasma concentration of the drug $$ C_p $$ decreases over time.

Therefore, total clearance $$ CL_{T} $$ can be expressed as $$ CL_{T}=Q_{R}E_{R}+Q_{H}E_{H} $$, where *R* and *H* stands for *renal* and *hepatic*, respectively.

For an average 70-kg human, blood flow values are known:
* Blood flow to the liver is approximately 1,500 mL/min ($$ Q_{H} = 1,500 mL/min $$).
* Blood flow to the kidney is approximately 1,100 mL/min, however the kidneys only filter at a rate of approximately 220 mL/min ($$ Q_{R} = 220 mL/min $$).

For drugs that are not excreted by kidneys, hepatic extraction ratio $$ E_{H} $$ can be estimated from bioavailability, $$ F $$, which is defined as the fraction of a drug that is absorbed from the digestive system and into the blood stream.

When calculating clearance, it is important to notice the difference between plasma volume and whole-blood volume. Plasma consists of about 54% of the whole-blood volume.

# Area Under Curve (AUC)

AUC is the total exposure of drug in plasma, or mathematically, integrated plasma concentration over time. 

AUC can be either estimated by integration of the exponential function $$ C_{p} = {C_{p}}^0e^{-k_{el}t} $$, which gives $$ \textrm{AUC} = \frac{C_{p}^0}{k_{el}} $$, or by the trapezoid rule, which is a discrete integration of the trapezoids (梯形 in Chinese) formed by measured points ($$ C_p $$) and estimated/extrapolated points/AUCs ($$ {C_p}^0 $$ and the area-under-curve beyond the last point).

Why AUC is of particular interest? Because AUC has the unit of $$ \textrm{mass}*\textrm{time}/\textrm{volume} $$ , and the initial dose $$ D $$ has the unit of $$ \textrm{mass} $$. Therefore, $$ \frac{D}{AUC} = CL $$, namely clearance, which has the unit of $$ \textrm{volume}/\textrm{time} $$, namely volume of blood from which a drug is cleared per unit time by the body. By determining AUC, one can calulate $$ k_{el} $$, which equals clearance divided by volume of distribution.

# Volume of distribution

$$ V_{D} = \frac{D_0}{C_{p}^0} $$. It is a hypothetical number; nevertheless it can be informative.

Drugs with high $$ V_{D} $$ values tend to have longer half-lives, because they distribute out of the central compartment and enter other organs of the body. Since they are not entering liver or kidney through the central compartment, where majority of clearance takes place, they stay longer in the body than drugs with low $$ V_{D} $$ values.

# Two-compartment model

Two two-compartment model introduces the *peripheral compartment* besides the central compartment.
