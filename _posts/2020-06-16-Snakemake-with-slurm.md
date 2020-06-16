---
layout: post
title: Submitting Snakemake jobs to Slurm
category: programming
tags: Snakemake Slurm HPC
---

I was often confused by the many [Slurm](https://slurm.schedmd.com/) settings
for [Snakemake](https://snakemake.readthedocs.io/en/stable/index.html). Partly
because Snakemake provides huge flexibility to control the behaviour of Slurm,
partly because I failed to find consistent documentations over the issues that I
met. Therefore, I decided to write my learnings down here.

{% include image.html
url="/assets/images/20200616-snakemake-slurm.png"
description="Snakemake and slurm: a lovely pair"
%}

For those who are not familiar with the terms: *Slurm* is a job scheduler for
Linux systems, used for instance to submit jobs to a cluster of computers and
collect the results. *Snakemake* is a pipelining tool, particularly suitable for
building bioinformatics data analysis workflows[^1].

Please note that these notes are distilled from my empirical observations and
they are incomplete, and may be inaccurate or even wrong. I am thankful if you
drop me a line in case you find mistakes and errors.

* TOC
{:toc}

## Specifying resource needs at the level of individual rules

It is possible to specify the threads used by a rule by the variable `threads`,
like [the example in the advanced tutorial of
Sankemake](https://snakemake.readthedocs.io/en/stable/tutorial/advanced.html#step-1-specifying-the-number-of-used-threads).
If not specified, one thread is used.

A core is a physical subunit of a CPU. A thread is a virtual version of a CPU
core. Therefore, A CPU may have more than one thread (therefore the words
multi-threading or hyper-threading). In the language of Slurm, however, the word
`thread` and `core` is used interchangeably: according to [its
documentation](https://slurm.schedmd.com/faq.html#cpu_count), if the nodes are
configured with hyper-threading, then a CPU is equivalent to a hyper-thread.
Otherwise, a CPU is equivalent to a core[^2].

Therefore, on the level of individual rules, we use the variable `threads` to
control the number of CPU a rule will consume.

Snakemake ensures that the total number of CPUs consumed by a Snakemake workflow
does not exceed the total number of cores defined by `--cores` in the command
line or the option `--cores` in its API (see below, documented [here](https://snakemake.readthedocs.io/en/stable/tutorial/advanced.html#step-1-specifying-the-number-of-used-threads)).
Therefore, by setting `threads` in individual rules and `cores` on the workflow
level, we set how many of these CPU-heavy thresholds can run in parallel.

Besides `threads`, the variable `resources` in a rule represents another, more
general way to control the number of parallel jobs, see [an example on
StackOverflow](https://stackoverflow.com/questions/49139395/set-cluster-core-per-rule-in-snakemake?rq=1)
and [Snakemake
documentation](https://snakemake.readthedocs.io/en/stable/snakefiles/rules.html#resources).
Though it can contain any variable, `mem_mb` and `disk_mb` have special meanings
for memory and disk usage, and therefore are known as *standard resources*.

In summary, it is possible to use `threads` and `resources` at the rule level to
tell Slurm about the resource need of an instance of that rule. Why an instance?
Because many instances of rule can run in parallel. To control bahaviour of
Slurm on Snakemake jobs that run in parellel, we have to move to the next level,
namely the level of Snakemake workflow, and understand how to specify the
behaviour of Slurm there.

## Specifying resource needs at the level of Snakemake workflow

We can control the resources allocated to Snakemake jobs at the workflow level.
There are two types of settings (the names are given by me): *imperative
settings*, which are specified on the workflow level and propogated to each job,
and *constraint settings*, which controls the maximum resources a Snakemake
running instance can consume in parallel.

We will examine them below in more details. Before that, we need to have a
better understanding of how Slurm works.

### Job, task, and step: the hierarchy of Slurm

To fully understand the control at the workflow level, it is important to
distinguish a few important concepts in Slurm: *job*, *task*, and *step*. I
found this explanation on
[StackOverflow](https://stackoverflow.com/a/46532581/2114825) most clear and
convincing.

In brief:

* A *job* is submitted by `sbatch`. It can consists of one or more *steps*, each
    of which is fired by `srun`.
* Each *step* can consist of one or more *tasks*, each using one or more CPUs.
* Tasks can be requested either at the job level, using `sbatch` with the option
    `--tasks-per-node`, or at the step level, `srun` with the option `--ntasks`.
* CPUs are requested per task with `--cpus-per-task`.

The hypothetical job given in the [StackOverflow
answer](https://stackoverflow.com/a/46532581/2114825) explain the differences
between the concepts and the commonly used parameters well, in my opinion.

### Imperative settings

A Snakemake flow will submit each instance of rule as a job. If a rule is run in
parallel, then each parallel-running instance will have its own job. Therefore,
if Snakemake uses Slurm, it suffices that we control the behaviour of Slurm at
the *job* level, not the *task* or the *step* level.

I call these settings *imperative* because they specify how much resource is
consumed per job. Although these parameters are set on the Snakemake workflow
level, the settings apply to each instance of rule in the same way.

Commonly used imperative settings include:

* `nodes`, in the form of `min(-max)`, specifies the minimum number and
   (optionally) maximum number of nodes used *per job*. The default value is
   one.
* `-n`, or `--ntasks`, advices how many tasks will be performed on each
   node. By default it is 1.
* `-c`, or `--cpus-per-task`, advices how many CPUs each task needs, again
   *per job*. With it, Slurm knows how to smartly allocate nodes and reserve
   enough CPUs for your Snakemake rule. It does not limit the total number of
   CPUs in use, which is controlled by `cores` (see below).

These imperative settings can be stored in a `cluster.json` file in the `config`
directory, and passed to the `cluster` option of the Snakemake [command line
interface](https://snakemake.readthedocs.io/en/stable/executing/cli.html), or
the parameter of the same name of the [Snakemake
API](https://snakemake.readthedocs.io/en/stable/api_reference/snakemake.html).

### Constraint settings

Besides the settings above, when we use the Snakemake [command line interface
(CLI)](https://snakemake.readthedocs.io/en/stable/executing/cli.html) or the
[Snakemake
API](https://snakemake.readthedocs.io/en/stable/api_reference/snakemake.html),
we can specify additional parameters at the workflow level. I call them
*constraint settings*, in contrast to the *imperative settings* described above,
because they set constraints on the total resources a Snakemake job can consume
in parallel.

Important constraint settings contain:

* `cores` (`--cores`, `--jobs` or `-j`) on the command line : the maximum number
  of CPU cores Snakemake can consume in parallel.
* `nodes`: how many nodes can Snakemake consume in parallel. I did not find the
    corresponding option in Snakemake CLI.
* `resources` and `default_resources`: other resource constraints.
* `local_cores`: how many CPU cores can Snakemake consume on the local machine
  (not used in Slurm nodes).

In summary, we can set either imperative settings or constraint settings at the
level of a Snakemake workflow. They control the resource available to each
instance of the rules specified in `Snakefile` and the resource available to all
instances running in parallel, respectively.

## Conclusions

We can set behaviour of Slurm at the level of individual rules in Snakemake or
at the level of a Snakemake workflow. In case of workflow-level settings, we
can distinguish between imperative settings that apply to all running instances
of the rules in the same way, and constraint settings that control the maximum
resources consumed by parallel jobs submitted by Snakemake to Slurm.

The great flexibility provided by Snakemake to work with diverse schedulers
including Slurm is much appreciated. At the same time, it can be sometimes
challenging to understand the behaviour of the many settings. I hope this post
may help one or another who is confused like I once was.

### Other resources for further learning

* [sbatch manual](https://slurm.schedmd.com/sbatch.html)
* [multicore support of slurm](https://slurm.schedmd.com/mc_support.html)
* [cluster execution of
    Snakemake](https://snakemake.readthedocs.io/en/v5.1.4/executable.html#cluster-execution)
* [Snakemake
    API](https://snakemake.readthedocs.io/en/stable/api_reference/snakemake.html)
* [SlurmEasy](https://github.com/dpryan79/Misc/blob/master/MPIIE_internal/SlurmEasy)
* [rusalkyguy/snakemake-slurm-tutorial](https://github.com/rusalkaguy/snakemake-slurm-tutorial)

[^1]: A similar software to Snakemake is [nextflow](https://www.nextflow.io/). That is another story which should be told another time.
[^2]: We can use `scontrol show node | grep ThreadsPerCore` to find out whether the nodes have more than one thread per core.



