---
layout: post
title: Learning from mathematical models of infectious-disease dynamics
category: Mathematics
mathjax: true
tags: SARS-nCoV-2
---

Sarah Cobey published [a succinct and informative
piece](https://science.sciencemag.org/content/368/6492/713) on *Nature* that
taught me a few lessons to deal with the SARS-CoV-2 pandemic and other
respiraotry pathogens like influenza.

* TOC
{:toc}

## Lesson 1: SARS-CoV-2 will stay and we must choose between infection and diruption

She believes that the SARS-CoV-2 pandemic "presents a broader opportunity to
interrogate how to manage pathogens". She predicts that SARS-CoV-2 will be with
us for some time, and the high transmission rate will continue to force a choice
between widespread infection and social disruption, at least until a vaccination
is available.

An epidemic dies out when an average infection can no longer reproduce itself.
This happens when a large fraction of the contacts of an infected host are
immune. The threshold between where an infection can and cannot reproduce itself
defines the fraction of the population required for head immunity. In reality,
the herd immunity is achieved not as a constant, but as an dynamic process that
approaches an equilibrium. Because the herd immunity is constantly eroded by
births of new, susceptible hosts, and sometimes by the waning of immunity in
previously infected hosts.

## Lesson 2: Our behaviour, viral biology, and seasons determine the spread largely

The history of influenza virus suggested that if sufficiently fast and
widespread, declines in the availability of susceptible individuals or the
transmission rate can drive pathogens go distinct.

Apparently, if people migrate and spread the virus freely, the herd immunity has
to be achieved globally. In addition to that, regional efforts to drive
SARS-CoV-2 extinct may not be successful in the long term owing to seasonal
factors, which may influence susceptibility or transmission. However, we
currently know little about how seasonal factors such as temperature and
humidity affects SARS-CoV-2. In fact, Sarah Cobey pointed out to the old puzzle:
we know little about why most respiratory pathogens, including influenza,
exhibit prevalence peaks in the winter of temperate regions.

A few years ago, my collaborators and I also observed this pattern, reported in
our preprint [*Cross-reactive immunity drives global oscillation and opposed
alternation patterns of seasonal influenza A
viruses*](https://www.biorxiv.org/content/10.1101/226613v1) available on
biorxiv (not peer reviewed).

Without using heavy mathematical notations or explicitly introducing the
Susceptible-Infectious-Recovered (or SIR for short) model and other [compartment
models in
epidemiology](https://en.wikipedia.org/wiki/Compartmental_models_in_epidemiology),
Sarah Cobey introduced one parameter that we need to care about especially. It
is the intrinsic reproductive number, $$ R_0 $$ (read as R naught), defined by
the expected number of secondary cases caused by an index case in an otherwise
susceptible population, where the term [*index
case*](https://en.wikipedia.org/wiki/Index_case) refers to the first documented
patient in a disease epidemic within a population.

Equivalently, the number $$ R_0 $$ can
be expressed as the transmission rate divided by the rate at which people loses
the ability to infect, namely when they recover or die. This number determines
the total number of people infected in a population. It is most accurate to
specify $$ R_0 $$ in reference to a pathogen and host population, because the
number is partially under host control - social distancing, for instance,
prevents the spread of virus by decreasing this number.

As an epidemic progresses and some of the population becomes immune, the average
number of secondary cases caused by an infected individual is named the
effective reproductive number, $$ R_t $$.

## Lesson 3: We need inference and simulation to implement targeted intervention

Mathematical modelling and historical influenza pandemics suggest that we need
special caution to compare the effects of interventions in different
populations. [A paper by *Neher et
al.*](https://smw.ch/article/doi/smw.2020.20224) used relatively simple models
to show that epidemic dynamics can become unintuitive when parameters of
susceptibility or transmission show seasonal variation, and especially when
there is movement between populations. And the apparent control of the pandemic
may be not only due to intervention, but may be also due to seasonal variations.

The scientific challenge now, besides developing vaccines (a mid-term goal) and
drugs (a long-term goal), is to identify, through *inference* and *simulation*,
measures that could provide as-good or better protection with less social cost.
Another task to identify any sub-populations or settings contribute
disproportionally to transmission, and design targeted interventions to them. A
known example is the fact that school-age children tend to drive influenza virus
transmission in communities, though they are under-represented among severe
cases or deaths.

## Lesson 4: A typical influenza infection does not have a fever

An unsettling fact that I learned towards the end of the article is that *a
typical infectious case of influenza virus doses not have a fever*, as reported
by [Ip *et al.*](https://www.ncbi.nlm.nih.gov/pubmed/28011603) in 2017. In
another word, we can be latent transmitters of influenza without a strong
symptom, in contrary to what many people think, namely getting influenza means
showing strong symptoms.

The fact means that influenza virus can be spread by people who think they only
have a common cold or even believe that they healthy. Based on this and other
facts, Sarah Cobey argue that that we have *choices* facing respiratory
pathogens, let it be vaccination or social distancing.

I recall two years ago when my younger daughter, just over one year old that
time, was hospitalized because of pneumonia following an influenza infection.
Luckily both my wife and I were vaccinated. The grandma and my older daughter
were both likely caught (not diagnosed), however indeed without fever.  I was
puzzled by this, because I thought fever is a typical symptom of Influenza. Now,
thanks to the article by Sarah Cobey and the study of Ip *et al.*, I know
something more about influenza, and how we may protect our loved ones.

## Conclusion

In summary, I liked the article a lot. It was short, only two A4 pages, but full
of valuable insights. I regret the time in the past when I appeared in the
office when I feel sick but struggled to be present. I learned from the article
that we have a choice when facing respiratory pathogens. Whether there is
[another major peak of coronavirus](https://smw.ch/article/doi/smw.2020.20224) or not, reducing $$ R_0 $$ or
$$ R_t $$ by hygiene and social distancing is probably the best way to protect
others and in turn yourself.
