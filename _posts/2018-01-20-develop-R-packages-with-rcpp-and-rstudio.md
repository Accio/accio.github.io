---
layout: single
title: Develop R packages with Rcpp and RStudio
category: programming
tags: R Rcpp Rstudio
---

Recently, I updated the [ribiosMath](https://github.com/Accio/ribios/tree/master/ribiosMath) package. The aim was to increase the efficiency of several commonly used computational procedures (Kappa's statistic, cosine similarity, *etc.*) by implementing them in C++.

During the course, I discovered that it has become much easier now than one to two years ago to implement C++ routines in R, with the help of tools such as `devtools` and `Rcpp` packages in R, and RStudio, an IDE for R programming.

## Basic steps

* Call `devtools::use_rcpp()` to setup your package so that it uses Rcpp easily.
* Create C++ files, which can be done by RStudio. It will create a template file with the following essential elements

~~~ cpp
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
void func() {}
~~~
Note that `[[Rcpp::export]]` must precede each function that needs to be called by R functions.
* Modify the function. Hit `Ctrl/Cmd + Shift + D` in RStudio to update the NAMESPACE file
* Build and reload, by `Ctrl/Cmd + Shift + B`. This is a magic command, because in the backstage it does a lot:
    * it sets up the R environment to compile the code, 
    * it generates automatically the R code to make the C++ routine available in R, i.e., setting up`.C`calls  with entry points. This is done by calling `Rcpp::compileAttributes()`.
    * it builds a dynamically linked library, or DLL, and makes it available to R.

What also excites me is the possibility to directly document the R-level function in the C++ source code file: just replacing the `#'` prefix used by the `roxygen` package with `//'`. That will allow `roxygen` generating Rd files automatically.

Optionally, one can even use `// [[Rcpp::interface(r, cpp)]] ` to allow C++ code callable from C++ code in other packages.

Over all, the process is much more efficient than the conventional way of writing C code, which requires a lot of boilerplate activities: make manual R function wrappers with `.C`, document the R function, register the routines, modify the NAMESPACE file, _etc._. I would recommend the new procedure to everyone who seriously works with C/C++-level code in R programming.

Thanks to the new procedure, I updated within a very short time the [ribiosMath](https://github.com/Accio/ribios/tree/master/ribiosMath) package. Like any other ribios package, it is open-source and freely available on Github. Any [suggestion and feedback](mailto:jitao_david.zhang@roche.com) is welcome! 

## Shortcuts of Rstudio

* `Ctrl/Cmd + Shift + B`: Build and reload a package
* `Ctrl/Cmd + Shift + D`: Document a package 

## Further reading

1. [Using compiled code in your R package](http://r-pkgs.had.co.nz/src.html#c-export) by Hadley Wickham.
2. [Rcpp for everyone](https://teuder.github.io/rcpp4everyone_en/210_rcpp_functions.html#functions-related-to-na-inf-nan) by Masaki E. Tsuda.
3. [High performance functions with Rcpp](http://adv-r.had.co.nz/Rcpp.html) in [*Advanced R*](http://adv-r.had.co.nz/) by Hadley Wickham.
4. [Rcpp website](http://dirk.eddelbuettel.com/code/rcpp.html) by Dirk Eddelbuettel. It links to the [Rcpp-introduction vignette](http://dirk.eddelbuettel.com/code/rcpp/Rcpp-introduction.pdf) in PDF format, which is a good read for beginners.
5. [doxygen documentation](http://dirk.eddelbuettel.com/code/rcpp/html/index.html). It surprises me that very few websites link to this resource, which proves very useful when one wants to find particular operations of a given class.

## History

2018.01.23: A few resources were appended which proved useful for learning the latest Rcpp package.

