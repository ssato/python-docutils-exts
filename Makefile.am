EXTRA_DIST = README.rst python-docutils-exts.spec.in rpm.mk

EXTRA_DIST += \
$(wildcard examples/rst2odt/*) \
$(wildcard examples/rst2odt/images/*/*.*) \
$(wildcard examples/rst2odt/logs/*.txt) \
$(wildcard examples/rst2pdf/*) \
$(NULL)

abs_srcdir  ?= .
include $(abs_srcdir)/rpm.mk

dist_bin_SCRIPTS = \
usr/bin/rst2odt-wrapper \
usr/bin/rst2pdf-slide \
usr/bin/gimp_batch_convert_xcf2png.sh \
$(NULL)

pkgdata0dir = /etc/python-docutils-exts/rst2odt.d
dist_pkgdata0_DATA = \
etc/python-docutils-exts/rst2odt.d/00_default.conf \
$(NULL)

pkgdata1dir = /etc/python-docutils-exts/rst2pdf.d
dist_pkgdata1_DATA = \
etc/python-docutils-exts/rst2pdf.d/00_default.conf \
$(NULL)

pkgdata2dir = /usr/share/rst2odt/aux
dist_pkgdata2_DATA = \
usr/share/rst2odt/aux/Makefile \
$(NULL)

pkgdata3dir = /usr/share/rst2odt/styles
dist_pkgdata3_DATA = \
usr/share/rst2odt/styles/ja.odt \
$(NULL)

pkgdata4dir = /usr/share/rst2pdf/images
dist_pkgdata4_DATA = \
usr/share/rst2pdf/images/std_presentation_coverpage.png \
usr/share/rst2pdf/images/std_presentation_background.png \
$(NULL)

pkgdata5dir = /usr/share/rst2pdf/styles/doc
dist_pkgdata5_DATA = \
usr/share/rst2pdf/styles/doc/std.style \
$(NULL)

pkgdata6dir = /usr/share/rst2pdf/styles/slides
dist_pkgdata6_DATA = \
usr/share/rst2pdf/styles/slides/std.style \
$(NULL)

pkgdata7dir = /usr/share/rst2pdf/templates/slide
dist_pkgdata7_DATA = \
usr/share/rst2pdf/templates/slide/std.coverpage.tmpl \
$(NULL)

pkgdata8dir = /usr/share/rst2pdf/aux
dist_pkgdata8_DATA = \
usr/share/rst2pdf/aux/Makefile \
$(NULL)


MKDIR_P ?= mkdir -p
SED ?= sed
LN_S	?= ln -s


install-exec-hook:
	(cd $(DESTDIR)$(bindir) && $(LN_S) rst2pdf-slide rst2pdf-doc)

# vim:sw=4:ts=4:noet:
