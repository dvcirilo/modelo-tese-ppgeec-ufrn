# Comentário

default: all

all: pdf nomenclature bibtex

pdf:
	pdflatex principal.tex

nomenclature: pdf
	makeindex principal.nlo -s nomencl.ist -o principal.nls
	pdflatex principal.tex

bibtex: pdf
	bibtex principal.aux
	pdflatex principal.tex
	pdflatex principal.tex

clean:
	rm -f  *.aux *~ *.bak */*.aux */*~ */*.bak */*/*.aux principal.bbl principal.blg principal.dvi principal.nlo principal.nls principal.ilg principal.lof principal.log principal.lot principal.toc

realclean: clean
	rm -f principal.pdf
