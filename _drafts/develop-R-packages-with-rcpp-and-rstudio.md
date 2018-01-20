---
layout: single
category: programming
tags: R Rcpp Rstudio
---

Recently, I updated the [ribiosMath](https://github.com/Accio/ribios/tree/master/ribiosMath) package, which is like other ribios packages open-source and freely available on Github. The aim was to increase the efficiency of several commonly used computational procedures (Kappa's statistic, Cossine similarity/distance, *etc.*) by implementing them in C++.

During the course, I discovered that it has become much easier now than 1-2 years ago to implement C++ routines in R, with the help of tools such as `devtools` and `Rcpp` packages in R, and RStudio, an IDE for R programming.

## Useful tools

`devtools::use_rcpp()` sets up the package so that it uses Rcpp easily.

## Shortcuts of Rstudio

`Ctrl + Shift + B`: Build and reload a package

## Further reading

1. [Using compiled code in your R package](http://r-pkgs.had.co.nz/src.html#c-export) by Hadley Wickham
2. [Rcpp for everyone](https://teuder.github.io/rcpp4everyone_en/210_rcpp_functions.html#functions-related-to-na-inf-nan) by Masaki E. Tsuda.
