# Makefile to build doc (odt) from rst sources

ifndef NAME
$(error Usage: make NAME=<DOCUMENT_NAME>)
endif

doc_ODT		?= $(NAME).odt
doc_PDF		?= $(NAME).pdf
doc_DOC		?= $(NAME).doc

STYLE	?= NULL
rst2odt_OPTIONS	?=

# NOTE: If the file name '$(doc_TOC_SOURCE)' is defined, that file becomes an
# input for rst2odt-wrapper. Otherwise, the head of `$(sort $(wildcard *.rst))`
# will be used as an input.
#doc_TOC_SOURCE	=

log_DATA	?= $(wildcard logs/*.txt) $(wildcard logs/common/*.txt)
doc_SOURCES	?= $(doc_TOC_SOURCE) $(sort $(wildcard *.rst))

imagesdir	?= images
image_SVG_DATA	?= $(wildcard $(imagesdir)/*.svg) $(wildcard $(imagesdir)/svg/*.svg) $(wildcard $(imagesdir)/common/svg/*.svg)
image_XCF_DATA	?= $(wildcard $(imagesdir)/*.xcf) $(wildcard $(imagesdir)/xcf/*.xcf) $(wildcard $(imagesdir)/common/xcf/*.xcf)
image_PNG_DATA	?= $(wildcard $(imagesdir)/*.png) $(image_SVG_DATA:.svg=.png) $(image_XCF_DATA:.xcf=.png)
image_PNG_OPT_LEVEL ?= 7

# svg -> png
optpng = optipng -o$(image_PNG_OPT_LEVEL) -fix -force $@.tmp && mv $@.tmp $@
svg2png = inkscape -e $@.tmp $< && $(optpng)
xcf2png = gimp_batch_convert_xcf2png.sh $< $@ && mv -f $@ $@.tmp && $(optpng)

# rst -> odt
ifeq ($(STYLE),NULL)
_rst2odt = rst2odt-wrapper -v $(rst2odt_OPTIONS)
else
_rst2odt = rst2odt-wrapper -v -s $(STYLE) $(rst2odt_OPTIONS)
endif


all: $(doc_PDF)

Makefile.depends: $(image_SVG_DATA) $(image_XCF_DATA) $(doc_SOURCES)
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

$(doc_ODT): $(doc_SOURCES) $(image_PNG_DATA) $(log_DATA)
	$(_rst2odt) $< $@


pdf: $(doc_PDF)
$(doc_PDF): $(doc_ODT)
	unoconv -f pdf -o $@ $<

doc: $(doc_DOC)
$(doc_DOC): $(doc_ODT)
	unoconv -f doc -o $@ $<


clean:
	-rm -f $(doc_ODT) Makefile.depends

.PHONY: clean pdf doc
