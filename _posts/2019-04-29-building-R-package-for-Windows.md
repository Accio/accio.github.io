---
layout: single
title: Building R and/or R packages for Windows
categories: R
tags: R C Windows programming
---

For those who often work with R code, it is convenient to package commonly used functions, data structures, documentations and other helping files into packages. Prior to submission of such packages to CRAN, it is necessary to go through the [CRAN policies](https://cran.r-project.org/web/packages/submission_checklist.html) and the [checklist for CRAN submissions](https://cran.r-project.org/web/packages/submission_checklist.html) to make sure that the package meets the standard of CRAN.

One step in the checklist is to make sure that the package, especially when it contains compiled code (in C or C++, for instance), can compile under Windows without error. There are three ways to ensure this:

1. Use the [Winbuilder](https://win-builder.r-project.org/) service, which checks packages on 32-bit and 64-bit Windows using a current development version of R. Since the same infrastructure is used by the CRAN team for checking submitted packages, this way can be a great sanity check once local checks are successful.
2. Use the [rhub](https://github.com/r-hub/rhub) service, which is a multi-platform build and check service for R packages. It is not managed by the CRAN team and therefore the configuration may differ.
3. Last but not least, it is always possible to setup a local environment to check the package.

To setup a local environment in Windows, one can follow the instructions given by [R Installation and Administration](https://cran.r-project.org/doc/manuals/r-release/R-admin.html), which is often very informative despite the lengthiness. In short, one just needs to install [Rtools](https://cran.r-project.org/bin/windows/Rtools/), together with either a regular R program that can be found on [CRAN](https://cran.r-project.org/), or in cases of experimental Rtools (Rtools40 as of writing, 29.04.2019), a daily building of R-testing, which is a modified version of R-devel configured for the toolchain.

In addition to Rtools and R, one may need a Windows client of Git, for instance available [git-scm.com](https://git-scm.com/download/win). Now happy checking out your code and checking it in Windows!
