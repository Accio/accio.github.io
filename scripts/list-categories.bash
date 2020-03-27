#!/bin/bash

grep "^categor" ../_posts/* | sed 's/.*://g' | sort | uniq -c
