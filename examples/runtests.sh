#! /bin/bash
set -ex

curdir=${0%/*}
cd ${curdir:?}

source testenv.sh

make -C rst2odt/ pkgdatadir=../../usr/share/rst2odt/aux/
make -C rst2pdf-slide/ pkgdatadir=../../usr/share/rst2pdf/aux/
