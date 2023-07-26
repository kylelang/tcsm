# -*- Makefile -*-

## Find all constituent RMD files:
CHAPTERS = $(filter-out index.Rmd, $(wildcard *.Rmd))

VPATH = docs/

all: index.html

## Update book:
index.html: index.Rmd chapters
	Rscript -e "bookdown::render_book('$<')" 

## Update chapters:
chapters: $(CHAPTERS)
	Rscript render.R $?
	mv *.html docs/
	touch chapters

## Update sections:
%.Rmd: sections/%/* 
	touch $@

clean:
	if [ -d ./_bookdown_files ]; then rm -r ./_bookdown_files; fi
	if [ -n "$(ls -A docs/*)" ]; then rm -r docs/*; fi
	if [ -e willy_wallaby_from_wasatch.Rmd ]; then rm willy_wallaby_from_wasatch.Rmd; fi
