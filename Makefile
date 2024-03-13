# The `-interaction=nonstopmode -halt-on-error` arguments make LaTeX terminate on the first error.
# This makes it a bit nicer to use with IDE integration and is closer to the behavior of
# Overleaf which most people are familiar with.
#
# You can remove these arguments, if you want the default interactive behavior of LaTeX.

main:
	latexmk -pdf -synctex=1 -interaction=nonstopmode -halt-on-error  main

bib:
	bibtex main

cycle:
	# Note: better to use latexmk which figures out exactly what to run and how many times
	pdflatex --synctex=1 -interaction=nonstopmode -halt-on-error main
	bibtex main
	pdflatex --synctex=1 -interaction=nonstopmode -halt-on-error main
	pdflatex --synctex=1 -interaction=nonstopmode -halt-on-error main

clean:
	rm -f *.aux *.lof *.log *.lot *.pdf *.synctex.gz *.toc *.fdb_latexmk *.bbl *.blg *.out *.bcf

diff.tex:
	@echo "This command assumes you have checked out the previous version"
	@echo "of the thesis you sent to your advisor/reviewer in prev.tex"
	@echo "(Use git to obtain the previous version ofc.)"
	@echo "The latexdiff tools is fragile, so you may have errors compiling"
	@echo "the diff.pdf afterwards unless you go in and edit it yourself."
	latexdiff prev.tex main.tex > diff.tex

diff: diff.tex
	pdflatex --synctex=1 -interaction=nonstopmode -halt-on-error diff.tex

