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


all: $(slide_PDF)

include /usr/share/docutils-exts-common/Makefile.common

pdf: $(slide_PDF)
$(slide_PDF): $(slide_SOURCES) $(image_PNG_DATA) $(include_DATA)
	rst2pdf-slide $(rst2pdf_OPTIONS) -o $@ $<

clean:
	-rm -f $(slide_ODT) Makefile.depends

.PHONY: clean pdf slide
