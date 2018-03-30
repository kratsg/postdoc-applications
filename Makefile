FILES=$(wildcard ./CoverLetter_*.tex ./ResearchStatement_*.tex)

all: $(FILES:.tex=.pdf)

ResearchStatement_%.pdf: ResearchStatement_%.tex main.bib templates/research_statement/*.tex
				xelatex -interaction=nonstopmode -halt-on-error $(basename $@)
				bibtex main
				xelatex -interaction=nonstopmode -halt-on-error $(basename $@)
				xelatex -interaction=nonstopmode -halt-on-error $(basename $@)
				make cleanpartial

CoverLetter_%.pdf: CoverLetter_%.tex templates/cover_letter/*.tex
				xelatex -interaction=nonstopmode -halt-on-error $(basename $@)
				make cleanpartial

cleanpartial:
				-@rm *.aux *.bbl *.bcf *.blg *.dvi *.glg *.glo *.gls *.ist *.lof *.log *.lot *.out *.ps *.run.xml *.toc 2>/dev/null || true

clean: cleanpartial
				-@rm *.pdf 2>/dev/null || true
