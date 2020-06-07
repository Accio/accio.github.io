---
layout: post
title: Spotting problems that both matter and are computationally solvable
category: DrugDiscovery
---

Derek Lowe's blog post [Calculating your way to
antivirals](https://blogs.sciencemag.org/pipeline/archives/2020/05/27/calculating-your-way-to-antivirals)
is an interesting read about his reflection on
computation (docking in particular) in drug discovery. Here are my learning
notes and reflections.

* TOC
{:toc}

The blog post was about an article published on New England Journal of Medicine,
[*How to Discover Antiviral Drugs
Quickly*](https://www.nejm.org/doi/full/10.1056/NEJMcibr2007042).

## My summary of the blog post

The key message I got from the post is that virtual screening of drug-like
molecules is an useful technique in drug discovery, but it is not all about drug
discovery. Attempts to accelerate this process are welcome, but they alone are
far from being sufficient.

There are two main arguments. First, computational docking between proteins and
drug-like molecules involves invariably a long list of simplifications,
approximations, and trade-offs. A successful molecular modelling project
requires much more than computation resources - expert knowledge of the modeller
and target-specific heuristics matter probably even more.

Second, the outcome of the modelling needs critical assessment by experiments.
In fact, increasing computational power does not save much time, because the
large bulk of real work comes after the screening: medicinal chemists have to
optimize the potency, selectivity, PK profiles such as metabolic stability and
clearance, and safety/toxicity profiles. Computational approaches can help with
some aspects, but not all and not always.

His final sentence about making molecular modelling faster was particular vivid:
&ldquo;it’s like cutting a couple of minutes off your trip to the airport to
catch a six-hour flight.&rduo;

## Working on problems that matter and that can be solved computationally

I agree with Derek's opinions about docking and virtual screening. At the same
time I see the huge potential of computation in drug discovery. The way to
fulfil the potential, however, is not via more computational resources, but via
better modelling and understanding of biological and chemical systems.

My experience and my belief is that mathematical, statistical, and computational
modelling approaches are complementary to experimental approaches in drug
discovery. They are already indispensable in some aspects (for instance target
identification and in silico screening of toxicity). We should not have any
illusion, though, that they will in near future substantially shorten the time
or save the resources (say, to the one tenth of what we need now) required to
develop new drugs, to get them tested in the clinic, and to get them approved.

On the other side, I do believe that computation, or more specifically,
[multiscale modelling in drug
discovery](https://www.sciencedirect.com/science/article/pii/S1359644619304684),
an integration of mathematical, statistical, and computational modelling at
molecular, cellular, body, and population level, is already helping us finding
better drugs. And the assistance and augment we can rely on will only get
better.

The main achievement and improvement brought by multiscale modelling does not
come with the increase of computational resources. Instead, it comes mainly from
two other sources. On one hand, the improvement comes with the accumulation of
high-quality, reliable data in biology and chemistry from which we can draw
causal inferences, our capacities to convert data into knowledge, and to use the
knowledge to design new experiments, the results of which can update our
believes of good ways to modulate biological systems, where 'good ways' means
drugs with reasonable efficacy and safety profiles. On the other hand, the
improvement comes with computation-assisted investigations of further
serendipities, like the many ones including Penicillin and
[sidenafil](https://en.wikipedia.org/wiki/Sildenafil#History) (more widely known
as *Viagra*) that we human beings have fortunately got. These are
&lsquo;deterministic&rsquo; and &lsquo;stochastic&rsquo; factors, respectively,
of how multiscale modelling may help us discovery more and better drugs.

The road, alas, is not as straightforward as buying more CPUs and memories and
accumulating more data. A lesson I draw from Derek's post is that as
computational scientists working in drug discovery, we should strive to spot
questions that really matter and that can be solved with the help of
mathematical, statistical, and computational approaches. The computational
resources and the specific techniques, let it be mathematical modelling,
statistical learning, or computational simulation, do not really matter in the
end. Effective communication and collaboration with non-computational
experiments and problem solving are the A and O of computational science in drug
discovery.

## Conclusions

I summarize my thoughts in a simple illustration.

{% include image.html
url="/assets/images/problem-that-matter-and-solvable.png"
description="We need to focus on problem that matter and that are computationally solvable."
%}

It matters not how much hardware we churn or how much software we build. We need
to better describe, predict, and understand biological systems. Along the way,
we must spot questions that matter and questions that be solved (at least
partially) computationally, and work hard on the intersection of both sets.

I am curious to find out whether such an implementation of computation and multiscale
modelling would lead to better decisions and better drugs.

