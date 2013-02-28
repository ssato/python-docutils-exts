#! /bin/bash
#
# Convert .xcf files to .png images w/ gimp (batch mode).
#
# Ref. http://www.gimptalk.com/index.php?/topic/46715-batch-convert-xcf-to-png/
#
set -e

_gimp_batch_conv () {
    gimp -n -i -b - <<EOF
(let* ((infile "$1")
       (image (car (gimp-file-load RUN-NONINTERACTIVE infile infile)))
       (layer (car (gimp-image-merge-visible-layers image CLIP-TO-IMAGE)))
       ; (filename (string-append (substring infile 0 (- (string-length infile) 4)) ".png")))
       (filename "$2"))
(gimp-file-save RUN-NONINTERACTIVE image layer filename filename)
(gimp-image-delete image))
(gimp-quit 0)
EOF
}

infile=$1
if test "x$infile" = "x"; then
    echo "Usage: $0 INPUT_FILE_XCF [OUTPUT_FILE_PNG]"
else
    outfile=$2
    if test "x$outfile" = "x"; then
        outfile=${infile/.xcf/.png}
    fi
    _gimp_batch_conv $infile $outfile
fi

# vim:sw=4:ts=4:et:
