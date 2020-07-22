---
layout: post
title: >-
  Continuous documentation, testing, and integration for R packages
category: programming
tags: r ribios
---

This week, I used `pkgdown`, `rhub`, and GitHub Action via the `usethis` package
to allow web-based documentation, checking, and continuous integration and
delivery (CI/CD) for the [ribiosUtils](https://github.com/bedapub/ribiosUtils)
package. Here are my learning notes.

* TOC
{:toc}

## Motivation

Why do I do this? Mainly for three reasons:

1. To create web-accessible documentations so that I can point users to them.
1. To test the package on systems that I am not working in to make sure that it
   works everywhere.
1. To automatically notify me if the latest pushes in GitHub breaks any tests or
   make the package stop working in some environment.

It is hoped that, with these efforts, I can make
[ribiosUtils](https://github.com/bedapub/ribiosUtils) towards [a better piece of
scientific
software](https://grst.github.io/bioinformatics/2020/07/16/hallmarks-scientific-software.html).

## Convert package documentations to a website with pkgdown

[pkgdown](https://pkgdown.r-lib.org/index.html) builds a website form the
package using Rd files (which can come from, for instance, *roxygen*
documentations).

It is fairly easy to use. If we run it locally, we need first to configure the
package to use `pkgdown` with `usethis::use_pkgdown()`, and then to generate the
website with `pkddown::build_site()`. The site will be stored in the `docs`
directory of the package.

On my first try, I found `pkgdown` had problems with functions whose examples
attempt to write to the standard output or other connections (for instance
`registerLog` and `writerLog` in `ribiosUtils`). These commands will trap
`pkgdown` in a dead, permanent loop complaining connections are not closed. By
wrapping such examples inside `\dontrun{}`, I got rid of the problem.

There are two ways to make the website available on GitHub. We can set the
GitHub pages' source to &lsquo;master branch /docs folder&rsquo;. If we do this,
we can build website locally, commit any changes to GitHub, and pushing the
changes to the GitHub repository.

Alternatively, We can also set the source of GitHub pages to the `gh-pages`
branch of the repository, and setup a GitHub Action (see also below) to
automatically generate and update the website when we push changes. This is the
variant that I used. Below I document the steps that I took to setup this up
(which I discovered from
[here](https://ropenscilabs.github.io/actions_sandbox/websites-using-pkgdown-bookdown-and-blogdown.html#deploy-pkgdown)).

### A step-by-step guide to setup pkgdown and gh-pages

First, create an empty `gh-pages` branch in the package directory (the package
has already been in GitHub).

```bash
git checkout --orphan gh-pages
git rm -rf .
git commit --allow-empty -m 'Initial gh-pages commit'
git push origin gh-pages
git checkout master
```

Next, configure the package to use `pkgdown` by running the following command in
R console.

```r
usethis::use_pkgdown()
```

Finally, we add the GitHub Action for `pkg` to automatically add documentation.
There is an existing yaml template example in the `actions` package available
on GitHub [r-lib/actions](https://github.com/r-lib/actions).

```r
usethis::use_github_action(url = "https://raw.githubusercontent.com/r-lib/actions/master/examples/pkgdown.yaml")
```

By using this template (see the yaml file for details), we will make `pkgdown`
generate or update the site anytime there is a push event in the master branch.

As soon as we add, commit, and push the yaml file, we have setup the CI/CD of `pkgdown`.

## Test R package building with r-hub

[The R-hub builder](https://builder.r-hub.io/) is a website which can be used to
build a source R package into binaries on many different platforms including
Mac, Linux, and Windows. Its R client, [`rhub`](https://r-hub.github.io/rhub/),
can used to check R code on platforms other than the one the developer is
working on.

For instance, you can run the following commands to test the package residing in
the current directory, even if you are not working on the systems in which the
package will be tested.

```r
myCheck<- check() ## you can choose on which R-hub platforms it will be checked
## the following commands let you examine the results, retrieve URLs, etc.
myCheck$browse()
myCheck$print()
myCheck$livelog()
mycheck$urls()
## useful shortcuts
check_on_linux()
check_on_windows()
## prior to submission to CRAN
check_for_cran() ## very useful for packages need to be submitted to CRAN
check_with_valgrind() ## checking in valgrind to find memory leaks and pointer errors
## retrieve previous checks
previousChecks <- rhub::list_package_checks("PATH",email="email@me.com",howmany=4)
```

When you use `rhub` for the first time, you need to validate the E-mail address.
From then one, an email of checking results will also be sent to that address.

My impression is that `R-hub` and its client `rhub` are useful to check the
package and to make sure that the package can be built also on other systems
(especially if it contains compiled code). I find the only drawback is that it
can be slow, especially when the dependent packages need to be first installed.

## Setup GitHub Actions to test R packages and to render pkgdown automatically

The GitHub repository [r-lib/actions](https://github.com/r-lib/actions) lists
commonly used GitHub Actions for the R language. I used to copy and paste action
definition files from there to my packages.

Recently, thanks to [this
tutorial](https://ropenscilabs.github.io/actions_sandbox/) on GitHub Actions
with R from Brown *et al.* (ropenscilabs), I found that the
[usethis](https://github.com/r-lib/actions) package can be used to automate this
process.

```r
usethis::use_github_action_check_standard() ## or _check_release
```

### More about usethis

`usethis` is a workflow package which automates repetitive tasks during project
setup and development. Its main functionalities include

* Creating a package or project
* Managing an active project
* Adding or modifying files found in R packages
* Setting up packages
* Releasing packages
* CI/CD functionalities
* Conventions specific to *tidyverse*
* Configuration
* Interfacing with Git and GitHub
* etc.

For more details, see
[Reference](https://usethis.r-lib.org/reference/index.html) of the package.

## Conclusions

By using `pkgdown`, and `rhub`, and `usethis`, it is possible to setup web-based
documentation, checking, and continuous integration and delivery (CI/CD) in
short time (less than a few hours) for a R package such as
[ribiosUtils](https://bedapub.github.io/ribiosUtils/) that needs compilation of
source code and thus extensive testing in multiple operating systems.

Adopting such tools can be time-consuming, especially at the beginning, because
one needs to invest time in learning them and adapting existing packages to use
these tools. Making the hurdle of learning higher, the tools themselves are
under fast development and therefore unexpected problems may appear from time to
time. It is hoped, however, that the long-term payment is worth the investment,
especially when the code can run anywhere and when bugs are found early enough.

There are still a few small problems that I wish I can dive deeper. For
instance, why the devel branch of Mac fails the test while other versions of R
are doing well (as of [July 22nd,
2020](https://github.com/bedapub/ribiosUtils/actions/runs/178374254))?
Currently, I cannot afford that and will just proceed. Nevertheless, the overall
experience of adopting these tools was positive. I will continue updating other
*ribios* packages as well as several [CRAN/Bioconductor R packages](/software) of
mine, so that they are up to the standards that I described above. Clearly, some
hard work lies ahead.
