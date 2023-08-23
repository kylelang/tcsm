# -*- Makefile -*-

all: mediation_moderation.pdf multiple_mediation.pdf
	
%.pdf: %.tex
	latexmk -pdf -f $^

%.tex: %.Rnw
	Rscript -e "knitr::knit('$^')"

clean:
	mv *.pdf ../../../pdf/
	rm -f *.tex *.aux *.log *.out *.nav *.snm *.toc *.vrb *.bbl *.blg *.fdb_latexmk *.fls
