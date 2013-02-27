# Makefile to build doc (odt) from rst sources

ifndef NAME
$(error Usage: make NAME=<DOCUMENT_NAME> [THEME=<DOCUMENT_THEME>])
endif

THEME	?= pathways-3

doc_PDF		?= $(NAME).pdf
doc_SOURCES	?= $(sort $(wildcard *.rst))

imagesdir	?= images
image_SVG_DATA	?= $(wildcard $(imagesdir)/*.svg)
image_PNG_DATA	?= $(wildcard $(imagesdir)/*.png) $(image_SVG_DATA:.svg=.png)

# svg -> png
svg2png = inkscape -e $@.tmp $< && optipng -o7 -fix -force $@.tmp && mv $@.tmp $@


all: $(doc_PDF)

Makefile.depends: $(image_SVG_DATA) $(doc_SOURCES)
	echo -ne "# Build-time dependencies:\n\n" > $@.tmp
	for f in $(image_SVG_DATA); do \
		out=`echo $$f | sed -e 's/.svg/.png/g'`; \
		echo -ne "$$out: $$f\n\t\$$(svg2png)\n\n" >> $@.tmp; \
	done
	mv $@.tmp $@

include Makefile.depends

pdf: $(doc_PDF)
$(doc_PDF): $(doc_SOURCES) $(image_PNG_DATA)
	rst2pdf-slide -s $(THEME) -o $@ $<

clean:
	-rm -f Makefile.depends

.PHONY: clean pdf
