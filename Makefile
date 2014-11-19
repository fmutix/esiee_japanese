TEX = pdflatex

all: adjectif.pdf grammar.pdf verb.pdf

%.pdf: %.tex
	$(TEX) $<
	latex_count=8	                                \
	while egrep -s 'Rerun (LaTeX|to)' $*.log && [ $$latex_count -gt 0 ] ;\
		echo '** Re-running LaTeX **';              \
		$(TEX) $<                                   \
	done

.PHONY: all
