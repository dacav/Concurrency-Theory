.PHONY : all clean index dir

TEX := report.tex
SUBTEXS := $(shell find . -mindepth 2 -name '*.tex')
PDF := $(TEX:.tex=.pdf)
OUTDIR := ./out
OPTS := -halt-on-error -interaction nonstopmode -output-directory $(OUTDIR)
PDFLATEX := pdflatex

all: $(PDF) dir

index: all
	$(PDFLATEX) $(OPTS) $(TEX) 2> /dev/null
	$(PDFLATEX) $(OPTS) $(TEX) 2> /dev/null

$(PDF) : $(TEX) $(SUBTEXS)
	$(PDFLATEX) $(OPTS) $(TEX)

clean:
	rm -r $(OUTDIR)

dir: $(OUTDIR)
	mkdir $(OUTDIR)
