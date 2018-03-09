EXTRA_DIST = README.rst pkg/pkginfo.sh pkg/rpm.mk pkg/package.spec.in

EXTRA_DIST += \
$(wildcard examples/rst2odt/*) \
$(wildcard examples/rst2odt/images/*/*.*) \
$(wildcard examples/rst2odt/logs/*.txt) \
$(wildcard examples/rst2pdf/*) \
$(NULL)

TESTS = examples/runtests.sh

dist_noinst_DATA = $(wildcard examples/*.sh)

abs_srcdir  ?= .
include $(abs_srcdir)/pkg/rpm.mk

dist_bin_SCRIPTS = $(wildcard usr/bin/*)

pkgdata0dir = $(sysconfdir)/python-docutils-exts/rst2odt.d
dist_pkgdata0_DATA = $(wildcard etc/python-docutils-exts/rst2odt.d/*)

pkgdata1dir = $(sysconfdir)/python-docutils-exts/rst2pdf.d
dist_pkgdata1_DATA = $(wildcard etc/python-docutils-exts/rst2pdf.d/*)

pkgdata2dir = $(datadir)/rst2odt/aux
dist_pkgdata2_DATA = $(wildcard usr/share/rst2odt/aux/*)

pkgdata3dir = $(datadir)/rst2odt/styles
dist_pkgdata3_DATA = $(wildcard usr/share/rst2odt/styles/*)

pkgdata4dir = $(datadir)/rst2pdf/images
dist_pkgdata4_DATA = $(wildcard usr/share/rst2pdf/images/*)

pkgdata5dir = $(datadir)/rst2pdf/styles/doc
dist_pkgdata5_DATA = $(wildcard usr/share/rst2pdf/styles/doc/*)

pkgdata6dir = $(datadir)/rst2pdf/styles/slides
dist_pkgdata6_DATA = $(wildcard usr/share/rst2pdf/styles/slides/*)

pkgdata7dir = $(datadir)/rst2pdf/templates/slide
dist_pkgdata7_DATA = $(wildcard usr/share/rst2pdf/templates/slide/*)

pkgdata8dir = $(datadir)/rst2pdf/aux
dist_pkgdata8_DATA = $(wildcard usr/share/rst2pdf/aux/*)

pkgdata9dir = $(datadir)/docutils-exts-common
dist_pkgdata9_DATA = usr/share/docutils-exts-common/Makefile.common pkg/rpm.mk

pkgdata10dir = $(datadir)/docutils-exts-common/templates
dist_pkgdata10_DATA = usr/share/docutils-exts-common/templates/Makefile.j2

pkgdata11dir = $(datadir)/rst2odt/templates/default
dist_pkgdata11_DATA = $(wildcard usr/share/rst2odt/templates/default/*)

pkgdata12dir = $(datadir)/rst2pdf/templates/default
dist_pkgdata12_DATA = $(wildcard usr/share/rst2pdf/templates/default/*)

install-exec-hook:
	(cd $(DESTDIR)$(bindir) && $(LN_S) rst2pdf-slide rst2pdf-doc)

# vim:sw=4:ts=4:noet:
