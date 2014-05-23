EXTRA_DIST = README.rst python-docutils-exts.spec.in rpm.mk

EXTRA_DIST += \
$(wildcard examples/rst2odt/*) \
$(wildcard examples/rst2odt/images/*/*.*) \
$(wildcard examples/rst2odt/logs/*.txt) \
$(wildcard examples/rst2pdf/*) \
$(NULL)

abs_srcdir  ?= .
include $(abs_srcdir)/rpm.mk

dist_bin_SCRIPTS = $(wildcard usr/bin/*)

pkgdata0dir = /etc/python-docutils-exts/rst2odt.d
dist_pkgdata0_DATA = $(wildcard etc/python-docutils-exts/rst2odt.d/*)

pkgdata1dir = /etc/python-docutils-exts/rst2pdf.d
dist_pkgdata1_DATA = $(wildcard etc/python-docutils-exts/rst2pdf.d/*)

pkgdata2dir = /usr/share/rst2odt/aux
dist_pkgdata2_DATA = $(wildcard usr/share/rst2odt/aux/*)

pkgdata3dir = /usr/share/rst2odt/styles
dist_pkgdata3_DATA = $(wildcard usr/share/rst2odt/styles/*)

pkgdata4dir = /usr/share/rst2pdf/images
dist_pkgdata4_DATA = $(wildcard usr/share/rst2pdf/images/*)

pkgdata5dir = /usr/share/rst2pdf/styles/doc
dist_pkgdata5_DATA = $(wildcard usr/share/rst2pdf/styles/doc/*)

pkgdata6dir = /usr/share/rst2pdf/styles/slides
dist_pkgdata6_DATA = $(wildcard usr/share/rst2pdf/styles/slides/*)

pkgdata7dir = /usr/share/rst2pdf/templates/slide
dist_pkgdata7_DATA = $(wildcard usr/share/rst2pdf/templates/slide/*)

pkgdata8dir = /usr/share/rst2pdf/aux
dist_pkgdata8_DATA = $(wildcard usr/share/rst2pdf/aux/*)

pkgdata9dir = /usr/share/docutils-exts-common
dist_pkgdata9_DATA = usr/share/docutils-exts-common/Makefile.common

pkgdata10dir = /usr/share/docutils-exts-common/templates
dist_pkgdata10_DATA = usr/share/docutils-exts-common/templates/Makefile.j2

pkgdata11dir = /usr/share/rst2odt/templates/default
dist_pkgdata11_DATA = $(wildcard usr/share/rst2odt/templates/default/*)

pkgdata12dir = /usr/share/rst2pdf/templates/default
dist_pkgdata12_DATA = $(wildcard usr/share/rst2pdf/templates/default/*)

MKDIR_P	?= mkdir -p
LN_S	?= ln -s

install-exec-hook:
	(cd $(DESTDIR)$(bindir) && $(LN_S) rst2pdf-slide rst2pdf-doc)

# vim:sw=4:ts=4:noet:
