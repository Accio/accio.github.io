---
layout: single
title: Linking native routines between R packages - a demo
category: programming
tags: R
---

In R programming, we need to link to native routines in C, C++, or Fortran from the R environment. In most cases, the linking works within one package, namely the R code in a package calls the native code in the same package.

This is not necessarily always the case. It can happen that a piece of C or R code in a package needs to link to native routines in another R package. The [Writing R Extensions manual](https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Linking-to-native-routines-in-other-packages) describes how to do this. However, some details were not clear to me, and I could find no demo dedicated to this purpose.

Therefore, I decided to build a demo that is available at my Github repository [Accio/demo-linking-native](https://github.com/Accio/demo-linking-native). Besides implementing the linking of native routines between R packages, the project also documents issues that I met and how I solved them.

In case you find the demo useful or you have suggestions how to improve it, please let me know.
