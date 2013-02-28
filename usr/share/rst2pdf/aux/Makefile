# Makefile to build slide (pdf) from rst sources

ifndef NAME
$(error Usage: make NAME=<DOCUMENT_NAME>)
endif

slide_PDF		?= $(NAME).pdf

rst2pdf_OPTIONS	?=

# NOTE: If the file name '$(slide_TOC_SOURCE)' is defined, that file becomes an
# input for rst2pdf-slide. Otherwise, the head of `$(sort $(wildcard *.rst))`
# will be used as an input.
#slide_TOC_SOURCE	=

include_DATA	?= $(wildcard include/*.txt) $(wildcard include/common/*.txt)
slide_SOURCES	?= $(slide_TOC_SOURCE) $(sort $(wildcard *.rst))

imagesdir	?= images
image_SVG_DATA	?= $(wildcard $(imagesdir)/*.svg) $(wildcard $(imagesdir)/svg/*.svg) $(wildcard $(imagesdir)/common/svg/*.svg)
image_XCF_DATA	?= $(wildcard $(imagesdir)/*.xcf) $(wildcard $(imagesdir)/xcf/*.xcf) $(wildcard $(imagesdir)/common/xcf/*.xcf)
image_PNG_DATA	?= $(wildcard $(imagesdir)/*.png) $(image_SVG_DATA:.svg=.png) $(image_XCF_DATA:.xcf=.png)
image_PNG_OPT_LEVEL ?= 7

# svg -> png
optpng = optipng -o$(image_PNG_OPT_LEVEL) -fix -force $@.tmp && mv $@.tmp $@
svg2png = inkscape -e $@.tmp $< && $(optpng)
xcf2png = gimp_batch_convert_xcf2png.sh $< $@ && mv -f $@ $@.tmp && $(optpng)


all: $(slide_PDF)

Makefile.depends: $(image_SVG_DATA) $(image_XCF_DATA) $(slide_SOURCES)
	echo -ne "# Build-time dependencies:\n\n" > $@.tmp
	for f in $(image_SVG_DATA); do \
		out=`echo $$f | sed -e 's/\.svg/.png/g'`; \
		echo -ne "$$out: $$f\n\t\$$(svg2png)\n\n" >> $@.tmp; \
	done
	for f in $(image_XCF_DATA); do \
		out=`echo $$f | sed -e 's/\.xcf/.png/g'`; \
		echo -ne "$$out: $$f\n\t\$$(xcf2png)\n\n" >> $@.tmp; \
	done
	mv $@.tmp $@

include Makefile.depends


pdf: $(slide_PDF)
$(slide_PDF): $(slide_SOURCES) $(image_PNG_DATA) $(include_DATA)
	rst2pdf-slide $(rst2pdf_OPTIONS) -o $@ $<

clean:
	-rm -f $(slide_ODT) Makefile.depends

.PHONY: clean pdf slide
