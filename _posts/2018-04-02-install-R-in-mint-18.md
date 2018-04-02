---
layout: single
title: Install R in Linux MINT 18
category: bioinformatics
tags: R linux
---

After a morning of waiting and trying to compile and install R from source code with only limited success, I found out I missed the correct link which allowed me to install the latest R-3.4.4 within seconds.

Here is the link: [https://stat.ethz.ch/CRAN/bin/linux/ubuntu](https://stat.ethz.ch/CRAN/bin/linux/ubuntu/). 

In principle, one needs just three steps:

## Step 1: Add source

Add the following line to /etc/apt/sources.list

```bash
deb https://stat.ethz.ch/CRAN/bin/linux/ubuntu xenial/
```

(replace `stat.ethz.ch/CRAN` with your favorite CRAN mirror)


## Step 2: Add the CRAN key

```bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
```

## Step 3: Install!

Install `r-base` and `r-base-dev`

```bash
sudo apt-get install r-base r-base-dev
```
(`r-base-dev` is only needed by package maintainers)

## Conclusions
In case you need to install the latest R in Linux MINT or Ubuntu, I would suggest not to start from the source code, since it requires a lot of dependencies and the compiling is very lengthy. This was not the case a few years ago. Now it makes much more sense to install from the CRAN source.

