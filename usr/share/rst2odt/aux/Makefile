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

doc_DATADIRS	?= logs data common common/*

txt_DATA	?= $(foreach dir,$(doc_DATADIRS),$(wildcard $(dir)/*.txt $(dir)/*.rst))
doc_SOURCES	?= $(doc_TOC_SOURCE) $(sort $(wildcard *.rst))


all: pdf

include /usr/share/docutils-exts-common/Makefile.common
-include /usr/share/rst2odt/Makefile.bootstrap

# rst -> odt
ifeq ($(STYLE),NULL)
_rst2odt = rst2odt-wrapper -v $(rst2odt_OPTIONS)
else
_rst2odt = rst2odt-wrapper -v -s $(STYLE) $(rst2odt_OPTIONS)
endif

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
