COVERLETTERS=$(wildcard ./CoverLetter_*.tex)

all: $(COVERLETTERS:.tex=.pdf)

%.pdf: %.tex
				xelatex -interaction=nonstopmode -halt-on-error $(basename $@)
				#bibtex papers
				#bibtex talks
				#bibtex works
				xelatex -interaction=nonstopmode -halt-on-error $(basename $@)
				xelatex -interaction=nonstopmode -halt-on-error $(basename $@)
				make cleanpartial

cleanpartial:
				-@rm *.aux *.bbl *.bcf *.blg *.dvi *.glg *.glo *.gls *.ist *.lof *.log *.lot *.out *.ps *.run.xml *.toc 2>/dev/null || true

clean: cleanpartial
				-@rm *.pdf 2>/dev/null || true
