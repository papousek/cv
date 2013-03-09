TO_CLEAN=aux log blg bib~ bbl tex~ out toc dvi
LANGS=en
TEX_ARGS=--shell-escape -interaction batchmode

.PHONY: all
all: terka honza clean

.PHONY: terka
terka:
	for LANG in $(LANGS); do \
		pdflatex ${TEX_ARGS} tereza_dolezalova_"$$LANG".tex; \
	done; \

.PHONY: honza
honza:
	for LANG in $(LANGS); do \
		pdflatex ${TEX_ARGS} jan_papousek_"$$LANG".tex; \
	done; \

.PHONY: clean
clean:
	for EXT in $(TO_CLEAN); do \
		echo "Deleting *.$$EXT"; \
		for FILE in *.$$EXT; do \
			rm -f "$$FILE"; \
		done \
	done \

html:
	pdf2htmlEX --zoom=2 jan_papousek_en.pdf;
	pdf2htmlEX --zoom=2 tereza_dolezalova_en.pdf;
