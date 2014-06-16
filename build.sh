#! /bin/bash
#
# USAGE: [_SNAPSHOT_BUILD=1] ./build.sh
#
set -e

version=0.0.4
snapshot_build=${_SNAPSHOT_BUILD:-0}

if test "x$snapshot_build" = "x1"; then
    version="$version.$(date +%Y%m%d)"
fi

echo "[Info] Version set to ${version}. Now preparing confgiure.ac ..."
sed "s/@VERSION@/${version}/g" configure.ac.in > configure.ac

echo "[Info] Start to build SRPM ..."
autoreconf -vfi && ./configure && make srpm

# vim:sw=4:ts=4:et:
