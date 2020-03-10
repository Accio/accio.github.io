---
layout: single
title: Disable non-portable compiler flags with ~/.R/Makevars
categories: programming
tags: R C
---

Sometimes `R CMD check` complains about non-portable compiler settings. To overcome such warning messages, setup a `~/.R/Makevars` file with the following content.

<pre>
# Settings from /etc/R/Makeconf with "non-portable flag(s):"
# ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’ replaced by -Wall -pedantic
# and without -fdebug-prefix-map=... 
# See https://stackoverflow.com/questions/50658198/cran-submission-r-cmd-check-warning-compilation-flags-used
#
# Note: -Wformat-overflow=3 is a non-portable flag, which seems to be used by CRAN check thoug
h
CC=gcc-7 -std=gnu99 ## -Wformat-overflow=3
CFLAGS = -g -O3 -Wall -pedantic -mtune=native -D_FORTIFY_SOURCE=2 $(LTO)
CXXFLAGS = -g -O3 -Wall -pedantic -mtune=native -frtti  -Wno-ignored-attributes -Wno-deprecated-declarations -D_FORTIFY_SOURCE=2 $(LTO)
FFLAGS= -g -O2 -mtune=native -Wall -pedantic
FCFLAGS=$FFLAGS

</pre>

I got the tip from [a post on Stackoverflow](https://stackoverflow.com/questions/50658198/cran-submission-r-cmd-check-warning-compilation-flags-used), and some of the flags are set according to the setup of [CRAN check](https://cran.r-project.org/web/checks/check_flavors.html).

*History*
* Editted on 25.04., using setup of CRAN check, and use gcc-7
