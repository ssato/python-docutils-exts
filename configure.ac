AC_INIT([python-docutils-exts],[0.0.1])
AM_INIT_AUTOMAKE([no-dist-gzip dist-xz foreign subdir-objects tar-pax])

dnl http://www.flameeyes.eu/autotools-mythbuster/automake/silent.html
m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])

dnl TODO: fix autoconf macros used.
AC_PROG_LN_S
m4_ifdef([AC_PROG_MKDIR_P],[AC_PROG_MKDIR_P],[AC_SUBST([MKDIR_P],[mkdir -p])])
m4_ifdef([AC_PROG_SED],[AC_PROG_SED],[AC_SUBST([SED],[sed])])
m4_ifdef([AC_PROG_LN_S],[AC_PROG_LN_S],[AC_SUBST([LN_S],[ln -s])])

AC_CONFIG_FILES([
Makefile
python-docutils-exts.spec
])

AC_OUTPUT
