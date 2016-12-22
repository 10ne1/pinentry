#!/bin/bash

./autogen.sh
LDFLAGS=-static ./configure --enable-maintainer-mode


# replace $(COMMON_LIBS) with our locally compiled static libs
sed -i -e 's/\$(COMMON_LIBS)/\..\/..\/libgpg-error\/src\/.libs\/libgpg-error.a \\\
	..\/..\/libassuan\/src\/.libs\/libassuan.a \\\
	/g' emacs/Makefile

make
