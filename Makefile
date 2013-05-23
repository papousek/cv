TO_CLEAN=aux log blg bib~ bbl tex~ out toc dvi
LANGS=en
MODES=formal casual
TEX_ARGS=--shell-escape -interaction batchmode

.PHONY: all
all: clean terka honza dolezal clean

.PHONY: dolezal
dolezal:
	pdflatex ${TEX_ARGS} jaromir_dolezal_cs.tex; \
	pdftk A=jaromir_dolezal_cs.pdf cat A1 output _jaromir_dolezal_cs.pdf; \
	mv _jaromir_dolezal_cs.pdf jaromir_dolezal_cs.pdf;

.PHONY: terka
terka:
	for MODE in $(MODES); do \
		cp tereza_dolezalova_"$$MODE".jpg tereza_dolezalova.jpg; \
		for LANG in $(LANGS); do \
			pdflatex ${TEX_ARGS} tereza_dolezalova_"$$LANG".tex; \
			make clean; \
			mv tereza_dolezalova_"$$LANG".pdf tereza_dolezalova_"$$MODE"_"$$LANG".pdf; \
		done; \
	done;

.PHONY: honza
honza:
	for LANG in $(LANGS); do \
		pdflatex ${TEX_ARGS} jan_papousek_"$$LANG".tex; \
	done; \

.PHONY: clean
clean:
	rm -rf tereza_dolezalova.jpg
	for EXT in $(TO_CLEAN); do \
		echo "Deleting *.$$EXT"; \
		for FILE in *.$$EXT; do \
			rm -f "$$FILE"; \
		done \
	done \

html: all
	pdf2htmlEX --zoom=2 jan_papousek_en.pdf;
	pdf2htmlEX --zoom=2 tereza_dolezalova_casual_en.pdf;
	pdf2htmlEX --zoom=2 jaromir_dolezal_cs.pdf;
