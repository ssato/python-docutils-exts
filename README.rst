About 
=======

This package provides some tools to convert reStructured text files for
documentations and presentation slides, to PDF and ODT files w/ rst2odt in
python-docutils and rst2pdf. And there are also some style data files included.

Tools
=======

* rst2odt-wrapper: rst2odt wrapper to convert .rst to ODT and PDF outputs
* rst2pdf-slide: rst2pdf wrapper to generate presentation slide PDF from .rst

and 

* /usr/share/rst2odt/aux/Makefile: Makefile to generate DOC and PDF w/ using
  rst2odt-wrapper. Also it streamlines the convertion and optimizatio process
  of image files ({.xcf,.svg} -> .png)

Usage
=======

/usr/share/rst2odt/aux/Makefile
---------------------------------

1. Arrange Makefile to define '$(NAME)' and include this Makefile in your rst
   sources directly. For example,

::

   $ cat << EOF >> Makefile
   NAME = sample-doc
   include /usr/share/rst2odt/aux/Makefile
   EOF
   $

2. run make to build PDF and/or Word (doc) outputs:

::

   $ make  # to build PDF output or 'make doc' to build Word file.

SEE ALSO:

* examples/

  * Outputs: sample-doc.pdf
  * sources: \*.rst, images/\*.png, logs/\*.txt, data/\*.txt

rst2odt-wrapper
------------------

Usage:

::

  /usr/bin/rst2odt-wrapper [Options] INPUT_RST [OUTPUT_ODT]

rst2pdf-slide
------------------

Likewise. I recommend to use /usr/share/rst2pdf/aux/Makefile instead of direct
invocation of it.

How to build and install
=========================

::

  $ autoreconf -vfi && ./configure && make srpm
  $ mock [-r <your target fedora/rhel dist>] <built source rpm>
  $ sudo yum install /var/lib/mock/<your target fedora/rhel dist>/result/<built binary noarch rpm>

How to customize styles
=========================

rst2pdf
---------

Copy stylesheet files under /usr/share/rst2pdf/styles/\* to somewhere and
customize it, or create your version based on the default version rst2pdf dumps
such like the followings:

.. code-block:: console

   rst2pdf --print-stylesheet > custom.style

And if you're using /usr/share/rst2pdf/aux/Makefile by including it in your
makefile, edit your makefile to add the line like:

.. code-block:: make

   rst2pdf_OPTIONS = -s /path/to/your/custom/stylesheet.style

SEE ALSO: http://rst2pdf.ralsina.com.ar/handbook.html#styles

rst2odt
---------

Customize styles/styles.xml; replace fonts optimized for your needs, for example.

Also you can make a sample ODT file and unzipped/replaced my ones w/ it.

SEE ALSO: http://cutter.rexx.com/~dkuhlman/odt.html

License
=========

Copyright (C) Satoru SATOH <ssato at redhat.com>
License: MIT

Images under usr/share/rst2pdf/images, used for rst2pdf-slide are based on:
http://christmasstockimages.com/free/winter/slides/frosty_snow.htm, which is
distributed under Creative Commons Attribution 3.0 License.

# vim:sw=2:ts=2:et:
