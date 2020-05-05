#!/bin/bash -l
cd /mnt/projects/myblog
bundle exec jekyll clean
bundle exec jekyll serve --incremental --draft --livereload --watch --future
