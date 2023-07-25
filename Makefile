# -*- Makefile -*-

## Find all constituent RNW files:
PARTS = $(filter-out index.Rmd, $(wildcard *.Rmd))

#all: index

index.Rmd: parts
	Rscript -e "bookdown::render_book('$@')" 
	
parts: $(PARTS)
	Rscript render.R $?
	mv *.html docs/
	touch parts

clean:
	if [ -d ./_bookdown_files ]; then rm -r ./_bookdown_files; fi
	rm -r docs/*
