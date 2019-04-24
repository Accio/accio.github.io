---
layout: single
title: Get rid of non-portable compiler settings with ~/.R/Makevars
categories: R
tags: R C Makevars
---

Sometimes `R CMD check` complains about non-portable compiler settings. To overcome such warning messages, setup a `~/.R/Makevars` file with the following content.

<pre>
# Settings from /etc/R/Makeconf with "non-portable flag(s):"
# ‘-Wdate-time’ ‘-Werror=format-security’ ‘-Wformat’ replaced by -Wall -pedantic
# and without -fdebug-prefix-map=... 
# See https://stackoverflow.com/questions/50658198/cran-submission-r-cmd-check-warning-compilation-flags-used
CFLAGS = -g -O2 -Wall -pedantic -fstack-protector-strong -D_FORTIFY_SOURCE=2 $(LTO)
CXXFLAGS = -g -O2 -Wall -pedantic -fstack-protector-strong -D_FORTIFY_SOURCE=2 $(LTO)
CXX98FLAGS = -g -O2 -Wall -pedantic -fstack-protector-strong -D_FORTIFY_SOURCE=2
CXX11FLAGS = -g -O2 -Wall -pedantic -fstack-protector-strong -D_FORTIFY_SOURCE=2
CXX14FLAGS = -g -O2 -Wall -pedantic -fstack-protector-strong -D_FORTIFY_SOURCE=2
</pre>

I got the tip from [a post on Stackoverflow](https://stackoverflow.com/questions/50658198/cran-submission-r-cmd-check-warning-compilation-flags-used).
