
default: paper 
coall:
	co RCS/*

ciall:
	ci -u *.tex
	ci -u *.eps

bib: paper.bbl

paper.bbl: *.tex paper.bib
	latex paper
	bibtex paper
	latex paper

paper.ps: paper.dvi
	dvips -P cmz paper.dvi -o paper.ps -t letter

paper.dvi: *.tex paper.bbl
	latex paper
	latex paper

paper.pdf: *.tex
	pdflatex paper
	pdflatex paper
mpost:
	mpost -tex=latex overview.mp

	
paper: *.tex
	pdflatex responses1
	bibtex responses1
	pdflatex responses1
	pdflatex responses1
	@echo "**********************************************************************"
	@echo "***	Did you spell-check your commit?		     ********"
	@echo "***	Did you spell-check your commit?		     ********"
	@echo "***	Did you spell-check your commit?		     ********"
	@echo "***	Did you spell-check your commit?		     ********"
	@echo "***	Did you spell-check your commit?		     ********"
	@echo "***	Did you run grammarly on your commit?		     ********"
	@echo "**********************************************************************"

purge:
	rm -f   *.aux \
                *.bbl \
                *.blg \
                *.dvi \
                *.log \
                *.toc \
                paper.ps \
		overview.mps\
		paper.pdf

clean:
	rm -f   *.aux \
                *.bbl \
                *.blg \
                *.dvi \
                *.log \
                *.toc \
		*.fls \
		*.fdb_latexm \
                paper.ps


