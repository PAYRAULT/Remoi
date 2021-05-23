# Executables
latexmk = latexmk

## Required for thumbpdf as latexmk does not support thumbpdf by itself
pdflatex = pdflatex


# Main file name
MASTER = main
MASTER_TEX = $(MASTER).tex
LITERATURE = references.bib


# Derived file names
SRC = 
TEX_FILES = $(wildcard Sections/*.tex glossaire.tex glossaire.tex page_garde.tex abstract.tex)
GFX_FILES = $(wildcard Images/*)

PDF = $(MASTER).pdf

all: $(PDF)
.PHONY: $(PDF)

$(PDF): $(MASTER_TEX) $(LITERATURE) $(TEX_FILES) $(GFX_FILES)
	$(latexmk) -pdf $(MASTER_TEX)

clean:
	$(latexmk) -C

final: $(PDF)
	thumbpdf $(PDF)
	$(pdflatex) -pdf $(MASTER_TEX)

mrproper: clean
	rm -f *~

ps: $(PDF)
	pdftops $(PDF)

pdf: $(PDF)

ispell:
	for tex in $(TEX_FILES);	\
		do	\
			ispell -d french $$tex ;	\
		done
#
##
