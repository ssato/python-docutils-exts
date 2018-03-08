abs_builddir    ?= $(shell pwd)

rpmdir = $(abs_builddir)/rpm
rpmdirs = $(addprefix $(rpmdir)/,RPMS BUILD BUILDROOT)

rpmbuild = rpmbuild \
--quiet \
--define "_topdir $(rpmdir)" \
--define "_srcrpmdir $(abs_builddir)" \
--define "_sourcedir $(abs_builddir)" \
--define "_buildroot $(rpmdir)/BUILDROOT" \
$(NULL)

$(rpmdirs):
	$(AM_V_at)$(MKDIR_P) $@

abs_top_srcdir  ?= .
rpm srpm: $(abs_top_srcdir)/pkg/package.spec dist $(rpmdirs)

rpm:
	$(AM_V_GEN)$(rpmbuild) -bb $<
	$(AM_V_at)mv $(rpmdir)/RPMS/*/*.rpm $(abs_builddir)

srpm:
	$(AM_V_GEN)$(rpmbuild) -bs $<

.PHONY: rpm srpm
