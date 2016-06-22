#!/bin/bash

ORDER=(`cat order`)
ORDER=("${ORDER[@]/#/sections/}")
ORDER=("${ORDER[@]/%/.md}")

echo "$(cat `echo ${ORDER[@]}` | wc -w) Words"

cat `echo ${ORDER[@]}` | pandoc -s -o paper.pdf \
	--filter=/bin/pandoc-fignos \
        --filter=/bin/pandoc-citeproc \
        --csl=cell.csl \
        --bibliography=references.bib \
        --include-in-header=header_options.tex
