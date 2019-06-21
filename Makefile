main:
	pdflatex --synctex=1 main

bib:
	bibtex main

cycle:
	pdflatex --synctex=1 main
	bibtex main
	pdflatex --synctex=1 main
	pdflatex --synctex=1 main

clean:
	rm -f *.aux *.lof *.log *.lot *.pdf *.synctex.gz *.toc

diff.tex:
	@echo "This command assumes you have checked out the previous version"
	@echo "of the thesis you sent to your advisor/reviewer in prev.tex"
	@echo "(Use git to obtain the previous version ofc.)"
	@echo "The latexdiff tools is fragile, so you may have errors compiling"
	@echo "the diff.pdf afterwards unless you go in and edit it yourself."
	latexdiff prev.tex main.tex > diff.tex

diff: diff.tex
	pdflatex --synctex=1 diff.tex

