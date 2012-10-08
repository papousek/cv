TO_CLEAN=aux log blg bib~ bbl tex~ out toc dvi
LANGS=cs en

.PHONY: all
all: cv clean

.PHONY: cv
cv:
	for LANG in $(LANGS); do \
		pdflatex  jan_papousek_"$$LANG".tex; \
	done; \

.PHONY: clean
clean:
	for EXT in $(TO_CLEAN); do \
		echo "Deleting *.$$EXT"; \
		for FILE in *.$$EXT; do \
			rm -f "$$FILE"; \
		done \
	done \

